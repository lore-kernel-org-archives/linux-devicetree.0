From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v3 1/4] dt-bindings: add SMP enable-method for Broadcom
 NSP
Date: Sun, 8 Nov 2015 17:31:17 +0000
Message-ID: <20151108173116.GV8644@n2100.arm.linux.org.uk>
References: <1446844273-6460-1-git-send-email-kapilh@broadcom.com>
 <1446844273-6460-2-git-send-email-kapilh@broadcom.com>
 <563E6FC7.6070700@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <563E6FC7.6070700@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Kapil Hali <kapilh@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Gregory Fong <gregory.0xf0@gmail.com>, Lee Jones <lee@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Olof Johansson <olof@lixom.net>, Paul Walmsley <paul@pwsan.com>, Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

On Sat, Nov 07, 2015 at 01:40:23PM -0800, Florian Fainelli wrote:
> Le 06/11/2015 13:11, Kapil Hali a =E9crit :
> > Add a compatible string "brcm,bcm-nsp-smp" for Broadcom's
> > Northstar Plus CPU to the 32-bit ARM CPU device tree binding
> > documentation file and create a new binding documentation for
> > Northstar Plus CPU.
> >=20
> > Signed-off-by: Kapil Hali <kapilh@broadcom.com>
> > ---
> >  .../bindings/arm/bcm/brcm,nsp-cpu-method.txt       | 36 ++++++++++=
++++++++++++
> >  Documentation/devicetree/bindings/arm/cpus.txt     |  1 +
> >  2 files changed, 37 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,=
nsp-cpu-method.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu=
-method.txt b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-me=
thod.txt
> > new file mode 100644
> > index 0000000..8506da7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp-cpu-method=
=2Etxt
> > @@ -0,0 +1,36 @@
> > +Broadcom Northstar Plus SoC CPU Enable Method
> > +---------------------------------------------
> > +This binding defines the enable method used for starting secondary
> > +CPUs in the following Broadcom SoCs:
> > +  BCM58522, BCM58525, BCM58535, BCM58622, BCM58623, BCM58625, BCM8=
8312
> > +
> > +The enable method is specified by defining the following required
> > +properties in the "cpus" device tree node:
> > +  - enable-method =3D "brcm,bcm-nsp-smp";
> > +  - secondary-boot-reg =3D <...>;
> > +
> > +The secondary-boot-reg property is a u32 value that specifies the
> > +physical address of the register used to request the ROM holding p=
en
> > +code release a secondary CPU.
>=20
> Is it really how the ROM code is implemented, as a pen holding/releas=
e
> mechanism (which sounds like how this was implemented previously in t=
he
> kernel actually) or should this be described in a more generic way as
> the physical address of the register where the secondary CPUs reset
> vector address must be written to? Or something along these lines.

Why do people insist on using holding pens to bring their secondary CPU=
s
into existence?  I hope the hardware people aren't being dumb and have =
no
way to hold in reset or power down their secondary CPUs, either of whic=
h
is a vital feature for things like kexec and the like.  If they do have
a way to hold secondary CPUs in reset or powered down, why aren't they
using that at boot instead of implementing the stupid Versatile scheme,
which exists because Versatile _can't_ hold its CPUs in reset or power
them down...

It's times like this that I wonder what kind of drugs the hardware SoC
people are on, but I'm well aware that people contributing SMP bringup
solutions are also dumb idiots who copy the Versatile scheme with very
little thought... (as you can see, I'm not mincing my words here - if
people want to be lazy in this regard despite this having been brought
up multiple times, and the lead developers having said that the versati=
le
pen_release stuff should not be used, they earn themselves the right to
be called dumb idiots.  Simple solution to avoid that title: don't be a
dumb idiot by copy the Versatile SMP bring up code!  It's not a sane
model for any SoC sane SoC to follow.)

Is this clear enough?

--=20
=46TTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
