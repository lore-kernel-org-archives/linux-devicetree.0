From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v2 09/11] Documentation: devicetree: Fix ADI AXI SPDIF
 specification
Date: Fri, 25 Jul 2014 09:42:25 +0200
Message-ID: <53D20A61.1050506@metafoo.de>
References: <1406242820-20140-1-git-send-email-afaerber@suse.de> <1406242820-20140-10-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406242820-20140-10-git-send-email-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Andreas Olofsson <andreas-hhg9azYwhpdWk0Htik3J/w@public.gmane.org>, Matteo Vit <matteo.vit-WGsyu9ztxDWovDFt+AQlJdBPR1lH4CV8@public.gmane.org>, Sean Rickerd <srickerd-IBi9RG/b67k@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/25/2014 01:00 AM, Andreas F=C3=A4rber wrote:
> The specification requires compatible =3D "adi,axi-spdif-1.00.a" but
> driver and example and file name indicate "adi,axi-spdif-tx-1.00.a".
> Change the specification to match the implementation.
>
> Signed-off-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>

Acked-by: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>

Thanks.

> ---
>   v2: New
>
>   Documentation/devicetree/bindings/sound/adi,axi-spdif-tx.txt | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/sound/adi,axi-spdif-tx=
=2Etxt b/Documentation/devicetree/bindings/sound/adi,axi-spdif-tx.txt
> index 46f3449..4eb7997 100644
> --- a/Documentation/devicetree/bindings/sound/adi,axi-spdif-tx.txt
> +++ b/Documentation/devicetree/bindings/sound/adi,axi-spdif-tx.txt
> @@ -1,7 +1,7 @@
>   ADI AXI-SPDIF controller
>
>   Required properties:
> - - compatible : Must be "adi,axi-spdif-1.00.a"
> + - compatible : Must be "adi,axi-spdif-tx-1.00.a"
>    - reg : Must contain SPDIF core's registers location and length
>    - clocks : Pairs of phandle and specifier referencing the controll=
er's clocks.
>      The controller expects two clocks, the clock used for the AXI in=
terface and
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
