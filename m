From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/3] DT: iio: adc: Add CC_10001 binding documentation
Date: Thu, 13 Nov 2014 08:37:19 -0600
Message-ID: <CAL_JsqK=F36EweJyWKemYn=5TbzKWv3xLFfhbfQ1bvQKR6tQLQ@mail.gmail.com>
References: <1415888044-16635-1-git-send-email-ezequiel.garcia@imgtec.com> <1415888044-16635-3-git-send-email-ezequiel.garcia@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415888044-16635-3-git-send-email-ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, Phani Movva <Phani.Movva-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 13, 2014 at 8:13 AM, Ezequiel Garcia
<ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrote:
> From: Phani Movva <Phani.Movva-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
>
> Add the devicetree binding document for Cosmic Circuits 10001 ADC device.
>
> Signed-off-by: Phani Movva <Phani.Movva-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Naidu Tellapati <Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> [Ezequiel: minor style cleaning]
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/iio/adc/cc10001_adc.txt    | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/cc10001_adc.txt
>
> diff --git a/Documentation/devicetree/bindings/iio/adc/cc10001_adc.txt b/Documentation/devicetree/bindings/iio/adc/cc10001_adc.txt
> new file mode 100644
> index 0000000..1533c19
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/cc10001_adc.txt
> @@ -0,0 +1,22 @@
> +* Cosmic Circuits - Analog to Digital Converter (CC-10001-ADC)
> +
> +Required properties:
> +  - compatible: Should be "cosmic,10001-adc"
> +  - reg: Should contain adc registers location and length.
> +  - clock-names: Should contain "adc".
> +  - clocks: phandles to input clocks.

You need to be explicit about how many clocks and their order. From
the names, I'm guessing it is only 1.

> +  - vref-supply: The regulator supply ADC reference voltage.
> +
> +Optional properties:
> +  - cosmic,adc-reserved-channels: Bitmask of reserved channels,
> +    i.e. channels that cannot be used by the OS.
> +
> +Example:
> +adc: adc@18101600 {
> +       compatible = "cosmic,10001-adc";
> +       reg = <0x18101600 0x24>;
> +       cosmic,adc-reserved-channels = <0x2>;
> +       clocks = <&adc_clk>;
> +       clock-names = "adc";
> +       vref-supply = <&reg_1v8>;
> +};
> --
> 2.1.0
>
