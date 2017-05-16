From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 2/4] dt-bindings: Document the Raspberry Pi Touchscreen
 nodes.
Date: Tue, 16 May 2017 11:46:36 -0700
Message-ID: <87shk4iqr7.fsf@eliezer.anholt.net>
References: <20170511235625.22427-1-eric@anholt.net>
 <CAL_Jsq+Pt5necK9cUPwFqmCbK5d-0NVNv-_LRVqyNgr5ajR8LQ@mail.gmail.com>
 <87h90ku4sq.fsf@eliezer.anholt.net> <3768334.nZM7df9y4L@avalon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2087219580=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <3768334.nZM7df9y4L@avalon>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

--===============2087219580==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:

> Hi Eric,
>
> On Tuesday 16 May 2017 09:47:49 Eric Anholt wrote:
>> Rob Herring <robh+dt@kernel.org> writes:
>> > On Mon, May 15, 2017 at 7:03 PM, Eric Anholt <eric@anholt.net> wrote:
>> >> Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:
>> >>> Hi Eric,
>> >>>=20
>> >>> Thank you for the patch.
>> >>>=20
>> >>> On Thursday 11 May 2017 16:56:23 Eric Anholt wrote:
>> >>>> The Raspberry Pi 7" Touchscreen is a DPI touchscreen panel with
>> >>>> DSI->DPI bridge and touchscreen controller integrated, that connects
>> >>>> to the Raspberry Pi through its 15-pin "DSI" connector (some lines =
are
>> >>>> DSI, some lines are I2C).
>> >>>>=20
>> >>>> This device is represented in the DT as three nodes (DSI device, I2C
>> >>>> device, panel).  Input will be left to a separate binding later, as=
 it
>> >>>> will be a basic I2C client device.
>> >>>>=20
>> >>>> Signed-off-by: Eric Anholt <eric@anholt.net>
>> >>>> ---
>> >>>>=20
>> >>>>  .../raspberrypi,7inch-touchscreen-bridge.txt       | 68 ++++++++++=
++++
>> >>>>  .../panel/raspberrypi,7inch-touchscreen-panel.txt  |  7 +++
>> >>>>  2 files changed, 75 insertions(+)
>> >>>>  create mode 100644
>> >>>>=20
>> >>>> Documentation/devicetree/bindings/display/bridge/raspberrypi,7inch-=
touc
>> >>>> hscreen-bridge.txt create mode 100644
>> >>>> Documentation/devicetree/bindings/display/panel/raspberrypi,7inch-t=
ouch
>> >>>> screen-panel.txt
>> >>>>=20
>> >>>> diff --git
>> >>>> a/Documentation/devicetree/bindings/display/bridge/raspberrypi,7inc=
h-to
>> >>>> uchscreen-bridge.txt
>> >>>> b/Documentation/devicetree/bindings/display/bridge/raspberrypi,7inc=
h-to
>> >>>> uchscreen-bridge.txt new file mode 100644
>> >>>> index 000000000000..a5669beaf68f
>> >>>> --- /dev/null
>> >>>> +++
>> >>>> b/Documentation/devicetree/bindings/display/bridge/raspberrypi,7inc=
h-to
>> >>>> uchscreen-bridge.txt
>> >>>> @@ -0,0 +1,68 @@
>> >>>> +Official 7" (800x480) Raspberry Pi touchscreen panel's bridge.
>> >>>> +
>> >>>> +This DSI panel contains:
>> >>>> +
>> >>>> +- TC358762 DSI->DPI bridge
>> >>>> +- Atmel microcontroller on I2C for power sequencing the DSI bridge=
 and
>> >>>> +  controlling backlight
>> >>>> +- Touchscreen controller on I2C for touch input
>> >>>> +
>> >>>> +and this covers the TC358762 bridge and Atmel microcontroller, whi=
le
>> >>>> +../panel/raspberrypi,7inch-touchscreen-panel.txt covers the panel.
>> >>>=20
>> >>> The TC358762 is a standalone bridge that doesn't depend on the ATTiny
>> >>> microcontroller used by the RPI. As it's usable standalone, I believe
>> >>> this binding should be split in two.
>> >>=20
>> >> Do you have a plan for how I would implement a driver on top of that
>> >> binding change, though?  Note that we don't program the Toshiba
>> >> directly, we only send commands to the Atmel.
>> >=20
>> > I agree. If it is a black box and the interface to the host is defined
>> > by the Atmel uC firmware, then that's what the DT should describe.
>> > Perhaps a diagram here or pointer to one would help and remove
>> > mentioning what kind of bridge chip it is.
>>=20
>> It's a *very* black box.  I have some non-public schematics that don't
>> even say what panel is involved, and no documentation of the uc
>> interface.  The driver code is just replicating the firmware's
>> programming sequence.
>>=20
>> I would certainly love to be building a generic TC358762 driver, which
>> would be a lot more satisfying.  I just don't think it's doable for this
>> panel.  Given that, what do I need to do to the DT?  Should I just drop
>> mention of the Toshiba and talk about this being a bridge with a custom
>> microcontroller firmware?
>
> I think that would be best, yes. Could you share a simple block-diagram o=
f the=20
> hardware ? It would help turning my random advices into semi-random advic=
es=20
> :-)

In terms of physical connections:

   [15-pin "DSI" connector on 2835]
    |                   |
    | I2C               | DSI
    |                   |
   / \        SPI       |
[TS]  [Atmel]------[TC358762]
       \                |
        \PWM            |
         \              | DPI
[some backlight]------[some unknown panel]

The binding I'm trying to create is to expose what's necessary for a
driver that talks I2C to the Atmel, which then controls the PWM and does
the command sequence over SPI to the Toshiba that sets up its end of the
DSI link.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlkbSQwACgkQtdYpNtH8
nujJnQ//VlJYib/sqU1jM8zuoOg6OI2qaIGrwP+9cekjU/U9A/dh9Zbb23jGQaaQ
Up+mZW69IqtY+b4XY22oyAKjpxVlUCtfJyFu4zR834TVjjOPL6B+r9sThkchYbsG
Hl3fiZHbHGS+e628VdamhvBn1EWKSxlwKHpxdDG6yIiNcMs4Kpmb78QwArcKiny3
TclwAOgdnGZeRM39a9VWy5okZD4kpdfuNkPDrhWsNMDeVvxs+IZEkmeSD+OTBmzj
Wyq4/sn7l6yyFA47/aCUjrhUAaGvg23+doBIaYYMrdBrPw9CDUdu9Oqr8wHMpu5b
sh9klgbxG49L1yXkQw6vClNfMEqOCCBEAJUA+WMD4aexbfc3vM9vCMR6dxcVJ8qc
Dom4EQJO2+1pXAsqVM5lC5YKCqH8YPoXSpCq+zzsg+OKqP3VF9JarBmJpWw1cb8/
F1UXD3GpJwpdSgbBfcz/dszUC02INAQUYypmj4Z0eKFJiwgr6v74BhTBXZ1Z9oNN
7fL7N1B0MEGvI+3qtDvzAr6bNc/mv72FnA8C3L6ghVP1U5DzIVDjU2Un7NvSesxE
7u0BNZBHj+UZDqyW45Al12471yLndptFR43V+ADHYbRzeXPlF78tFn5DJjM4pQDE
oCZwh5VnvFtYsGoz3HHFKi7drjVNRvCdk5UM17JgnzS1xoz5t/Q=
=29JP
-----END PGP SIGNATURE-----
--=-=-=--

--===============2087219580==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============2087219580==--
