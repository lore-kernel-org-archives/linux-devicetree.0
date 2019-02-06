From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v5 2/2] phy: zynqmp: Add phy driver for xilinx zynqmp phy
 core
Date: Wed, 6 Feb 2019 17:49:09 +0530
Message-ID: <a30caa80-780d-c904-6ece-3398a277c37a@ti.com>
References: <1545140733-20689-1-git-send-email-anurag.kumar.vulisha@xilinx.com>
 <1545140733-20689-3-git-send-email-anurag.kumar.vulisha@xilinx.com>
 <b521679a-0c79-44b1-8a2b-1f3391a362ae@ti.com>
 <BYAPR02MB5591E4BF4C547C3E29D9CF8AA7830@BYAPR02MB5591.namprd02.prod.outlook.com>
 <6f0c2f35-f6cd-88ec-32b9-9be247fab4e5@ti.com>
 <BYAPR02MB5591D126E2290CFCAF335317A7990@BYAPR02MB5591.namprd02.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR02MB5591D126E2290CFCAF335317A7990@BYAPR02MB5591.namprd02.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anurag Kumar Vulisha <anuragku@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "vivek.gautam@codeaurora.org" <vivek.gautam@codeaurora.org>
Cc: Michal Simek <michals@xilinx.com>, "v.anuragkumar@gmail.com" <v.anuragkumar@gmail.com>, sundeep subbaraya <sundeep.lkml@gmail.com>, Ajay Yugalkishore Pandey <APANDEY@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Anurag,

On 23/01/19 9:40 PM, Anurag Kumar Vulisha wrote:
> Hi Kishon,
> 
>> -----Original Message-----
>> From: Kishon Vijay Abraham I [mailto:kishon@ti.com]
>> Sent: Monday, January 21, 2019 11:16 AM
>> To: Anurag Kumar Vulisha <anuragku@xilinx.com>; robh+dt@kernel.org; Mark
>> Rutland <mark.rutland@arm.com>; vivek.gautam@codeaurora.org
>> Cc: Michal Simek <michals@xilinx.com>; v.anuragkumar@gmail.com; sundeep
>> subbaraya <sundeep.lkml@gmail.com>; Ajay Yugalkishore Pandey
>> <APANDEY@xilinx.com>; linux-kernel@vger.kernel.org; linux-arm-
>> kernel@lists.infradead.org; devicetree@vger.kernel.org
>> Subject: Re: [PATCH v5 2/2] phy: zynqmp: Add phy driver for xilinx zynqmp phy core
>>
>> Hi Anurag,
>>
>> On 17/01/19 9:39 PM, Anurag Kumar Vulisha wrote:
>>> Hi Kishon,
>>>
>>>> -----Original Message-----
>>>> From: Kishon Vijay Abraham I [mailto:kishon@ti.com]
>>>> Sent: Wednesday, January 16, 2019 1:38 PM
>>>> To: Anurag Kumar Vulisha <anuragku@xilinx.com>; robh+dt@kernel.org; Mark
>>>> Rutland <mark.rutland@arm.com>; vivek.gautam@codeaurora.org
>>>> Cc: Michal Simek <michals@xilinx.com>; v.anuragkumar@gmail.com; sundeep
>>>> subbaraya <sundeep.lkml@gmail.com>; Ajay Yugalkishore Pandey
>>>> <APANDEY@xilinx.com>; linux-kernel@vger.kernel.org; linux-arm-
>>>> kernel@lists.infradead.org; devicetree@vger.kernel.org
>>>> Subject: Re: [PATCH v5 2/2] phy: zynqmp: Add phy driver for xilinx zynqmp phy core
>>>>
>>>> Hi,
>>>>
>>>> On 18/12/18 7:15 PM, Anurag Kumar Vulisha wrote:
>>>>> ZynqMP SoC has a Gigabit Transceiver with four lanes. All the high
>>>>> speed peripherals such as USB, SATA, PCIE, Display Port and Ethernet
>>>>> SGMII can rely on any of the four GT lanes for PHY layer. This patch
>>>>> adds driver for that ZynqMP GT core.
>>>>>
>>>>> Signed-off-by: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
>>>>> ---
>>>>> Changes in v5:
>>>>> 	1. No functional changes. Added missing Author name
>>>>>
>>>>> Changes in v4:
>>>>> 	1. Moved include/dt-bindings/phy/phy.h into patch 1 as suggested by
>>>>> 	   "Rob Herring"
>>>>>
>>>>> Changes in v3:
>>>>> 	1. Corrected the Documentation as suggested by "Vivek Gautam"
>>>>>
>>>>> Changes in v2:
>>>>> 	1. Fixed the compilation error when compiled phy-zynqmp.c as a module
>>>>> 	2. Added CONFIG_PM macro in phy-zynqmp.c driver
>>>>> ---
>>>>>  drivers/phy/Kconfig            |    8 +
>>>>>  drivers/phy/Makefile           |    1 +
>>>>>  drivers/phy/phy-zynqmp.c       | 1582
>>>> ++++++++++++++++++++++++++++++++++++++++
>>>>>  include/linux/phy/phy-zynqmp.h |   52 ++
>>>>>  4 files changed, 1643 insertions(+)
>>>>>  create mode 100644 drivers/phy/phy-zynqmp.c  create mode 100644
>>>>> include/linux/phy/phy-zynqmp.h
>>>>>
>>>>> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig index
>>>>> 60f949e..7a3c900 100644
>>>>> --- a/drivers/phy/Kconfig
>>>>> +++ b/drivers/phy/Kconfig
>>>>> @@ -40,6 +40,14 @@ config PHY_XGENE
>>>>>  	help
>>>>>  	  This option enables support for APM X-Gene SoC multi-purpose PHY.
>>>>>
>>>>> +config PHY_XILINX_ZYNQMP
>>>>> +	tristate "Xilinx ZynqMP PHY driver"
>>>>> +	depends on ARCH_ZYNQMP
>>>>> +	select GENERIC_PHY
>>>>> +	help
>>>>> +	  Enable this to support ZynqMP High Speed Gigabit Transceiver
>>>>> +	  that is part of ZynqMP SoC.
>>>>> +
>>>>>  source "drivers/phy/allwinner/Kconfig"
>>>>>  source "drivers/phy/amlogic/Kconfig"
>>>>>  source "drivers/phy/broadcom/Kconfig"
>>>>> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile index
>>>>> 0301e25..2335e85 100644
>>>>> --- a/drivers/phy/Makefile
>>>>> +++ b/drivers/phy/Makefile
>>>>> +/**
>>>>> +
>>>>> +/**
>>>>> + * xpsgtr_override_deemph - override PIPE TX de-emphasis
>>>>> + * @phy: pointer to phy
>>>>> + * @plvl: pre-emphasis level
>>>>> + * @vlvl: voltage swing level
>>>>> + *
>>>>> + * Return: None
>>>>> + */
>>>>> +void xpsgtr_override_deemph(struct phy *phy, u8 plvl, u8 vlvl) {
>>>>> +	struct xpsgtr_phy *gtr_phy = phy_get_drvdata(phy);
>>>>> +	struct xpsgtr_dev *gtr_dev = gtr_phy->data;
>>>>> +	static u8 pe[4][4] = { { 0x2, 0x2, 0x2, 0x2 },
>>>>> +			       { 0x1, 0x1, 0x1, 0xFF },
>>>>> +			       { 0x0, 0x0, 0xFF, 0xFF },
>>>>> +			       { 0xFF, 0xFF, 0xFF, 0xFF } };
>>>>> +
>>>>> +	writel(pe[plvl][vlvl],
>>>>> +	       gtr_dev->serdes + gtr_phy->lane * L0_TX_ANA_TM_18_OFFSET +
>>>>> +	       L0_TX_ANA_TM_18);
>>>>> +}
>>>>> +EXPORT_SYMBOL_GPL(xpsgtr_override_deemph);
>>>>
>>>> I thought I gave a feedback to get rid of export symbol. This will make the
>> consumer
>>>> driver tied to this PHY driver.
>>>>
>>>
>>> Thanks a lot for spending your time in reviewing this patch. With the current
>> implementation,
>>> if phy-zynqmp.c driver is not compiled and consumer driver calls
>> xpsgtr_override_deemph()
>>> routine, static inline function in phy-zynqmp.h gets called and error -ENODEV is
>> returned. So,
>>> with the current implementation the consumer driver is already depending on phy-
>> zynqmp.c
>>> driver. Please correct me if  my understanding is wrong
>>
>> If the same consumer is used with 5 different PHYs, we would be adding 5
>> different APIs for PHY functionality. We would also like to avoid the compiling
>> out option if we use something like a multi_v7_defconfig where a single image
>> is used for multiple platforms.
>>
> Thanks for your comment. As of now the Xilinx Display Port driver is designed to work
> with this phy-zynqmp driver (may be generic in future).  Along with Display Port , this
> phy driver is being used by 4 other consumer drivers and compiling phy driver as module
> might fail if it is tightly coupled with Display Port driver.
> 
> Instead , can we use the platform data of the phy->dev to provide the phy platform
> specific API's to the consumer drivers. The consumer drivers will  include the
> phy-zynqmp.h and call dev_get_platdata(&phy->dev) and call the respective phy
> specific APIs. In this way we can get rid of export symbols from driver. The below
> is the pseudo code changes for using platform data. Please let me know your opinion
> on this,

No. What if a consumer use some other PHYs? Try to abstract the interface in
order to use one of the existing PHY APIs.

Thanks
Kishon
> 
> --- a/include/linux/phy/phy-zynqmp.h
> +++ b/include/linux/phy/phy-zynqmp.h
> +struct xpsgtr_pdata 
> +       int (* xpsgtr_override_deemph)(struct phy *phy, u8 plvl, u8 vlvl);
> +       int (* xpsgtr_margining_factor)(struct phy *phy, u8 plvl, u8 vlvl);
> +       int (* xpsgtr_wait_pll_lock)(struct phy *phy);
> +       int (* xpsgtr_usb_crst_assert)(struct phy *phy);
> +       int (* xpsgtr_usb_crst_release)(struct phy *phy);
> +       void *pdata;
> +}; 
> 
> --- a/drivers/phy/phy-zynqmp.c                                                  
> +++ b/drivers/phy/phy-zynqmp.c
> -int xpsgtr_override_deemph(struct phy *phy, u8 plvl, u8 vlvl)                  
> +static int xpsgtr_override_deemph(struct phy *phy, u8 plvl, u8 vlvl)           
>  {                                                                              
>         struct xpsgtr_phy *gtr_phy = phy_get_drvdata(phy);                      
>         struct xpsgtr_dev *gtr_dev = gtr_phy->data;                             
> @@ -327,9 +327,8 @@ int xpsgtr_override_deemph(struct phy *phy, u8 plvl, u8 vlvl)
>                                                                                 
>         return 0;                                                               
>  }                                                                              
> -EXPORT_SYMBOL_GPL(xpsgtr_override_deemph);                                     
>                                                                                 
> -int xpsgtr_margining_factor(struct phy *phy, u8 plvl, u8 vlvl)                 
> +static int xpsgtr_margining_factor(struct phy *phy, u8 plvl, u8 vlvl)          
>  {                                                                              
>         struct xpsgtr_phy *gtr_phy = phy_get_drvdata(phy);                      
>         struct xpsgtr_dev *gtr_dev = gtr_phy->data;                             
> @@ -344,7 +343,6 @@ int xpsgtr_margining_factor(struct phy *phy, u8 plvl, u8 vlvl)
>                                                                                 
>         return 0;                                                               
>  }                                                                              
> -EXPORT_SYMBOL_GPL(xpsgtr_margining_factor);                                    
>                                                                                 
> /**                                                                            
>   * xpsgtr_set_txwidth - This function sets the tx bus width of the lane        
> @@ -1111,6 +1107,13 @@ static int xpsgtr_phy_init(struct phy *phy)              
>         if (gtr_phy->protocol == ICM_PROTOCOL_SGMII)                            
>                 xpsgtr_misc_sgmii(gtr_phy);                                     
>                                                                                 
> +       struct xpsgtr_pdata * pdata =                                           
> +                       kmalloc(sizeof(struct xpsgtr_pdata), GFP_KERNEL);       
> +       pdata->xpsgtr_override_deemph = xpsgtr_override_deemph;                 
> +       pdata->xpsgtr_margining_factor = xpsgtr_margining_factor;               
> +       pdata->xpsgtr_wait_pll_lock = xpsgtr_wait_pll_lock;                     
> +       phy->dev.platform_data = (void *)pdata;                                 
> +                                                                               
>         /* Bring controller out of reset */                                     
>         ret = xpsgtr_controller_release_reset(gtr_phy);                         
>         if (ret != 0) {                                                         
> @@ -1306,6 +1309,8 @@ static int xpsgtr_phy_exit(struct phy *phy)               
>         /* As we are exiting, clear skip_phy_init flag */                       
>         gtr_phy->skip_phy_init = false;                                         
>                                                                                 
> +       kfree(phy->dev.platform_data);                                          
> +                                                                               
>         return 0;                                                               
>  }                    
> 
> Thanks,
> Anurag Kumar Vulisha
> 
