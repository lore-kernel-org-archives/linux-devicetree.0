From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 1/3] ARM: dts: NSP: Enable SFP on bcm958625hr
Date: Mon, 27 Aug 2018 15:36:50 -0700
Message-ID: <6d6e6c18-c713-7d7d-a332-da73cca84cbe@gmail.com>
References: <20180827200344.16158-1-f.fainelli@gmail.com>
 <20180827200344.16158-2-f.fainelli@gmail.com>
 <20180827222646.GF30658@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180827222646.GF30658@n2100.armlinux.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>, Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, "maintainer:BROADCOM IPROC ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, andrew@lunn.ch
List-Id: devicetree@vger.kernel.org

On 08/27/2018 03:26 PM, Russell King - ARM Linux wrote:
> On Mon, Aug 27, 2018 at 01:03:42PM -0700, Florian Fainelli wrote:
>> Enable the SFP connected to port 5 of the switch and wire up all GPIOs
>> to the SFP cage. Because of a hardware limitation of the i2c controller
>> on the iProc SoCs which prevents large i2c (> 256 bytes) transactions to
>> work, we use the i2c-gpio interface instead, which does not have that
>> limitation. This allows us to read the SFP module EEPROM, which would
>> not be possible otherwise since it exceeds that size during a single
>> read transfer.
> 
> We shouldn't exceed 256 bytes, since 256 bytes is the "page" size
> of the EEPROM.  The most that we read in one block is either
> ETH_MODULE_SFF_8079_LEN or (ETH_MODULE_SFF_8472_LEN - 
> ETH_MODULE_SFF_8079_LEN), both of which result in no more than 256
> byte reads.

You are right, I got things mixed up here, the controller's limitation
is actually 63 bytes per transfer, I will be rewording the commit
message accordingly.
-- 
Florian
