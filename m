From: Jason <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: Re: [PATCH 1/2 v5] arm: kirkwood: add dreamplug (fdt) support.
Date: Thu, 23 Feb 2012 16:11:38 -0500
Message-ID: <20120223211138.GP23524@titan.lakedaemon.net>
References: <cover.1312906908.git.jason@lakedaemon.net>
 <cover.1330025976.git.jason@lakedaemon.net>
 <1192198e66f9a30eb13fa427240e91fb7f0a49e4.1330025976.git.jason@lakedaemon.net>
 <CACxGe6vjzXUwvGu73p+5L2-cW5EOJtFcR8JW8-gOUrRt-choJg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACxGe6vjzXUwvGu73p+5L2-cW5EOJtFcR8JW8-gOUrRt-choJg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

On Thu, Feb 23, 2012 at 01:18:55PM -0700, Grant Likely wrote:
> On Thu, Feb 23, 2012 at 12:52 PM, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> wro=
te:
> > Initially, copied guruplug-setup.c and did s/guruplug/dreamplug/g.
> > Then, switched to SPI based NOR flash.
> >
> > After talking to Arnd Bergman, chose an incremental approach to adding
> > devicetree support. =A0First, we use the dtb to tell us we are on the
> > dreamplug, then we gradually port over drivers.
> >
> > Driver porting will start with the uart (see next patch), and progress
> > from there. =A0Possibly, spi/flash/partitions will be next.
> >
> > When done, board-dt.c will no longer be dreamplug specific, and dt's can
> > be made for the other kirkwood boards.
> >
> > Signed-off-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
> > ---
> > Changes from v1
> >
> > =A0 - attempting dts, looking for pointers.
> >
> > Changes from v2
> >
> > =A0 - resubmit as MACH_TYPE_DREAMPLUG (3550) is in arm/for-next, rebased
> > =A0 =A0 against same.
> > =A0 - removed lame fdt attempt, others are working on kirkwood fdt. =A0=
Will
> > =A0 =A0 convert once kirkwood fdt is mainline.
> > =A0 - s/boot_params/atag_offset/
> > =A0 - added kirkwood_reset
> > =A0 - 1 checkpatch.pl warning (help in Kconfig), looks the same as all
> > =A0 =A0 other kirkwood boards...
> >
> > Changes from v3
> >
> > =A0 - rebased against v3.3-rc3 (recommended by Arnd)
> > =A0 - use devicetree to determine which board we are on
> > =A0 - added patch to configure uart0 from devicetree
> >
> > Changes from v4
> >
> > =A0 - fixed Kconfig logic so user can always see 'Dreamplug' in menucon=
fig.
> > =A0 - changed 'marvell,dreamplug' to 'globalscale,dreamplug' as suggest=
ed by
> > =A0 =A0 Grant Likely.
> > =A0 - fixed of_machine_is_compatible() logic for calling dreamplug spec=
ific
> > =A0 =A0 init functions.
> >
> > =A0arch/arm/boot/dts/kirkwood-dreamplug.dts | =A0 18 +++
> > =A0arch/arm/boot/dts/kirkwood.dtsi =A0 =A0 =A0 =A0 =A0| =A0 =A06 +
> > =A0arch/arm/mach-kirkwood/Kconfig =A0 =A0 =A0 =A0 =A0 | =A0 14 +++
> > =A0arch/arm/mach-kirkwood/Makefile =A0 =A0 =A0 =A0 =A0| =A0 =A01 +
> > =A0arch/arm/mach-kirkwood/Makefile.boot =A0 =A0 | =A0 =A02 +
> > =A0arch/arm/mach-kirkwood/board-dt.c =A0 =A0 =A0 =A0| =A0182 ++++++++++=
++++++++++++++++++++
> > =A06 files changed, 223 insertions(+), 0 deletions(-)
> > =A0create mode 100644 arch/arm/boot/dts/kirkwood-dreamplug.dts
> > =A0create mode 100644 arch/arm/boot/dts/kirkwood.dtsi
> > =A0create mode 100644 arch/arm/mach-kirkwood/board-dt.c
> >
> > diff --git a/arch/arm/boot/dts/kirkwood-dreamplug.dts b/arch/arm/boot/d=
ts/kirkwood-dreamplug.dts
> > new file mode 100644
> > index 0000000..765813f
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/kirkwood-dreamplug.dts
> > @@ -0,0 +1,18 @@
> > +/dts-v1/;
> > +
> > +/include/ "kirkwood.dtsi"
> > +
> > +/ {
> > + =A0 =A0 =A0 model =3D "Globalscale Technologies Dreamplug";
> > + =A0 =A0 =A0 compatible =3D "globalscale,dreamplug", "globalscale,kirk=
wood";
> =

> Hahaha... okay, more clarification is needed here.
> =

> The compatible property is a list, and the first entry must always be
> the exact device model.  That is why the vendor of the hardware is in
> the prefix.  However, the following entries are a list of devices that
> it is 'compatible' with.  In the case of the top-level compatible
> property, we've been using the convention of including a string for
> the SoC, and in that case the manufacturer is indeed Marvell.
> =

> Also, *be specific*.  Kirkwood is a family of processors, not a single
> SoC.  The compatible string should reflect that.  So, in your case,
> compatible should look something like:
> =

> compatible =3D "globalscale,dreamplug", "marvell,kirkwood-88f6281";

ahhh... ok.  So, my board-dt.c should have:

static const char *kirkwood_dt_board_compat[] =3D {
        "marvell,kirkwood",
        NULL
};

And then the test to run the dreamplug specific init should be:

        if (of_machine_is_compatible("globalscale,dreamplug"))
                dreamplug_init();

And then, kirkwood.dtsi:

compatible =3D "marvell,kirkwood";

and kirkwood-dreamplug.dts:

compatible =3D "globalscale,dreamplug", "marvell,kirkwood-88f6281-a1";


My only question is, should the kirkwood.dtsi have just
"marvell,kirkwood", or "marvell,kirkwood","marvell,kirkwood-88f6281-a1"?

I'm guessing kirkwood.dtsi is a generic devicetree, and should just be
"marvell,kirkwood".  If that's true, then *kirkwood_dt_board_compat
should just be "marvell,kirkwood" since board-dt.c should be able to
handle any kirkwood SoC.

Sorry for being so dense.

thx,

Jason.
