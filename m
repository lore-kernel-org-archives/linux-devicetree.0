From: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] arm64: dts: juno: add SCPI power domains for device
 power management
Date: Fri, 17 Jun 2016 09:30:46 -0600
Message-ID: <CANLsYkxDjSyTDeejHBypJdSOsznUSHYTBb6_TWK4NQyMpNN76A@mail.gmail.com>
References: <1465228765-14038-1-git-send-email-sudeep.holla@arm.com> <1465228765-14038-4-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465228765-14038-4-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Suzuki K Poulose <suzuki.poulose-5wv7dgnIgG8@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 6 June 2016 at 09:59, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
> This patch adds power domain information to coresight devices using
> SCPI power domains.
>
> Cc: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> ---
>  arch/arm64/boot/dts/arm/juno-base.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
> index 49fa55cdc977..ef054094d5a8 100644
> --- a/arch/arm64/boot/dts/arm/juno-base.dtsi
> +++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
> @@ -75,6 +75,7 @@
>
>                 clocks = <&soc_smc50mhz>;
>                 clock-names = "apb_pclk";
> +               power-domains = <&scpi_devpd 0>;
>                 ports {
>                         #address-cells = <1>;
>                         #size-cells = <0>;
> @@ -105,6 +106,7 @@
>
>                 clocks = <&soc_smc50mhz>;
>                 clock-names = "apb_pclk";
> +               power-domains = <&scpi_devpd 0>;
>                 port {
>                         tpiu_in_port: endpoint {
>                                 slave-mode;
> @@ -120,6 +122,7 @@
>
>                 clocks = <&soc_smc50mhz>;
>                 clock-names = "apb_pclk";
> +               power-domains = <&scpi_devpd 0>;
>                 ports {
>                         #address-cells = <1>;
>                         #size-cells = <0>;
> @@ -157,6 +160,7 @@
>
>                 clocks = <&soc_smc50mhz>;
>                 clock-names = "apb_pclk";
> +               power-domains = <&scpi_devpd 0>;
>                 port {
>                         etr_in_port: endpoint {
>                                 slave-mode;
> @@ -208,6 +212,7 @@
>
>                 clocks = <&soc_smc50mhz>;
>                 clock-names = "apb_pclk";
> +               power-domains = <&scpi_devpd 0>;
>                 ports {
>                         #address-cells = <1>;
>                         #size-cells = <0>;
> @@ -244,6 +249,7 @@
>
>                 clocks = <&soc_smc50mhz>;
>                 clock-names = "apb_pclk";
> +               power-domains = <&scpi_devpd 0>;
>                 ports {
>                         #address-cells = <1>;
>                         #size-cells = <0>;
> @@ -293,6 +299,7 @@
>
>                 clocks = <&soc_smc50mhz>;
>                 clock-names = "apb_pclk";
> +               power-domains = <&scpi_devpd 0>;
>                 port {
>                         cluster0_etm0_out_port: endpoint {
>                                 remote-endpoint = <&cluster0_funnel_in_port0>;
> @@ -306,6 +313,7 @@
>
>                 clocks = <&soc_smc50mhz>;
>                 clock-names = "apb_pclk";
> +               power-domains = <&scpi_devpd 0>;
>                 port {
>                         cluster0_etm1_out_port: endpoint {
>                                 remote-endpoint = <&cluster0_funnel_in_port1>;
> @@ -319,6 +327,7 @@
>
>                 clocks = <&soc_smc50mhz>;
>                 clock-names = "apb_pclk";
> +               power-domains = <&scpi_devpd 0>;
>                 port {
>                         cluster1_etm0_out_port: endpoint {
>                                 remote-endpoint = <&cluster1_funnel_in_port0>;
> @@ -332,6 +341,7 @@
>
>                 clocks = <&soc_smc50mhz>;
>                 clock-names = "apb_pclk";
> +               power-domains = <&scpi_devpd 0>;
>                 port {
>                         cluster1_etm1_out_port: endpoint {
>                                 remote-endpoint = <&cluster1_funnel_in_port1>;
> @@ -345,6 +355,7 @@
>
>                 clocks = <&soc_smc50mhz>;
>                 clock-names = "apb_pclk";
> +               power-domains = <&scpi_devpd 0>;
>                 port {
>                         cluster1_etm2_out_port: endpoint {
>                                 remote-endpoint = <&cluster1_funnel_in_port2>;
> @@ -358,6 +369,7 @@
>
>                 clocks = <&soc_smc50mhz>;
>                 clock-names = "apb_pclk";
> +               power-domains = <&scpi_devpd 0>;
>                 port {
>                         cluster1_etm3_out_port: endpoint {
>                                 remote-endpoint = <&cluster1_funnel_in_port3>;
> @@ -428,6 +440,12 @@
>                         };
>                 };
>
> +               scpi_devpd: scpi-power-domains {
> +                       compatible = "arm,scpi-power-domains";
> +                       num-domains = <2>;
> +                       #power-domain-cells = <1>;
> +               };
> +
>                 scpi_sensors0: sensors {
>                         compatible = "arm,scpi-sensors";
>                         #thermal-sensor-cells = <1>;
> --
> 2.7.4
>

Acked-by: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
