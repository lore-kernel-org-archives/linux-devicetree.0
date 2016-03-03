From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 1/5] ARM: bcm2835: Define standard pinctrl groups in the gpio node.
Date: Thu, 03 Mar 2016 14:23:19 -0800
Message-ID: <87fuw76w14.fsf@eliezer.anholt.net>
References: <1456510756-15337-1-git-send-email-eric@anholt.net> <1456510756-15337-2-git-send-email-eric@anholt.net> <56D8AAA2.60907@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56D8AAA2.60907-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:

> On 02/26/2016 11:19 AM, Eric Anholt wrote:
>> The BCM2835-ARM-Peripherals.pdf documentation specifies what the
>> function selects do for the pins, and there are a bunch of obvious
>> groupings to be made.  With these created, we'll be able to replace
>> bcm2835-rpi.dtsi's main "set all of these pins to alt0" with
>> references to specific groups we want enabled.
>
>> diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.=
dtsi
>
>> +			spi0_gpio7: spi0_gpio7 {
>> +				brcm,pins =3D <7 8 9 10 11>;
>> +				brcm,function =3D <BCM2835_FSEL_ALT0>;
>> +			};
>
> This is too many pins.
>
> - It includes both MOSI and MISO, although a particular use-case may=20
> only use 1 of those.
>
> - It includes both chip-select signals, whereas a particular use-case=20
> may use 0, 1, or 2 of those. This is especially true since IIRC the=20
> mainline bcm283x SPI driver wants to only use GPIOs for chip-selects,=20
> not SPI-controller-generated chip-select signals, to avoid some issues=20
> with the HW generation of these signals.
>
>
> I believe a similar comment applies to other SPI nodes too.
>
>> +			pcm_gpio18: pcm_gpio18 {
>> +				brcm,pins =3D <18 19 20 21>;
>> +				brcm,function =3D <BCM2835_FSEL_ALT0>;
>> +			};
>
> Here too, I wonder if some people might want only one of DIN/DOUT and=20
> not both?
>
>> +			uart1_gpio36: uart1_gpio36 {
>> +				brcm,pins =3D <36 37 38 39>;
>> +				brcm,function =3D <BCM2835_FSEL_ALT2>;
>> +			};
>
> Similarly, I think for UARTS, TX/RX and RTS/CTS should always be in=20
> different nodes so people can choose 2- or 4-wire mode. Most of the UART=
=20
> nodes are already split like this, but this one isn't.
>
>> +			emmc_gpio22: emmc_gpio22 {
>> +				brcm,pins =3D <22 23 24 25 26 27>;
>> +				brcm,function =3D <BCM2835_FSEL_ALT3>;
>> +			};
>
> 1-wire (1 data wire, plus CLK/CMD) eMMC is possible in theory, although=20
> I don't know whether it makes sense to support this?

Nothing here precludes making alternative pin groups for special
situations like you're bringing up here.  I'm just trying to bring
sanity to the giant lists of pins we have currently, that happen to
correspond to these.

Of your suggestions, making uart1_gpio36 split out cts/rts like the rest
makes a lot of sense to me.  Of the others, they seem like speculation
more than "we should fix this because it's not what people want."  Can
you provide specific feedback of what you'd like changed to get an Ack?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJW2LlXAAoJELXWKTbR/J7oOAQP/2JK1tCBfqnFkEtb5jLkhN7I
BadA94kH76qOPB6Rt1gb3xetu3c7j3iM4bbhJ/5ZAuPQvU4+B8ALkft/qH5SqsyT
8cUEI9QYKMVJDqJtdljGJsGqqfS+/dLdssl5m0rjIkbeauqT0DkLwPYU7f4s82N7
8rwzBISk1uak40Fu/iN6y1z83nMdv17lLU3q5JCJ/V2Z1DJKSxu4r3vJdwg0Rf7D
IeSroX5t5KFboRRkyHSuiVvqursVFkS7vNDEE38Ue8w8jHx3psQwdUoo+CS9n9Pj
Mq139dCTGyVBmBmR7LgdumlEnCvNqE07pYjw/Gcf8nh6zIem1zmdNwnUNQKhXJAG
kaCSqZjYHdAntuKLJ4bN6AaeKJ11Bxh3pdmxsO7pdx2wssqHS1BPxv7nmqYJGQBG
5sk/+mdV9hxbFN2kdUF1Ba+HgQ3FTovLY6DbQr3LYdSlPNo0sNHfJpX1XsNsmAem
lOWEPXCbOQ7/0Vf1onPcFlMKD2TeGfkkOLyqJKUYgTUnkW7QnTtrG6UcaJGSoV06
4iDYAHHm5ekD9Po47Tt7kYEblYOv2qJ1eoAD/YYhww+1c9nOFiRdLKH9k+3Loqsi
/4xfx0hVU0Jr6a0dA0B8iEleItbkQNYzKfVrueAUQ/t762qMaoWm3vUuTt0TxM4D
+xqpURWYjsLxaZPKHRV1
=Nf2a
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
