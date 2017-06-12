From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH 0/4] ARM: dts: bcm2835-rpi-zero: Enable OTG mode
Date: Mon, 12 Jun 2017 16:10:26 -0700
Message-ID: <87lgowajkt.fsf@eliezer.anholt.net>
References: <1495385079-3697-1-git-send-email-stefan.wahren@i2se.com> <542130487.90500.1496306283902@email.1und1.de> <6a45fcd8-0d88-bc17-6432-d38fe771dc80@i2se.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6a45fcd8-0d88-bc17-6432-d38fe771dc80-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> writes:

> Am 01.06.2017 um 10:38 schrieb Stefan Wahren:
>>> Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> hat am 21. Mai 2017 um 18:44 geschrieben:
>>>
>>>
>>> This patch series enable OTG mode for Raspberry Pi Zero because dwc2 driver
>>> has been fixed now.
>>>
>>> Patch 1 adds a new dtsi file to setup OTG mode (could also be used for boards
>>> like RPi Zero W or the Compute Module). The second patch adds the USB PHY and
>>> was part of Raspberry Pi Zero support patch series before split up [1].
>>> The enabling of OTG mode of RPi Zero is done by patch number 3. The last patch
>>> updates the BCM2835 defconfig.
>>>
>>> [1] - http://lists.infradead.org/pipermail/linux-rpi-kernel/2016-July/004153.html
>>>
>>> Stefan Wahren (4):
>>>   ARM: dts: bcm283x: Add dtsi for OTG mode
>>>   ARM: dts: bcm283x: Add generic USB PHY
>>>   ARM: dts: bcm2835-rpi-zero: Enable OTG mode
>>>   ARM: bcm2835_defconfig: Enable serial & ethernet USB gadget support
>>>
>> No comments to this patch series?
>>
>> Regards
>> Stefan
>
> @Eric
>
> Should i merge them?

I would have rebased my local branch on them, but I've merged them now.
Waiting for -next testing to come back, then I've got PR text ready to
send out.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlk/H2IACgkQtdYpNtH8
nui+Rg//RZ45WRNOxNVDpjUwUW49GAW/+jMeP65mp/UVlvOCcmaqFdGsaPx+CRAJ
iD60E2DNbQZ4zSiJk1rcaBxEW2Q9R3n3y0STEN6g/CtbNK+yCzQ+RhIuVKBfbdEv
8Uo61dxAJeQeo6klUsi5Jku9+Lu8apnH7OwmX7dVagZiKB6qqEZkULiFZI4wc6YZ
mWf4/sUtEjIRXJnSZr3MT6gN0jb33vdx32ijG9mAmi6Ogh4wDvmZt0n9iLb3oBDh
TpwkIzsEPpzQ/BDSD7FCfD/IxbT5FmYiQ6dOayMh4RVfLzstge7Lx94TuQzayNK/
/eY5dXtdiSxr1IZClo8hONZmKUOX3GMvzmezotXaZXCsdCC5y1pKeEi38DPiCDEh
fLJS/69hryeBAOFJj9wLSwOOe2lhO71xtCZfiXQATSLBJaI9bx55JWlVl09lmggi
ZpHrcBWAvAZop13RyiaVYJIF5wb5c2ygU0m/KeR79UiYq6H7ma/hz3dt6boduJgI
+ksQUglwBrrz1yzjUnQ33UsaBR1kZXdtzG1b6xcP/z3w7K9AP5IDXJrBPQUwKgks
yswm8KNZF5RBx6UmXVj4ETvus3cOoDdMkxhOQb92QrRtwPDVSyGC5fLS92DbA6Mp
N4ToJlX5TOeLLfSPRBwFGBqu0u2zcpCQlGeY+Uk9FiTTek4f0Mg=
=alcu
-----END PGP SIGNATURE-----
--=-=-=--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
