From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH v3 1/2] ARM: dts: Remove use of skeleton.dtsi from
 bcm283x.dtsi
Date: Thu, 18 Aug 2016 10:59:05 -0700
Message-ID: <87zioaj6vq.fsf@eliezer.anholt.net>
References: <1471516926-11466-1-git-send-email-ijc@hellion.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2135489511218352660=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1471516926-11466-1-git-send-email-ijc@hellion.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, arm@kernel.org, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Catalin Marinas <catalin.marinas@arm.com>, Lee Jones <lee@kernel.org>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, Ian Campbell <ijc@hellion.org.uk>, Frank Rowand <frowand.list@gmail.com>, linux-rpi-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============2135489511218352660==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Ian Campbell <ijc@hellion.org.uk> writes:

> This file is included from DTS files under arch/arm64 too (via
> broadcom/bcm2837-rpi-3-b.dts and broadcom/bcm2837.dtsi). There is a desire
> not to have skeleton.dtsi for ARM64. See commit 3ebee5a2e141 ("arm64: dts:
> kill skeleton.dtsi") for rationale for its removal.
>
> As well as the addition of #*-cells also requires adding the device_type to
> the rpi memory node explicitly.
>
> Note that this change results in the removal of an empty /aliases node from
> bcm2835-rpi-a.dtb and bcm2835-rpi-a-plus.dtb. I have no hardware to check
> if this is a problem or not.
>
> It also results in some reordering of the nodes in the DTBs (the /aliases
> and /memory nodes come later). This isn't supposed to matter but, again,
> I've no hardware to check if it is true in this particular case.
>
> Signed-off-by: Ian Campbell <ijc@hellion.org.uk>
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> Tested-by: Stefan Wahren <stefan.wahren@i2se.com>

I'd lost track of these patches, sorry.  Both are:

Acked-by: Eric Anholt <eric@anholt.net>

They're going through the -soc tree, right?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJXtfdpAAoJELXWKTbR/J7owE4P/1hKNOiWAwQt4Ar5zYOHHUkG
bt1WNHGKoxFEewZQOZhxQoXqLZLrR+Mri24ydvav4aV/FonFAUbzDy6L9RpWfL+g
tLlAk1JznyFeW49xmmM+xJes9p+yZvD0yccLjU2yUBVqr8PnjFJDHAS5F8Oy4Zug
iDmkNjtNBpKfn+lVEJMDvoAH6hdHnITteZJU8eCoaLDrE3ua0r9QT4IX3uzlrJ6n
uxCnbYwcBfiWvHUNnoHSsS90vdgnp8E0w1imKzUmYsbQxhoNEHuZfwyMZFFrZ7qn
z+K05GwNImvkYZTDxlKE42AkKAxyECtnIrRGBbKMA/0HS4lQhbFjugfbS/20bI71
ECZW34Hk5F4c0UcW/dUR1im4BYAobAeONhPS1hUMDhby1GMy+Vg1d9FAwrV6YnS4
SdQ+ksS9zwfREcRWBmXZXt7PYpJIDtTLHqkGCU/iq5MpHAZUOxZQABXYudzO6BDZ
nhev3U3kxrJRCRtobR6kHlsmxU5zDM0ekyU/ygf7qIYSe1BuZ4nljvLXUGq9fs+Z
g9eGRkTMd92rvWSYqWRE8SxP/HjUxC0BvgS9DTuSu/VqtSMquIPSs3hqswVpPGwX
pzB93s+L0y/YhtUhf1rFDk1AZiuofEMQQB/p4j10assV/VUh2wdvtsS6iBhSmYXu
BIaaWLfvK+xE0c4kXoJz
=Bg34
-----END PGP SIGNATURE-----
--=-=-=--


--===============2135489511218352660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2135489511218352660==--
