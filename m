From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH V2 RFC 0/6] ARM: dts: bcm2835: Add Raspberry Pi Zero
Date: Thu, 18 Aug 2016 17:37:56 -0700
Message-ID: <87twehegpn.fsf@eliezer.anholt.net>
References: <1469559213-16160-1-git-send-email-stefan.wahren@i2se.com>
 <87lgzuj66o.fsf@eliezer.anholt.net>
 <1091535069.365254.5a20a815-9153-4587-9aeb-f2a7fc5a4ff5.open-xchange@email.1und1.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6208248816799542254=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1091535069.365254.5a20a815-9153-4587-9aeb-f2a7fc5a4ff5.open-xchange@email.1und1.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, John Youn <johnyoun@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

--===============6208248816799542254==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Stefan Wahren <stefan.wahren@i2se.com> writes:

> Hi Eric,
>
>> Eric Anholt <eric@anholt.net> hat am 18. August 2016 um 20:14 geschriebe=
n:
>>=20
>>=20
>> Stefan Wahren <stefan.wahren@i2se.com> writes:
>>=20
>> > This patch series is only a draft and not intended to be merged. Patch=
es 1
>> > and 2
>> > aren't bcm2835 specific and should be helpful for other platforms.=20
>> > The patches 2 - 4 are required for otg / gadget mode. The last patch
>> > based on the work of Lubomir Rintel [1] and Noralf Tr=C3=B8nnes [2].
>> >
>> > Changes since V1:
>> > - rebase to current linux-next
>> > - add patches 1 - 4 for otg/gadget support
>> > - add patch 5 with model compatible
>> > - use polarity define for ACT LED
>> >
>> > [1] -
>> > http://lists.infradead.org/pipermail/linux-rpi-kernel/2016-February/00=
3221.html
>> > [2] - https://github.com/raspberrypi/linux/pull/1239/
>> >
>> > Stefan Wahren (6):
>> >   usb: dwc2: core: Avoid nonsense error in gadget mode
>> >   usb: dwc2: Add DT properties to specify fifo size in host/otg mode
>> >   ARM: dts: bcm283x: Add missing usb clock
>> >   ARM: dts: bcm283x: Add generic USB PHY
>> >   DT: bindings: bcm: Add Raspberry Pi Zero
>> >   ARM: dts: bcm2835: Add Raspberry Pi Zero
>>=20
>> Where are we at on these?=20=20
>
> I would like to split the series:
> part 1: Raspberry Pi Zero support (only USB host mode support)
> part 2: OTG / Peripheral support for BCM2835 (hope that i reach the point)

That sounds great.

>> I've been holding off waiting for the USB
>> bits to get settled.  I can grab the bindings patch, but is there
>> anything else we could merge while you're working on USB?
>
> Maybe i missed something, but i didn't received any ACK from you about th=
is
> series.
>
> In case everything is okay, you could also merge patch 3 since it's relev=
ant to
> bcm283x and not RPi Zero specific.

Didn't miss anything.  I hadn't acked yet since it looked like there
were open questions for the USB folks.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCgAGBQJXtlTnAAoJELXWKTbR/J7oKH0QAK3QdWGrKpAudGKITUWuxfvV
GtO3+zcfZeWqOX454kZFs97q8Yd4FwMuOgv15G85wluRSu4J4Q0olUJuyzhQjJ2W
Zcx2tWyHknnyyE4kholG3dMM3OoS5ULEGwcoN3J4s1rZBcfsWCMA6of2YKwUevu5
QiSe+2Svrcfw+72TZqz0rorFz/hWep0GuRtOUmZ8M/H+myIPbokl8vFy4gupOvdw
FLilK+ShV+0WytyWk6rxphxcVkuaDTr+fV6+3TZf6AXThLwnqPUznuc9PNECUDev
CiIsM7zq8b357NA0jm7ix4UMG23OxTyQ97UKj0E98tKrCdRiFIqK0Kas5lTXtfpR
I42eYOswop3UfbbXIeXfMNz0+RcroleQdcideqItCLXCTpfV6ifNCj5oZzMC50HY
9mWElj0jxvNEMUp9UFe8ojVuqUrIoWLqIN/DvROpniFP5+lxLd+d9kDwdZPOJWX5
cQUr8sR2ptAPwsvCYCyEU2X0Lz3N4TsgxhoBYx+yGx+Y3r4Q4oiX3uZ79hsQvlAt
XVjJf/+4rey/9Dlvm1rbXx7p8QQhvuCC3IEfJPYFRp2aHN0XuElYKyROPhXC5ha1
HIsrYB9hlzvlsoq7QE4zqzLGhTe4SQYDxTEAnYMT8d+WjFBew0f+slMIGLkOZkNa
L6lqZPGNE5mahuh8zDCv
=/P1s
-----END PGP SIGNATURE-----
--=-=-=--


--===============6208248816799542254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6208248816799542254==--
