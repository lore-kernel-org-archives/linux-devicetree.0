From: Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH 1/2 v5] arm: kirkwood: add dreamplug (fdt) support.
Date: Fri, 24 Feb 2012 14:36:35 -0500
Message-ID: <20120224193635.GT23524@titan.lakedaemon.net>
References: <cover.1312906908.git.jason@lakedaemon.net>
 <cover.1330025976.git.jason@lakedaemon.net>
 <1192198e66f9a30eb13fa427240e91fb7f0a49e4.1330025976.git.jason@lakedaemon.net>
 <CACxGe6vjzXUwvGu73p+5L2-cW5EOJtFcR8JW8-gOUrRt-choJg@mail.gmail.com>
 <20120223211138.GP23524@titan.lakedaemon.net>
 <CACxGe6uMcOWC6ukTGF1soyfeTkT2fkmewhKUKA-AiK8hQDzCGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACxGe6uMcOWC6ukTGF1soyfeTkT2fkmewhKUKA-AiK8hQDzCGQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 23, 2012 at 02:21:15PM -0700, Grant Likely wrote:
> On Thu, Feb 23, 2012 at 2:11 PM, Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> wrote:
> > On Thu, Feb 23, 2012 at 01:18:55PM -0700, Grant Likely wrote:
> >> On Thu, Feb 23, 2012 at 12:52 PM, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> =
wrote:
> >> > Initially, copied guruplug-setup.c and did s/guruplug/dreamplug/g.
> >> > Then, switched to SPI based NOR flash.
> >> >
> >> > After talking to Arnd Bergman, chose an incremental approach to addi=
ng
> >> > devicetree support. =A0First, we use the dtb to tell us we are on the
> >> > dreamplug, then we gradually port over drivers.
> >> >
> >> > Driver porting will start with the uart (see next patch), and progre=
ss
> >> > from there. =A0Possibly, spi/flash/partitions will be next.
> >> >
> >> > When done, board-dt.c will no longer be dreamplug specific, and dt's=
 can
> >> > be made for the other kirkwood boards.
> >> >
> >> > Signed-off-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
> >> > ---
> >> > Changes from v1
> >> >
> >> > =A0 - attempting dts, looking for pointers.
> >> >
> >> > Changes from v2
> >> >
> >> > =A0 - resubmit as MACH_TYPE_DREAMPLUG (3550) is in arm/for-next, reb=
ased
> >> > =A0 =A0 against same.
> >> > =A0 - removed lame fdt attempt, others are working on kirkwood fdt. =
=A0Will
> >> > =A0 =A0 convert once kirkwood fdt is mainline.
> >> > =A0 - s/boot_params/atag_offset/
> >> > =A0 - added kirkwood_reset
> >> > =A0 - 1 checkpatch.pl warning (help in Kconfig), looks the same as a=
ll
> >> > =A0 =A0 other kirkwood boards...
> >> >
> >> > Changes from v3
> >> >
> >> > =A0 - rebased against v3.3-rc3 (recommended by Arnd)
> >> > =A0 - use devicetree to determine which board we are on
> >> > =A0 - added patch to configure uart0 from devicetree
> >> >
> >> > Changes from v4
> >> >
> >> > =A0 - fixed Kconfig logic so user can always see 'Dreamplug' in menu=
config.
> >> > =A0 - changed 'marvell,dreamplug' to 'globalscale,dreamplug' as sugg=
ested by
> >> > =A0 =A0 Grant Likely.
> >> > =A0 - fixed of_machine_is_compatible() logic for calling dreamplug s=
pecific
> >> > =A0 =A0 init functions.
> >> >
> >> > =A0arch/arm/boot/dts/kirkwood-dreamplug.dts | =A0 18 +++
> >> > =A0arch/arm/boot/dts/kirkwood.dtsi =A0 =A0 =A0 =A0 =A0| =A0 =A06 +
> >> > =A0arch/arm/mach-kirkwood/Kconfig =A0 =A0 =A0 =A0 =A0 | =A0 14 +++
> >> > =A0arch/arm/mach-kirkwood/Makefile =A0 =A0 =A0 =A0 =A0| =A0 =A01 +
> >> > =A0arch/arm/mach-kirkwood/Makefile.boot =A0 =A0 | =A0 =A02 +
> >> > =A0arch/arm/mach-kirkwood/board-dt.c =A0 =A0 =A0 =A0| =A0182 +++++++=
+++++++++++++++++++++++
> >> > =A06 files changed, 223 insertions(+), 0 deletions(-)
> >> > =A0create mode 100644 arch/arm/boot/dts/kirkwood-dreamplug.dts
> >> > =A0create mode 100644 arch/arm/boot/dts/kirkwood.dtsi
> >> > =A0create mode 100644 arch/arm/mach-kirkwood/board-dt.c
> >> >
> >> > diff --git a/arch/arm/boot/dts/kirkwood-dreamplug.dts b/arch/arm/boo=
t/dts/kirkwood-dreamplug.dts
> >> > new file mode 100644
> >> > index 0000000..765813f
> >> > --- /dev/null
> >> > +++ b/arch/arm/boot/dts/kirkwood-dreamplug.dts
> >> > @@ -0,0 +1,18 @@
> >> > +/dts-v1/;
> >> > +
> >> > +/include/ "kirkwood.dtsi"
> >> > +
> >> > +/ {
> >> > + =A0 =A0 =A0 model =3D "Globalscale Technologies Dreamplug";
> >> > + =A0 =A0 =A0 compatible =3D "globalscale,dreamplug", "globalscale,k=
irkwood";
> >>
> >> Hahaha... okay, more clarification is needed here.
> >>
> >> The compatible property is a list, and the first entry must always be
> >> the exact device model. =A0That is why the vendor of the hardware is in
> >> the prefix. =A0However, the following entries are a list of devices th=
at
> >> it is 'compatible' with. =A0In the case of the top-level compatible
> >> property, we've been using the convention of including a string for
> >> the SoC, and in that case the manufacturer is indeed Marvell.
> >>
> >> Also, *be specific*. =A0Kirkwood is a family of processors, not a sing=
le
> >> SoC. =A0The compatible string should reflect that. =A0So, in your case,
> >> compatible should look something like:
> >>
> >> compatible =3D "globalscale,dreamplug", "marvell,kirkwood-88f6281";
> >
> > ahhh... ok. =A0So, my board-dt.c should have:
> >
> > static const char *kirkwood_dt_board_compat[] =3D {
> > =A0 =A0 =A0 =A0"marvell,kirkwood",
> > =A0 =A0 =A0 =A0NULL
> > };
> >
> > And then the test to run the dreamplug specific init should be:
> >
> > =A0 =A0 =A0 =A0if (of_machine_is_compatible("globalscale,dreamplug"))
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dreamplug_init();
> >
> > And then, kirkwood.dtsi:
> >
> > compatible =3D "marvell,kirkwood";
> >
> > and kirkwood-dreamplug.dts:
> >
> > compatible =3D "globalscale,dreamplug", "marvell,kirkwood-88f6281-a1";
> >
> >
> > My only question is, should the kirkwood.dtsi have just
> > "marvell,kirkwood", or "marvell,kirkwood","marvell,kirkwood-88f6281-a1"?
> =

> Fix the order.  The list is ordered from most specific to least.
> Also, if the silicon revision can be read out of the SoC at runtime,
> then including the -a1 revision is probably overkill.

With kirkwood, it's able to determine the whole SoC part number (see
arch/arm/mach-kirkwood/common.c:394 kirkwood_id()).  So, the kernel
doesn't need to rely on the devicetree to determine which kirkwood it is
at runtime.

I'll include it as you've recommended.  I'd rather stick with convention
until we can prove we need to do otherwise.

> So, something like the following is fine:
> =

> compatible =3D "globalscale,dreamplug", "marvell,kirkwood-88f6281",
> "marvell,kirkwood";
> =

> BTW, does the dreamplug have a part number?

Yes, so I'll do in kirkwood-dreamplug.dts:

compatible =3D "globalscale,dreamplug-003-ds2001",
"globalscale,dreamplug", "marvell,kirkwood-88f6281", "marvell,kirkwood"

Thanks for the help

Jason.
