From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] Enable PCIe PHY support in Cygnus
Date: Tue, 01 Dec 2015 15:12:41 -0800
Message-ID: <565E2969.7000500@gmail.com>
References: <1447870619-2828-1-git-send-email-rjui@broadcom.com> <5654FCF5.40406@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5654FCF5.40406@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 24/11/15 16:12, Florian Fainelli wrote:
> On 18/11/15 10:16, Ray Jui wrote:
>> This patch enales PCIe PHY in device tree for Broadcom Cygnus based platforms
>>
>> This patch is developed based on v4.4-rc1 and available here:
>> https://github.com/Broadcom/cygnus-linux/tree/cygnus-pcie-phy-dt-v1
>>
>> Ray Jui (1):
>>   ARM: dts: enable PCIe PHY support for Cygnus
> 
> Applied to devicetree/next with Scott's Acked-by, thanks!

This caused the DTC compiler to warn:

Warning (reg_format): "reg" property in /axi/phy@0301d0a0/phy@0 has
invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
Warning (reg_format): "reg" property in /axi/phy@0301d0a0/phy@1 has
invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
Warning (avoid_default_addr_size): Relying on default #address-cells
value for /axi/phy@0301d0a0/phy@0
Warning (avoid_default_addr_size): Relying on default #size-cells value
for /axi/phy@0301d0a0/phy@0
Warning (avoid_default_addr_size): Relying on default #address-cells
value for /axi/phy@0301d0a0/phy@1
Warning (avoid_default_addr_size): Relying on default #size-cells value
for /axi/phy@0301d0a0/phy@1
  CC      drivers/base/power/runtime.o
  DTC     arch/arm/boot/dts/bcm911360k.dtb
  CC      lib/bitmap.o

I added an #address-cells = <0> and #size-cells = <1> to fix this, since
your reg property is a single digit.
-- 
Florian
