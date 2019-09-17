From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: intel-sdxc-phy: Add YAML schema
 for LGM SDXC PHY
Date: Tue, 17 Sep 2019 15:24:10 -0500
Message-ID: <20190917202410.GA6574@bogus>
References: <20190904062719.37462-1-vadivel.muruganx.ramuthevar@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190904062719.37462-1-vadivel.muruganx.ramuthevar@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Ramuthevar,Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
Cc: kishon@ti.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, andriy.shevchenko@intel.com, cheol.yong.kim@intel.com, qi-ming.wu@intel.com, peter.harliman.liem@intel.com
List-Id: devicetree@vger.kernel.org

On Wed, Sep 04, 2019 at 02:27:18PM +0800, Ramuthevar,Vadivel MuruganX wrote:
> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> 
> Add a YAML schema to use the host controller driver with the
> SDXC PHY on Intel's Lightning Mountain SoC.

Same issues on this one as emmc phy.

> 
> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> ---
>  changes in v3:
>    - Rob's review comments addressed and updated the patch
>    - merged syscon and sdxc yaml file as single file after discussion
> 
>  changes in v2:
>    - As per Rob's review comment syscon node entry added instead of reference
>    - splitted two patches one for syscon and another for sdxc phy
> ---
>  .../bindings/phy/intel,lgm-sdxc-phy.yaml           | 69 ++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/intel,lgm-sdxc-phy.yaml
