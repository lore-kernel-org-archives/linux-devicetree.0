From: "Ramuthevar, Vadivel MuruganX"
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: intel-sdxc-phy: Add YAML schema
 for LGM SDXC PHY
Date: Wed, 18 Sep 2019 10:26:11 +0800
Message-ID: <b860d369-fda4-4a20-bba5-4ced420de8aa@linux.intel.com>
References: <20190904062719.37462-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20190917202410.GA6574@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190917202410.GA6574@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: kishon@ti.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, andriy.shevchenko@intel.com, cheol.yong.kim@intel.com, qi-ming.wu@intel.com, peter.harliman.liem@intel.com
List-Id: devicetree@vger.kernel.org

Hi Rob,

     Thank you for the review comments.

On 18/9/2019 4:24 AM, Rob Herring wrote:
> On Wed, Sep 04, 2019 at 02:27:18PM +0800, Ramuthevar,Vadivel MuruganX wrote:
>> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>>
>> Add a YAML schema to use the host controller driver with the
>> SDXC PHY on Intel's Lightning Mountain SoC.
> Same issues on this one as emmc phy.

Agreed!, once clarified the emmc phy comments, let me update further. 
Thanks!

Best Regards
Vadivel
>> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>> ---
>>   changes in v3:
>>     - Rob's review comments addressed and updated the patch
>>     - merged syscon and sdxc yaml file as single file after discussion
>>
>>   changes in v2:
>>     - As per Rob's review comment syscon node entry added instead of reference
>>     - splitted two patches one for syscon and another for sdxc phy
>> ---
>>   .../bindings/phy/intel,lgm-sdxc-phy.yaml           | 69 ++++++++++++++++++++++
>>   1 file changed, 69 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/phy/intel,lgm-sdxc-phy.yaml
