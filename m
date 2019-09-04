From: "Ramuthevar, Vadivel MuruganX"
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: Re: [PATCH v3 2/2] phy: intel-lgm-sdxc: Add support for SDXC PHY
Date: Wed, 4 Sep 2019 21:38:36 +0800
Message-ID: <a36dcf94-4636-1742-4ae6-60cf2c03c7f5@linux.intel.com>
References: <20190904062719.37462-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20190904062719.37462-2-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20190904123957.GM2680@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190904123957.GM2680@smile.fi.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: kishon@ti.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, cheol.yong.kim@intel.com, qi-ming.wu@intel.com, peter.harliman.liem@intel.com
List-Id: devicetree@vger.kernel.org

Hi Andy,

  Thank you for the review comments .

On 4/9/2019 8:39 PM, Andy Shevchenko wrote:
> On Wed, Sep 04, 2019 at 02:27:19PM +0800, Ramuthevar,Vadivel MuruganX wrote:
>> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>>
>> Add support for SDXC PHY on Intel's Lightning Mountain SoC.
> What's the difference to eMMC PHY?
> Can they share the same / similar code?
eMMC and SDXC interface controller share the common driver since IP block
of the vendor(SDHC-ARASAN) is same, where as PHY is different. The PHY 
is designed by Intel itself to support
specific eMMC card and SD/SDIO card specific. e.g: PAD, CLK, driver 
strength..etc.

IP block of the PHY  is different module for eMMC and SDXC to adapt the 
controllers, that is reason we have different drivers.
---
With Best Regards
Vadivel
