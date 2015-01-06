From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 2/3] DT: iio: adc: Add CC_10001 binding documentation
Date: Tue, 6 Jan 2015 10:30:19 -0600
Message-ID: <CAL_Jsq+PwSjuqvfr6TfwwNzriRx9Nb1GHWWvWGFKK9zvOOORKA@mail.gmail.com>
References: <1420558143-26276-1-git-send-email-ezequiel.garcia@imgtec.com> <1420558143-26276-3-git-send-email-ezequiel.garcia@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420558143-26276-3-git-send-email-ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, knaack.h-Mmb7MZpHnFY@public.gmane.org, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Phani Movva <Phani.Movva-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Naidu Tellapati <Naidu.Tellapati-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 6, 2015 at 9:29 AM, Ezequiel Garcia
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
> index 0000000..b7ba558
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/cc10001_adc.txt
> @@ -0,0 +1,22 @@
> +* Cosmic Circuits - Analog to Digital Converter (CC-10001-ADC)
> +
> +Required properties:
> +  - compatible: Should be "cosmic,10001-adc"
> +  - reg: Should contain adc registers location and length.
> +  - clock-names: Should contain "adc".
> +  - clocks: Should contain a clock specifier for each entry in clock-names
> +  - vref-supply: The regulator supply ADC reference voltage.
> +
> +Optional properties:
> +  - cosmic,adc-reserved-channels: Bitmask of reserved channels,
> +    i.e. channels that cannot be used by the OS.

Seems like this could be pretty common for any ADC as well as having
the number of channels, so you can drop the vendor prefix. Do we have
any similar properties already in other drivers? I'd reverse the
polarity to be enabled channels, then the number of available channels
is the top set bit plus 1. You could count channels as is, but then
people have to remember to set the high bits on non-existent channels.
Absence of the property could still mean you know how many channels
and all are enabled.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
