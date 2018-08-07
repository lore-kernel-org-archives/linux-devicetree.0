From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH] arm64: dts: allwinner: a64: add csi regulator to sopine dts
Date: Tue, 7 Aug 2018 10:52:20 +0800
Message-ID: <CAGb2v66GoZJ4nXs7S0F3JXJ3Jm0ZBRXy0r2e4STqVPV5S0UVUQ@mail.gmail.com>
References: <Akash_Gajjar@mentor.com> <1533109399-21174-1-git-send-email-Akash_Gajjar@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1533109399-21174-1-git-send-email-Akash_Gajjar@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Akash Gajjar <Akash_Gajjar@mentor.com>
Cc: Icenowy Zheng <icenowy@aosc.io>, Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 1, 2018 at 3:43 PM, Akash Gajjar <Akash_Gajjar@mentor.com> wrote:
> sopine board has a csi. enable supply dvdd-1v8-csi, dovdd-2v8-csi and
> avdd-2v8-csi on board to access external camera connected to it.

Unless there are other uses beyond supplying the camera module, this is not
going to be accepted. Enabling power to the camera should be in the same
patch as enabling the camera itself. And since it is a module, it should
be an overlay file.


ChenYu


> Signed-off-by: Akash Gajjar <Akash_Gajjar@mentor.com>
> ---
>  .../arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi
> index 43418bd..256229b 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi
> @@ -68,6 +68,13 @@
>
>  #include "axp803.dtsi"
>
> +&reg_aldo1 {
> +       regulator-always-on;
> +       regulator-min-microvolt = <2800000>;
> +       regulator-max-microvolt = <2800000>;
> +       regulator-name = "dovdd-csi";
> +};
> +
>  &reg_aldo2 {
>         regulator-always-on;
>         regulator-min-microvolt = <1800000>;
> @@ -112,6 +119,13 @@
>         regulator-name = "vdd-sys";
>  };
>
> +&reg_dldo3 {
> +       regulator-always-on;
> +       regulator-min-microvolt = <2800000>;
> +       regulator-max-microvolt = <2800000>;
> +       regulator-name = "avdd-csi";
> +};
> +
>  &reg_eldo1 {
>         regulator-always-on;
>         regulator-min-microvolt = <1800000>;
> @@ -119,6 +133,13 @@
>         regulator-name = "vdd-1v8-lpddr";
>  };
>
> +&reg_eldo3 {
> +       regulator-always-on;
> +       regulator-min-microvolt = <1800000>;
> +       regulator-max-microvolt = <1800000>;
> +       regulator-name = "vdd-csi";
> +};
> +
>  &reg_fldo1 {
>         regulator-min-microvolt = <1200000>;
>         regulator-max-microvolt = <1200000>;
> --
> 2.7.4
>
