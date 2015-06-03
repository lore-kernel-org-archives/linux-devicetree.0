Return-Path: <rvolkov@v1ros.org>
Date: Wed, 3 Jun 2015 11:06:14 +0300
From: Roman Volkov <rvolkov@v1ros.org>
Subject: Re: [PATCH v3 1/5] i8042: intel-8042 DT documentation
Message-ID: <20150603110614.3833fd37@v1ron-s7>
In-Reply-To: <20150531190015.66c02b8f@v1ron-s7>
References: <E1Yz4NQ-0000Cw-B5@feisty.vs19.net>
	<20150531183740.17593bd3@v1ron-s7>
	<20150531190015.66c02b8f@v1ron-s7>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Jiri Kosina <jkosina@suse.cz>, Wolfram Sang <wsa@the-dreams.de>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Tony Prisk <linux@prisktech.co.nz>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, In-reply-to 20150315032038.GA13064@dtor-ws
List-ID: <devicetree@vger.kernel.org>

Sun, 31 May 2015 19:00:15 +0300
Roman Volkov <rvolkov@v1ros.org> wrote:

> =D0=92 Sat, 14 Mar 2015 20:20:38 -0700
> Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>=20
> >=20
> > Hi Roman,
> >=20
> > On Mon, Feb 16, 2015 at 12:11:43AM +0300, Roman Volkov wrote: =20
> > > Documentation for 'intel,8042' DT compatible node.
> > >=20
> > > Signed-off-by: Tony Prisk <linux@prisktech.co.nz>
> > > Signed-off-by: Roman Volkov <v1ron@v1ros.org>
> > > ---
> > >  .../devicetree/bindings/input/intel-8042.txt       | 26
> > > ++++++++++++++++++++++ 1 file changed, 26 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/input/intel-8042.txt
> > >=20
> > > diff --git
> > > a/Documentation/devicetree/bindings/input/intel-8042.txt
> > > b/Documentation/devicetree/bindings/input/intel-8042.txt new file
> > > mode 100644 index 0000000..ab8a3e0 --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/input/intel-8042.txt
> > > @@ -0,0 +1,26 @@
> > > +Intel 8042 Keyboard Controller
> > > +
> > > +Required properties:
> > > +- compatible: should be "intel,8042"
> > > +- regs: memory for keyboard controller
> > > +- interrupts: usually, two interrupts should be specified
> > > (keyboard and aux).
> > > +	However, only one interrupt is also allowed in case of
> > > absence of the
> > > +	physical port in the controller. The i8042 driver must be
> > > loaded with
> > > +	nokbd/noaux option in this case.
> > > +- interrupt-names: interrupt names corresponding to numbers in
> > > the list.
> > > +	"kbd" is the keyboard interrupt and "aux" is the
> > > auxiliary (mouse)
> > > +	interrupt.
> > > +- command-reg: offset in memory for command register
> > > +- status-reg: offset in memory for status register
> > > +- data-reg: offset in memory for data register
> > > +
> > > +Example:
> > > +	i8042@d8008800 {
> > > +		compatible =3D "intel,8042";
> > > +		regs =3D <0xd8008800 0x100>;
> > > +		interrupts =3D <23>, <4>;
> > > +		interrupt-names =3D "kbd", "aux";
> > > +		command-reg =3D <0x04>;
> > > +		status-reg =3D <0x04>;
> > > +		data-reg =3D <0x00>;
> > > +	}; =20
> >=20
> > No, we already have existing OF bindings for i8042 on sparc and
> > powerpc, I do not think we need to invent a brand new one.
> >=20
> > Thanks.
> >  =20
>=20
> Hi Dmitry,
>=20
> I see some OF code in i8042-sparcio.h file. There are node definitions
> like "kb_ps2", "keyboard", "kdmouse", "mouse". Are these documented
> somewhere?
>=20
> Great if vt8500 is not unique with OF bindings for i8042. The code
> from sparc even looks compatible, only register offsets are hardcoded
> for specific machine. Is it possible to read offsets from Device Tree
> using these existing bindings without dealing with the kernel
> configuration?
>=20
> Regards,
> Roman

Sun, 31 May 2015 17:53:22 +0200
Hans de Goede <hdegoede@redhat.com> wrote:

> Have you looked at the existing bindings for ps/2 controllers
> under Documentation/devicetree/bindings/serio ?
>
> Regards,
>
> Hans

Hi Hans,

No, there is no bindings exactly for sparc ps/2 under that folder. There
is documentation for some custom drivers like altera and others, not
sure how much these are compatible with Intel's 8042. The sparcio
header looks like a special case when the Intel's 8042 driver is used
for non-x86 with OF. There is even no 'compatible' property in the
of_device_id in i8042-sparcio.h under drivers/input/serio, just the
name '8042'.

It is still open question what compatible strings should be used for
Intel's ps/2. Also I am not sure if it should be different in context
of different machines (as described in
http://devicetree.org/Device_Tree_Usage#Understanding_the_compatible_Proper=
ty).
The difference between various machines may be in the register offsets.

Regards,
Roman
