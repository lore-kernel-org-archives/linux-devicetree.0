From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH V2 RFC 0/6] ARM: dts: bcm2835: Add Raspberry Pi Zero
Date: Thu, 18 Aug 2016 11:14:07 -0700
Message-ID: <87lgzuj66o.fsf@eliezer.anholt.net>
References: <1469559213-16160-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5268706075119156597=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1469559213-16160-1-git-send-email-stefan.wahren@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, John Youn <johnyoun@synopsys.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Felipe Balbi <balbi@kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============5268706075119156597==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Stefan Wahren <stefan.wahren@i2se.com> writes:

> This patch series is only a draft and not intended to be merged. Patches =
1 and 2
> aren't bcm2835 specific and should be helpful for other platforms.=20
> The patches 2 - 4 are required for otg / gadget mode. The last patch
> based on the work of Lubomir Rintel [1] and Noralf Tr=C3=B8nnes [2].
>
> Changes since V1:
> - rebase to current linux-next
> - add patches 1 - 4 for otg/gadget support
> - add patch 5 with model compatible
> - use polarity define for ACT LED
>
> [1] - http://lists.infradead.org/pipermail/linux-rpi-kernel/2016-February=
/003221.html
> [2] - https://github.com/raspberrypi/linux/pull/1239/
>
> Stefan Wahren (6):
>   usb: dwc2: core: Avoid nonsense error in gadget mode
>   usb: dwc2: Add DT properties to specify fifo size in host/otg mode
>   ARM: dts: bcm283x: Add missing usb clock
>   ARM: dts: bcm283x: Add generic USB PHY
>   DT: bindings: bcm: Add Raspberry Pi Zero
>   ARM: dts: bcm2835: Add Raspberry Pi Zero

Where are we at on these?  I've been holding off waiting for the USB
bits to get settled.  I can grab the bindings patch, but is there
anything else we could merge while you're working on USB?

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJXtfrwAAoJELXWKTbR/J7oxOQQAKjNkgrtS89w6vgVURgre4CW
VdzquwjlGtfZg68WOQVcuw0tIJDC+ADcvgrEWoyToOnBgdgQg49eloijdwcxxLlW
zuj0lUobHt2wFPsKmfhWNATUTkBxKT6Ijh/A3DZZrRIG1VE4wEg5t6lw0stHKasI
e12k9QkVcj/tzLP6A2chQQCV7UZqxWrOrfXE7QhWe2yYdek3eIdm5WVxbn5KFDFZ
v/73I2sKv7i1w36+eqlQPF+VVxgQt24rfPwCP8+u/Oz3TJFHcVaqXEpO13bFXHvi
nGWNaJm0ry9QpZcrnC6l0QnYPyqyrghid/9r/Oc6C829nDkKkHSl1i6OpIadqRAM
CZLzeDvg4XdDmOUdA0MvjDhSrgOapqUHokbbFOnOlt3VblYIRLHBwsH3QQCNn7gy
JBThUFelVtHnJGrUoL/iTuZRQgWYSzSJ0mWMuofehz8yxBWi9U4RRxadXdQhehTO
KzbeWUpECVr4j6/rOQ4Uwm6T6FxfvD+6IZAVbXrMCWimDWZRZFbOITKGd4ycvBM+
Xe1cwzCmL5GOOdnwT+7E8RkybL4py5fZBmRXC6f0YufuqBsmDW6VolsOwYBPLpKJ
3FwWwhaiAIUScxdnSpp85b74eBRYT1HyMJAgCKneNe/FM4G6+VNjv3L3xzxyWNcF
GacDHvKoowwkLfvOGbut
=FcAn
-----END PGP SIGNATURE-----
--=-=-=--


--===============5268706075119156597==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5268706075119156597==--
