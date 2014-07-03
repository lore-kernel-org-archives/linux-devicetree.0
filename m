From: sviau@codeaurora.org
Subject: Re: [RFC] drm/msm: DT support for 8960/8064
Date: Thu, 3 Jul 2014 16:36:44 -0000
Message-ID: <6a8e76ef7948b5f7f032faac8418f993.squirrel@www.codeaurora.org>
References: <1404241055-3579-1-git-send-email-robdclark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1404241055-3579-1-git-send-email-robdclark@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

> Now that we (almost) have enough dependencies in place (MMCC, RPM, etc),
> add necessary DT support so that we can use drm/msm on upstream kernel.
>
> Signed-off-by: Rob Clark <robdclark@gmail.com>
> ---
> Commence bikeshedding :-)
>
<snip>
> diff --git a/Documentation/devicetree/bindings/drm/msm/hdmi.txt
> b/Documentation/devicetree/bindings/drm/msm/hdmi.txt
> new file mode 100644
> index 0000000..051a49f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/drm/msm/hdmi.txt
> @@ -0,0 +1,43 @@
> +Qualcomm adreno/snapdragon hdmi output
> +
> +Required properties:
> +- compatible: "qcom,hdmi-tx-8x60", "qcom,hdmi-tx-8960",
> "qcom,hdmi-tx-8x74"
> +- reg: Physical base address and length of the controller's registers.

Since you are adding "qcom,hdmi-tx-8x74" (separate address space for PHY
registers) in the compatible entry, how about this for the register
description:
- reg: Physical base address and length of the controllers' registers.
- reg-names: names corresponding to the defined register sets,
    - "core_physical": HDMI Core registers
    - (optional) "phy_physical": HDMI PHY registers

> +- interrupts: The interrupt outputs from the controller.
> +- clocks: device clocks
> +  See ../clocks/clock-bindings.txt for details.
> +- qcom,hdmi-tx-ddc-clk: ddc clk pin
> +- qcom,hdmi-tx-ddc-data: ddc data pin
> +- qcom,hdmi-tx-hpd: hpd pin
> +- core-vdda-supply: phandle to supply regulator
> +- hdmi-mux-supply: phandle to mux regulator
> +
> +Optional properties:
> +- qcom,hdmi-tx-mux-en: hdmi mux enable pin
> +- qcom,hdmi-tx-mux-sel: hdmi mux select pin
> +
> +Example:
> +
> +/ {
> +	...
> +
> +	hdmi: qcom,hdmi-tx-8960@4a00000 {
> +		compatible =3D "qcom,hdmi-tx-8960";
> +		reg-names =3D "core_physical";
> +		reg =3D <0x04a00000 0x1000>;
> +		interrupts =3D <GIC_SPI 79 0>;
> +		clock-names =3D
> +		    "core_clk",
> +		    "master_iface_clk",
> +		    "slave_iface_clk";
> +		clocks =3D
> +		    <&mmcc HDMI_APP_CLK>,
> +		    <&mmcc HDMI_M_AHB_CLK>,
> +		    <&mmcc HDMI_S_AHB_CLK>;
> +		qcom,hdmi-tx-ddc-clk =3D <&msmgpio 70 GPIO_ACTIVE_HIGH>;
> +		qcom,hdmi-tx-ddc-data =3D <&msmgpio 71 GPIO_ACTIVE_HIGH>;
> +		qcom,hdmi-tx-hpd =3D <&msmgpio 72 GPIO_ACTIVE_HIGH>;
> +		core-vdda-supply =3D <&pm8921_hdmi_mvs>;
> +		hdmi-mux-supply =3D <&ext_3p3v>;
> +	};
> +};
> diff --git a/Documentation/devicetree/bindings/drm/msm/msm.txt
b/Documentation/devicetree/bindings/drm/msm/msm.txt
> new file mode 100644
> index 0000000..484cc12
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/drm/msm/msm.txt
>  <at>  <at>  -0,0 +1,40  <at>  <at>
> +Qualcomm adreno/snapdragon
> +
> +Required properties:
> +- compatible: "qcom,mdp" (mdp4) or "qcom,mdss_mdp" (mdp5)
> +- reg: Physical base address and length of the controller's registers.

As per the code (mdp5_kms.c), there are two sets of registers: "mdp_phys"
and "vbif_phys". They should probably be added in the description here.
"reg-names" entry might be needed as well.

> +- interrupts: The interrupt outputs from the controller.
> +- connectors: array of phandles for output device(s)
> +- clocks: device clocks
> +  See ../clocks/clock-bindings.txt for details.
> +
> +Optional properties:
> +- gpus: phandle for gpu device
> +
> +Example:
> +
> +/ {
> +	...
> +
> +	mdp: qcom,mdp <at> 5100000 {
> +		compatible =3D "qcom,mdp";
> +		reg =3D <0x05100000 0xf0000>;
> +		interrupts =3D <GIC_SPI 75 0>;
> +		connectors =3D <&hdmi>;
> +		gpus =3D <&gpu>;
> +		clock-names =3D
> +		    "core_clk",
> +		    "iface_clk",
> +		    "lut_clk",
> +		    "src_clk",
> +		    "hdmi_clk",
> +		    "mdp_clk";
> +		clocks =3D
> +		    <&mmcc MDP_SRC>,
> +		    <&mmcc MDP_AHB_CLK>,
> +		    <&mmcc MDP_LUT_CLK>,
> +		    <&mmcc TV_SRC>,
> +		    <&mmcc HDMI_TV_CLK>,
> +		    <&mmcc MDP_TV_CLK>;
> +	};
> +};
<snip>
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c
b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 7f7aade..0ff8d46 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
<snip>
>  <at>  <at>  -273,24 +275,37  <at>  <at>  static int hdmi_bind(struct
device *dev, struct device *master, void *data)
>  		return gpio;
>  	}
>
> -	/* TODO actually use DT.. */
> -	static const char *hpd_reg_names[] =3D {"hpd-gdsc", "hpd-5v"};
> -	static const char *pwr_reg_names[] =3D {"core-vdda", "core-vcc"};
> -	static const char *hpd_clk_names[] =3D {"iface_clk", "core_clk",
"mdp_core_clk"};
> -	static unsigned long hpd_clk_freq[] =3D {0, 19200000, 0};
> -	static const char *pwr_clk_names[] =3D {"extp_clk", "alt_iface_clk"};
> +	if (of_device_is_compatible(of_node, "qcom,hdmi-tx-8x74")) {
> +		static const char *hpd_reg_names[] =3D {"hpd-gdsc", "hpd-5v"};
> +		static const char *pwr_reg_names[] =3D {"core-vdda", "core-vcc"};
> +		static const char *hpd_clk_names[] =3D {"iface_clk", "core_clk",
"mdp_core_clk"};
> +		static unsigned long hpd_clk_freq[] =3D {0, 19200000, 0};
> +		static const char *pwr_clk_names[] =3D {"extp_clk", "alt_iface_clk"};
> +		config.phy_init      =3D hdmi_phy_8x74_init;
> +		config.hpd_reg_names =3D hpd_reg_names;
> +		config.hpd_reg_cnt   =3D ARRAY_SIZE(hpd_reg_names);
> +		config.pwr_reg_names =3D pwr_reg_names;
> +		config.pwr_reg_cnt   =3D ARRAY_SIZE(pwr_reg_names);
> +		config.hpd_clk_names =3D hpd_clk_names;
> +		config.hpd_freq      =3D hpd_clk_freq;
> +		config.hpd_clk_cnt   =3D ARRAY_SIZE(hpd_clk_names);
> +		config.pwr_clk_names =3D pwr_clk_names;
> +		config.pwr_clk_cnt   =3D ARRAY_SIZE(pwr_clk_names);
> +	} else if (of_device_is_compatible(of_node, "qcom,hdmi-tx-8960")) {
> +		static const char *hpd_clk_names[] =3D {"core_clk", "master_iface_clk",
"slave_iface_clk"};
> +		static const char *hpd_reg_names[] =3D {"core-vdda", "hdmi-mux"};
> +		config.phy_init      =3D hdmi_phy_8960_init;
> +		config.hpd_reg_names =3D hpd_reg_names;
> +		config.hpd_reg_cnt   =3D ARRAY_SIZE(hpd_reg_names);
> +		config.hpd_clk_names =3D hpd_clk_names;
> +		config.hpd_clk_cnt   =3D ARRAY_SIZE(hpd_clk_names);
> +	} else if (of_device_is_compatible(of_node, "qcom,hdmi-tx-8x60")) {
> +		config.phy_init      =3D hdmi_phy_8x60_init;
> +	} else {
> +		dev_err(dev, "unknown phy: %s\n", of_node->name);
> +	}

St=E9phane.
