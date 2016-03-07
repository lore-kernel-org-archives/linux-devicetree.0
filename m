From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH v3 04/11] ARM: bcm2835: dt: add bindings for shared interrupt properties
Date: Mon, 07 Mar 2016 15:24:57 -0800
Message-ID: <87fuw1yipi.fsf@eliezer.anholt.net>
References: <1457175142-28665-1-git-send-email-kernel@martin.sperl.org> <1457175142-28665-5-git-send-email-kernel@martin.sperl.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457175142-28665-5-git-send-email-kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org writes:

> From: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
>
> Add binding documentation for the new shared interrupt properties:
> * brcm,dma-channel-shared-mask
> * brcm,dma-shared-irq-index
>
> Signed-off-by: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.txt b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.txt
> index 1396078..f9e84ee 100644
> --- a/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.txt
> +++ b/Documentation/devicetree/bindings/dma/brcm,bcm2835-dma.txt
> @@ -17,6 +17,10 @@ Required properties:
>  - brcm,dma-channel-mask: Bit mask representing the channels
>  			 not used by the firmware in ascending order,
>  			 i.e. first channel corresponds to LSB.
> +- brcm,dma-channel-shared-mask: Bit mask representing the channels
> +				that use a shared interrupt
> +- brcm,dma-shared-irq-index: index of which of the interrupts mentioned
> +			     above is the shared interrupt

This should be under "Optional properties" since there are appropriate
defaults for the only compatible string listed.

I still don't think exposing this in the DT is necessary (it's hardware
block internals), but I'm not writing the code so I'm fine with it
either way, really.  Regardless, it would be really good to get the
slave_sg part of the series in, which is really important for the
platform.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJW3g3KAAoJELXWKTbR/J7oAP0P/j5AC3r5rk501iixvAq1Gnqi
RYP40gH/PI0EXiHhPzJEujFA5r33R2Y88eeJoTHl+rIkepnUMHIxGSGrD/BfImwZ
eQ3CgQfvWsRuhWi+RCpn7zDS21ZM/GijidvrP6vTV7ftcseNZIVnxM3eAZYB6nx8
QvXMuLna2PnjJyTKAwMzGr8sQGXwNniHGHFSUTckY+gielldpV3VK6LYpSguLrY/
hXcmBLpIfdgH5Ff82HInNAL56bxRicaC7a+abQMVULZPxOqXMjIxSE/fVeDpucxa
ptJGTAmNB0jVAefR9yYkwmcvk1xfcrv5yyiSCV/wJ7PZPpkKeJKKahEJ/khLMEGM
suz+VyebY6mNn22ugJCIOiP+KHvlU/9YuWCGxIi/N6VHXaC6Vjuq4Gujyyf0Y/7H
XRHWCc9YvYJq4j3IMfuxtS/dfyecLWh/tyBtMKnOdQ/rcMSH+yv0zdOCjDpHYOcU
4mO+DHXJ3NISKY3+YRZjUEFvIkxrkexDKlK9iD8l9vsTl4dsvZY8rQzQrxlooq1A
2MEwSmO71yNhQRdU0qCRFUj6uQcZfz3t8+TYFs3yHn1RlMMvH8RXAbdyeFo/Xp4a
+YkdwYNpcUdHJEq2KYSwmigtKEvbpIBSDfprFFEVn7Klz10DZGIDDcVDoNBKxWsu
f9H0VyGl4mextUfHp9RL
=0hTc
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
