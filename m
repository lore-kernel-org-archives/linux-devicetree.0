From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 2/5] ARM: bcm2835: Replace alt0/i2s_alt[02] with standard
 groups.
Date: Thu, 03 Mar 2016 14:28:58 -0800
Message-ID: <87bn6v6vrp.fsf@eliezer.anholt.net>
References: <1456510756-15337-1-git-send-email-eric@anholt.net>
 <1456510756-15337-3-git-send-email-eric@anholt.net>
 <56D8ABF4.6060801@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4225005640783065748=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <56D8ABF4.6060801@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stefan Wahren <stefan.wahren@i2se.com>, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-rpi-kernel@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============4225005640783065748==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Stephen Warren <swarren@wwwdotorg.org> writes:

> On 02/26/2016 11:19 AM, Eric Anholt wrote:
>> Since all of these pins were documented, we can use their names to
>> explain what's going on.
>
>> diff --git a/arch/arm/boot/dts/bcm2835-rpi-a-plus.dts b/arch/arm/boot/dt=
s/bcm2835-rpi-a-plus.dts
>
>>   &gpio {
>> +	pinctrl-0 =3D <&i2c0_gpio0
>> +		     &i2c1_gpio2
>> +		     &gpclk0_gpio4
>> +		     &gpclk1_gpio5
>> +		     &spi0_gpio7
>> +		     &pcm_gpio18
>> +		     &pwm0_gpio40
>> +		     &pwm1_gpio45
>> +		     &gpioout
>> +		     &alt3>;
>>   };
>
> Why not convert alt3 to the new scheme too?

(covered in the next patch)

> I think this configures too many pins, which in turn makes assumptions=20
> about what those pins are used for that may not be valid.
>
> Recent RPi firmware configures almost all expansion connector GPIOs as=20
> GPIO-in. This ensures that no matter what is connected to the expansion=20
> connector, there can be no signal conflicts due to both the bcm283x and=20
> some external device both attempting to drive the same pin. I believe=20
> the default Linux pinmux should adopt the same approach, by simply not=20
> configuring any expansion connector pins except those known to have a=20
> 100% hard-coded usage. For example, the HAT I2C pins must only be used=20
> for that purpose on the RPi, so even if the HW supported using them as=20
> arbitrary GPIO or PWM or ..., we know they're actually I2C.
>
> So, I think this list should only include configuration for pins=20
> connected to on-board devices, or expansion pins that have a 100% known=20
> purpose.
>
> (I can't quite remember how many pins are being configured in the=20
> upstream kernel's DT files at present; it's possible the complying with=20
> this rule may involve removing some pinctrl settings that are currently=20
> present to avoid conflicts. User-specific additions should come from DT=20
> overlays or manual DT edits.)

If we want to improve on our default pin configurations, I'm into that,
but I think the first step is to get groups split up so it's clear what
we're doing with pins in the first place.  This patch is just a no-op
change to get the board files to use smaller groups for
enabling/disabling, and we should stack functional changes after that.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJW2LqrAAoJELXWKTbR/J7one4P/RUxkBUa6jueLqeByHVNf4wc
WuPJRMRveI8psYXiRltAQPLQmgaFktAlu4ly4jKBm9MPl4XrDaw7oWd7+GxKFOFF
KCh5BW3/OYdWbQR/ICaORrrVPe8JSgcCdvjtuQpJRIKTjYJ5e2/fxWMFsJXH1vcw
FNEtJtOR6FuoknqhftUVcwEWFkTG434dhFYd2WAfEwObbaEn1LRGnY2/ahYykU4n
0Qv32eufQwxQ65M3BSoeTSB6s49iKzvPXpP9j6e/QhbTVT89Fq+VSv5qmKeMrlmJ
8BzrScJ4hwjaxahctgOqvjKQa5/60PEiEKvo+QpDAdFw4l5CY3XXJAlUnMrxGCZf
d+Z5ZbDet8p8nJtGnsrAxGSxbmNB9dHZnQ7plrcYEH9U5GI+VCavkpyiO9uxluqL
By+R2fhOcza/uNkiaXw7qfpH0+8qXTKHpfquqIUFSRdV2JtHJW2zO4xtBqTat/W9
76cOmTPF8SNcb0O4+WJz1qCGDBPsZoWVdo+/3WZsCorYfXU9YihzQfk20NSQ+k9e
AjSAR8gky4zSDDeT1xDOkbmyvvwUtyoUDxiFD3WrB7fvD/ECCl+b/gRu2hVUH8Jg
jShi+lyLFhxAYuAvLTXODoXADcusJRlw29vc90t+fkqq5OL+DZGnYe3I/F1qP4jX
4h1vChyvGuDYtssnjcN0
=75Ta
-----END PGP SIGNATURE-----
--=-=-=--


--===============4225005640783065748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4225005640783065748==--
