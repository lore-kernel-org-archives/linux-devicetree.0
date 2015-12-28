From: Bjorn Andersson <bjorn-UYDU3/A3LUY@public.gmane.org>
Subject: Re: [RESEND v4 1/6] remoteproc: dt: Provide bindings for ST's Remote
 Processor Controller driver
Date: Mon, 28 Dec 2015 10:33:00 -0800
Message-ID: <CAJAp7Oi6t=VDcTh5tLGne_LQFi8cBJH+=rDy1tgeh__SQwrpyQ@mail.gmail.com>
References: <1448370862-19120-1-git-send-email-lee.jones@linaro.org>
	<1448370862-19120-2-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1448370862-19120-2-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Ohad Ben-Cohen <ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Nathan Lynch <Nathan_Lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, ludovic.barre-qxv4g6HH51o@public.gmane.org, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 24, 2015 at 5:14 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Signed-off-by: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
> Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---

Acked-by: Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>

Regards,
Bjorn

>  .../devicetree/bindings/remoteproc/st-rproc.txt    | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/st-rproc.txt
>
> diff --git a/Documentation/devicetree/bindings/remoteproc/st-rproc.txt b/Documentation/devicetree/bindings/remoteproc/st-rproc.txt
> new file mode 100644
> index 0000000..1031bcd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/st-rproc.txt
> @@ -0,0 +1,41 @@
> +STMicroelectronics Co-Processor Bindings
> +----------------------------------------
> +
> +This binding provides support for adjunct processors found on ST SoCs.
> +
> +Co-processors can be controlled from the bootloader or the primary OS. If
> +the bootloader starts a co-processor, the primary OS must detect its state
> +and act accordingly.
> +
> +Required properties:
> +- compatible           Should be one of:
> +                               "st,st231-rproc"
> +                               "st,st40-rproc"
> +- memory-region                Reserved memory (See: ../reserved-memory/reserved-memory.txt)
> +- resets               Reset lines (See: ../reset/reset.txt)
> +- reset-names          Must be "sw_reset" and "pwr_reset"
> +- clocks               Clock for co-processor (See: ../clock/clock-bindings.txt)
> +- clock-frequency      Clock frequency to set co-processor at if the bootloader
> +                       hasn't already done so
> +- st,syscfg            System configuration register which holds the boot vector
> +                       for the co-processor
> +                               1st cell: Phandle to syscon block
> +                               2nd cell: Boot vector register offset
> +
> +Example:
> +
> +       audio_reserved: rproc@42000000 {
> +               compatible = "shared-dma-pool";
> +               reg = <0x42000000 0x01000000>;
> +               no-map;
> +       };
> +
> +       st231-audio {
> +               compatible      = "st,st231-rproc";
> +               memory-region   = <&audio_reserved>;
> +               resets          = <&softreset STIH407_ST231_AUD_SOFTRESET>;
> +               reset-names     = "sw_reset";
> +               clocks          = <&clk_s_c0_flexgen CLK_ST231_AUD_0>;
> +               clock-frequency = <600000000>;
> +               st,syscfg       = <&syscfg_core 0x228>;
> +       };
> --
> 1.9.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
