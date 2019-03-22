From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v6 0/3] Stingray USB PHY driver support
Date: Fri, 22 Mar 2019 09:42:03 -0700
Message-ID: <1f910861-7d3b-63ad-da79-9515eae2b230@gmail.com>
References: <1552986944-3398-1-git-send-email-srinath.mannam@broadcom.com>
 <7490f894-3c0b-c7cd-5ff0-4eea6ea2c199@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7490f894-3c0b-c7cd-5ff0-4eea6ea2c199@broadcom.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Scott Branden <scott.branden@broadcom.com>, Srinath Mannam <srinath.mannam@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: Tejun Heo <tj@kernel.org>, Jayachandran C <jnair@caviumnetworks.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 3/19/19 11:38 AM, Scott Branden wrote:
> Thanks Srinath and Rob - patch series looks good now.
> 
> patch series,
> 
> Acked-by: Scott Branden <scott.branden@broadcom.com>
> 

Kishon, can you let me know when you apply patches 1 and 2 so I can
queue up patch 3 for inclusion the 5.2 ARM SoC pull request? Thanks!

> 
> On 2019-03-19 2:15 a.m., Srinath Mannam wrote:
>> These patches add Stingray USB PHY driver and its corresponding
>> DT nodes with documentation.
>>
>> This patch set is based on Linux-5.0-rc2.
>>
>> Changes from v5:
>>    - Removed redundant address and size cells in DT nodes.
>>
>> Changes from v4:
>>    - Addressed Rob Herring review comments
>>       - Removed child nodes and added #phy-cells 1
>>       - Added xlate function to get phy using phandle argument.
>>
>> Changes from v3:
>>    - Addressed Rob Herring review comments
>>       - Changed compatible strings.
>>       - updated driver based on new compatible strings.
>>
>> Changes from v2:
>>    - Addressed Kishon review comments
>>    - Updated patchset to Linux-5.0-rc2
>>
>> Changes from v1:
>>    - Addressed Kishon review comments
>>    - phy init call return value handle
>>    Srinath Mannam (3):
>>    dt-bindings: phy: Add Stingray USB PHY binding document
>>    phy: sr-usb: Add Stingray USB PHY driver
>>    arm64: dts: Add USB DT nodes for Stingray SoC
>>
>>   .../bindings/phy/brcm,stingray-usb-phy.txt         |  32 ++
>>   .../boot/dts/broadcom/stingray/stingray-usb.dtsi   |  72 ++++
>>   .../arm64/boot/dts/broadcom/stingray/stingray.dtsi |   1 +
>>   drivers/phy/broadcom/Kconfig                       |  11 +
>>   drivers/phy/broadcom/Makefile                      |   1 +
>>   drivers/phy/broadcom/phy-bcm-sr-usb.c              | 393
>> +++++++++++++++++++++
>>   6 files changed, 510 insertions(+)
>>   create mode 100644
>> Documentation/devicetree/bindings/phy/brcm,stingray-usb-phy.txt
>>   create mode 100644
>> arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi
>>   create mode 100644 drivers/phy/broadcom/phy-bcm-sr-usb.c
>>


-- 
Florian
