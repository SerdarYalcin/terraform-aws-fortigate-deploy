# //AWS Configuration
variable access_key {"acess key here"}
variable secret_key {"secret acces key here"}

variable "region" {
  default = "eu-central-1"
}

variable "az" {
  default = "eu-central-1a"
}
// IAM role that has proper permission for HA
// Refer to https://docs.fortinet.com/vm/aws/fortigate/6.2/aws-cookbook/6.2.0/229470/deploying-fortigate-vm-active-passive-ha-aws-between-multiple-zones
variable "iam" {
  default = "SessionManager"
}

variable "hasynccidr" {
  default = "192.168.109.16/28"
}

variable "hamgmtcidr" {
  default = "192.168.109.0/28"
}

// Provide the license type for FortiGate-VM Instances, either byol or payg.
variable "license_type" {
  default = "payg"
}

// AMIs are for FGTVM AWS(PAYG) - 7.0.3
variable "fgtvmami" {
  type = map
  default = {
    us-west-2      = "ami-014b0761f581d0e9d"
    us-west-1      = "ami-0e6d4eb48ac4956e0"
    us-east-1      = "ami-099e9f57e31ec423c"
    us-east-2      = "ami-0323df31f5a8f8bd2"
    ap-east-1      = "ami-041983c36b6fbbb0d"
    ap-south-1     = "ami-0f56a870791d33ced"
    ap-northeast-3 = "ami-0fb452b72b910d144"
    ap-northeast-2 = "ami-0efc1e91b7ee9407d"
    ap-southeast-1 = "ami-03bc23b66fb984025"
    ap-southeast-2 = "ami-016f1d1cc2bc0dc18"
    ap-northeast-1 = "ami-0d3ae196f89774c27"
    ca-central-1   = "ami-0d42479c46feab8f7"
    eu-central-1   = "ami-0c0d7785bcc656ea4"
    eu-west-1      = "ami-0c149861a0243badc"
    eu-west-2      = "ami-029ffbc3b4ee2ea69"
    eu-south-1     = "ami-0060556a3c2ee8af3"
    eu-west-3      = "ami-0e8f659f310a04c55"
    eu-north-1     = "ami-0fa18afb10d953432"
    me-south-1     = "ami-0800493574bacdca4"
    sa-east-1      = "ami-00d6b0680d26d5f29"
  }
}


// AMIs are for FGTVM AWS(BYOL) - 7.0.3
variable "fgtvmbyolami" {
  type = map
  default = {
    us-west-2      = "ami-083a0794c27f644cd"
    us-west-1      = "ami-02f74eacda2205a3f"
    us-east-1      = "ami-07ebc2e34d5ce72f4"
    us-east-2      = "ami-056dda2f1e4afb543"
    ap-east-1      = "ami-0311b61685243ba66"
    ap-south-1     = "ami-0a10c8c2f2aaa4ae1"
    ap-northeast-3 = "ami-0f60eaf0461e2136d"
    ap-northeast-2 = "ami-0d20f9116ec8b7b38"
    ap-southeast-1 = "ami-056c0803ff6f6afa5"
    ap-southeast-2 = "ami-0265ba41aa07c3558"
    ap-northeast-1 = "ami-05ac4892f4ee74676"
    ca-central-1   = "ami-00b08287c478c4a98"
    eu-central-1   = "ami-016c74c0462cafba2"
    eu-west-1      = "ami-00844c5dd9a2e4396"
    eu-west-2      = "ami-0ed73511e91ef6e86"
    eu-south-1     = "ami-0295d1b6c0f8b856a"
    eu-west-3      = "ami-061e0f308353b27b1"
    eu-north-1     = "ami-033be08365c1ebed8"
    me-south-1     = "ami-0e5c84edacd14a664"
    sa-east-1      = "ami-07d447912183bc4be"
  }
}


variable "size" {
  default = "c5n.xlarge"
}

//  Existing SSH Key on the AWS 
variable "keyname" {
  default = "Windows"
}

// HTTPS access port
variable "adminsport" {
  default = "8443"
}

variable "activeport1" {
  default = "192.168.99.131"
}

variable "activeport1float" {
  default = "192.168.99.133"
}

variable "activeport1mask" {
  default = "255.255.255.128"
}

variable "activeport2" {
  default = "192.168.100.131"
}

variable "activeport2float" {
  default = "192.168.100.133"
}

variable "activeport2mask" {
  default = "255.255.252.0"
}

variable "activeport3" {
  default = "192.168.109.19"
}

variable "activeport3mask" {
  default = "255.255.255.240"
}

variable "activeport4" {
  default = "192.168.109.3"
}

variable "activeport4mask" {
  default = "255.255.255.240"
}

variable "passiveport1" {
  default = "192.168.99.132"
}

variable "passiveport1mask" {
  default = "255.255.255.128"
}

variable "passiveport2" {
  default = "192.168.100.132"
}

variable "passiveport2mask" {
  default = "255.255.252.0"
}

variable "passiveport3" {
  default = "192.168.109.20"
}

variable "passiveport3mask" {
  default = "255.255.255.240"
}

variable "passiveport4" {
  default = "192.168.109.4"
}

variable "passiveport4mask" {
  default = "255.255.255.240"
}

variable "activeport1gateway" {
  default = "192.168.99.129"
}

variable "activeport4gateway" {
  default = "192.168.109.1"
}

variable "passiveport1gateway" {
  default = "192.168.99.129"
}

variable "passiveport4gateway" {
  default = "192.168.109.1"
}


variable "bootstrap-active" {
  // Change to your own path
  type    = string
  default = "config-active.conf"
}

variable "bootstrap-passive" {
  // Change to your own path
  type    = string
  default = "config-passive.conf"
}

// license file for the active fgt
variable "license" {
  // Change to your own byol license file, license.lic
  type    = string
  default = "license.lic"
}

// license file for the passive fgt
variable "license2" {
  // Change to your own byol license file, license2.lic
  type    = string
  default = "license2.lic"
}

