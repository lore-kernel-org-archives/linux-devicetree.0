From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/9] dt-bindings: regulator: Add document for MediaTek
 MT6380 regulator
Date: Thu, 8 Jun 2017 17:01:30 -0500
Message-ID: <20170608220130.wcsustafqzdzx3tj@rob-hp-laptop>
References: <cover.1496425268.git.sean.wang@mediatek.com>
 <8764fea31386da58518dff7f5e2170dcd8f6c167.1496425268.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8764fea31386da58518dff7f5e2170dcd8f6c167.1496425268.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sean.wang@mediatek.com
Cc: matthias.bgg@gmail.com, mark.rutland@arm.com, lgirdwood@gmail.com, broonie@kernel.org, jamesjj.liao@mediatek.com, henryc.chen@mediatek.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, chen.zhong@mediatek.com, chenglin.xu@mediatek.com, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Jun 03, 2017 at 01:55:43AM +0800, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> add dt-binding document for MediaTek MT6380 PMIC
> 
> Signed-off-by: Chenglin Xu <chenglin.xu@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  .../bindings/regulator/mt6380-regulator.txt        | 90 ++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mt6380-regulator.txt
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mt6380-regulator.txt b/Documentation/devicetree/bindings/regulator/mt6380-regulator.txt
> new file mode 100644
> index 0000000..9affeab
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mt6380-regulator.txt
> @@ -0,0 +1,90 @@
> +Mediatek MT6380 Regulator Driver
> +
> +All voltage regulators are defined as subnodes of the regulators node. A list
> +of regulators provided by this controller are defined as subnodes of the
> +PMIC's node. Each regulator is named according to its regulator type,
> +buck_<name> and ldo_<name>. The definition for each of these nodes is defined
> +using the standard binding for regulators at
> +Documentation/devicetree/bindings/regulator/regulator.txt.
> +
> +The valid names for regulators are::
> +BUCK:
> +  buck_vcore1, buck_vcore, buck_vrf
> +LDO:
> +  ldo_vmldo ,ldo_valdo , ldo_vphyldo, ldo_vddrldo, ldo_vtldo

'ldo' twice in every name is redundant.

Use of '_' is discouraged, but if that's what prior PMICs did, it's 
okay.

> +
> +Example:
> +
> +	mt6380regulator: mt6380regulator {

just "regulators {"

> +		compatible = "mediatek,mt6380-regulator";
> +
> +		mt6380_vcpu_reg: buck_vcore1 {
> +			regulator-name = "vcpu";
> +			regulator-min-microvolt = < 600000>;
> +			regulator-max-microvolt = <1393750>;
> +			regulator-ramp-delay = <6250>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +		};
> +
> +		mt6380_vcore_reg: buck_vcore {
> +			regulator-name = "vcore";
> +			regulator-min-microvolt = <600000>;
> +			regulator-max-microvolt = <1393750>;
> +			regulator-ramp-delay = <6250>;
> +		};
> +
> +		mt6380_vrf_reg: buck_vrf {
> +			regulator-name = "vrf";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1575000>;
> +			regulator-ramp-delay = <0>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +		};
> +
> +		mt6380_vm_reg: ldo_vmldo {
> +			regulator-name = "vmldo";
> +			regulator-min-microvolt = <1050000>;
> +			regulator-max-microvolt = <1400000>;
> +			regulator-ramp-delay = <0>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +		};
> +
> +		mt6380_va_reg: ldo_valdo {
> +			regulator-name = "valdo";
> +			regulator-min-microvolt = <2200000>;
> +			regulator-max-microvolt = <3300000>;
> +			regulator-ramp-delay = <0>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +		};
> +
> +		mt6380_vphy_reg: ldo_vphyldo {
> +			regulator-name = "vphyldo";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-ramp-delay = <0>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +		};
> +
> +		mt6380_vddr_reg: ldo_vddrldo {
> +			regulator-name = "vddr";
> +			regulator-min-microvolt = <1240000>;
> +			regulator-max-microvolt = <1840000>;
> +			regulator-ramp-delay = <0>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +		};
> +
> +		mt6380_vt_reg: ldo_vtldo {
> +			regulator-name = "vadc18";
> +			regulator-min-microvolt = <2200000>;
> +			regulator-max-microvolt = <3300000>;
> +			regulator-ramp-delay = <0>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +		};
> +	};
> -- 
> 1.9.1
> 
