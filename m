Return-Path: <SRS0=QIa4=SK=xilinx.com=michals@kernel.org>
From: Michal Simek <michal.simek@xilinx.com>
Subject: Property order rules
Message-ID: <ea35af72-68c6-6f6a-9255-d597b727fac4@xilinx.com>
Date: Mon, 8 Apr 2019 14:55:11 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi,

going through devicetree spec and what's the recommendation of property
order for DT nodes?

Looking for guidance to have right order for all nodes.
Fox example order like this:

#address-cells
#size-cells
#<others>
compatible
status
reg
interrupt-parent
interrupts
clock-names
clocks
power-domains
iommus
X-controller
device-type
generic-properties
vendors-properties

Thanks,
Michal
