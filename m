From: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx6q-cm-fx6: add analog audio support
Date: Wed, 8 Feb 2017 21:30:06 +0100
Message-ID: <dd961726ee414273b322a3e4e85b92f7@rwthex-s1-b.rwth-ad.de>
References: <b6776a0aa8484faf816a238705ed6d22@rwthex-s1-b.rwth-ad.de>
 <38d5ebe36b5142fd84f19ecbcc5a018d@rwthex-w1-b.rwth-ad.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <38d5ebe36b5142fd84f19ecbcc5a018d-cBaz+nnMw18umhiu9RXYRl5UTUQ924AY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Valentin Raevsky <valentin-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Fabio,

thanks for the review!

On 02/07/2017 11:39 PM, Fabio Estevam wrote:
> On Tue, Feb 7, 2017 at 6:31 PM,  <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org> wrote:
>
>> +&audmux {
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&pinctrl_audmux>;
>> +       status = "okay";
>> +
>> +       ssi2 {
>> +               fsl,audmux-port = <1>;
>> +               fsl,port-config = <
>> +                       (IMX_AUDMUX_V2_PTCR_RCLKDIR |
>> +                       IMX_AUDMUX_V2_PTCR_RCSEL(3 | 0x8) |
>> +                       IMX_AUDMUX_V2_PTCR_TCLKDIR |
>> +                       IMX_AUDMUX_V2_PTCR_TCSEL(3))
>> +                       IMX_AUDMUX_V2_PDCR_RXDSEL(3)
>> +               >;
>> +       };
>> +
>> +       pins5 {
>
> Just one minor nit: maybe pins4 since you are using AUD4 pins. Or
> maybe 'audmux4' as pins4 is too vague ?

Sounds good. Actually, CompuLab uses the term audmux4 themselves in the 
block diagram of the board.

Cheers,
Christopher

> Reviewed-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
