Return-Path: <robherring2@gmail.com>
Date: Sun, 18 Mar 2018 07:49:07 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V8 1/9] dt-bindings: Tegra210: add binding documentation
Message-ID: <20180318124907.adfylj6nxfakn3cq@rob-hp-laptop>
References: <1520854838-21779-1-git-send-email-pchandru@nvidia.com>
 <1520854838-21779-2-git-send-email-pchandru@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1520854838-21779-2-git-send-email-pchandru@nvidia.com>
To: Preetham Chandru Ramchandra <pchandru@nvidia.com>
Cc: thierry.reding@gmail.com, tj@kernel.org, cyndis@kapsi.fi, mark.rutland@arm.com, preetham260@gmail.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-ide@vger.kernel.org, vbyravarasu@nvidia.com, pkunapuli@nvidia.com
List-ID: <devicetree@vger.kernel.org>

On Mon, Mar 12, 2018 at 05:10:30PM +0530, Preetham Chandru Ramchandra wrote:
> From: Preetham Ramchandra <pchandru@nvidia.com>

The subject should indicate this is for the AHCI controller.

> 
> This adds bindings documentation for the AHCI controller on Tegra210.
> 
> Signed-off-by: Preetham Chandru R <pchandru@nvidia.com>
> ---
> v8:
> * Add Tegra132: "nvidia,tegra132-ahci", "nvidia,tegra124-ahci".
> * Changed AUX registers to optional.
> * corrected commit message line length.
> * Move phy-name for Tegra210 to optional.
> v7:
> * For Aux register set drop the Tegra210 since this register
>   set also works on Tegra124
> * rephrase the sentence for cml1 clock
> * change the commit subject to include ahci-tegra

Really?

> * drop pll_e since CCF handles it automatically as
>   CML1 is a child clock of it.
> v4:
> * changed the commit message
> * changed 'sata-cold' reset to mandatory for t210 and t124
> * Removed the regulators for T210 since these regulators
>   will be enabled in phy driver.
> v3:
> * Add AUX register.
> v2:
> * change cml1, pll_e and phy regulators as optional
>   for T210.
> ---
>  .../bindings/ata/nvidia,tegra124-ahci.txt          | 36 ++++++++++++++--------
>  1 file changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/ata/nvidia,tegra124-ahci.txt b/Documentation/devicetree/bindings/ata/nvidia,tegra124-ahci.txt
> index 66c83c3e8915..12ab2f723eb0 100644
> --- a/Documentation/devicetree/bindings/ata/nvidia,tegra124-ahci.txt
> +++ b/Documentation/devicetree/bindings/ata/nvidia,tegra124-ahci.txt
> @@ -1,9 +1,10 @@
> -Tegra124 SoC SATA AHCI controller
> +Tegra SoC SATA AHCI controller
>  
>  Required properties :
> -- compatible : For Tegra124, must contain "nvidia,tegra124-ahci".  Otherwise,
> -  must contain '"nvidia,<chip>-ahci", "nvidia,tegra124-ahci"', where <chip>
> -  is tegra132.
> +- compatible : Must be one of:
> +  - Tegra124 : "nvidia,tegra124-ahci"
> +  - Tegra132 : "nvidia,tegra132-ahci", "nvidia,tegra124-ahci"
> +  - Tegra210 : "nvidia,tegra210-ahci"
>  - reg : Should contain 2 entries:
>    - AHCI register set (SATA BAR5)
>    - SATA register set
> @@ -13,8 +14,6 @@ Required properties :
>  - clock-names : Must include the following entries:
>    - sata
>    - sata-oob
> -  - cml1
> -  - pll_e

You can't just remove clocks.

>  - resets : Must contain an entry for each entry in reset-names.
>    See ../reset/reset.txt for details.
>  - reset-names : Must include the following entries:
> @@ -24,9 +23,22 @@ Required properties :
>  - phys : Must contain an entry for each entry in phy-names.
>    See ../phy/phy-bindings.txt for details.
>  - phy-names : Must include the following entries:
> -  - sata-phy : XUSB PADCTL SATA PHY
> -- hvdd-supply : Defines the SATA HVDD regulator
> -- vddio-supply : Defines the SATA VDDIO regulator
> -- avdd-supply : Defines the SATA AVDD regulator
> -- target-5v-supply : Defines the SATA 5V power regulator
> -- target-12v-supply : Defines the SATA 12V power regulator
> +  - For Tegra124 and Tegra132:
> +    - sata-phy : XUSB PADCTL SATA PHY
> +- For Tegra124 and Tegra132:
> +  - hvdd-supply : Defines the SATA HVDD regulator
> +  - vddio-supply : Defines the SATA VDDIO regulator
> +  - avdd-supply : Defines the SATA AVDD regulator
> +  - target-5v-supply : Defines the SATA 5V power regulator
> +  - target-12v-supply : Defines the SATA 12V power regulator
> +
> +Optional properties:
> +- reg :
> +  - AUX register set
> +- clock-names :
> +  - cml1 :
> +    cml1 clock should be defined here if the PHY driver
> +    doesn't manage them. If it does, they should not be.

What driver in what OS? The binding shouldn't depend on the whims of the 
OS. This needs to be defined in terms of what compatibles this is valid 
with or marked as deprecated.

> +- phy-names :
> +  - For T210:
> +    - sata-phy
> -- 
> 2.7.4
> 
