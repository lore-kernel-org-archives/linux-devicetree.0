From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: h6: Add watchdog node
Date: Mon, 8 Apr 2019 23:23:26 +0200
Message-ID: <CAJiuCcefqtFoSTGRR2J2M0er-d+7+P5oKzDn2shxDustCLdAVQ@mail.gmail.com>
References: <20190404135736.8491-1-peron.clem@gmail.com> <20190404135736.8491-2-peron.clem@gmail.com>
 <20190405090236.e7vnyjzxmzfke3d6@flea> <CAGb2v65wcEAUTwRhC42iRkPaWXLGX1CJeq+TSzHVTOrT+L=8vA@mail.gmail.com>
 <20190405145005.jmmwsvbateqssbyq@flea> <CAGb2v66cv7dVwj7oyRaHT5Q2XCbNqzuS-Uk9hdNJbVv57QOmUg@mail.gmail.com>
 <20190405150810.zjwtu6crzaz6ufhx@flea> <CAJiuCccfmwxAqK1mTJ3eLO0RggV8sZTTKRy=fxFFenxn1hATvQ@mail.gmail.com>
 <CAJiuCcc5_tkmSM8sV2enG7t5=eU21ZrzcCVLUzF+c=8MiZhdFA@mail.gmail.com> <20190408081635.dlcppclakavwip6v@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190408081635.dlcppclakavwip6v@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Samuel Holland <samuel@sholland.org>
List-Id: devicetree@vger.kernel.org

On Mon, 8 Apr 2019 at 10:16, Maxime Ripard <maxime.ripard@bootlin.com> wrot=
e:
>
> On Sun, Apr 07, 2019 at 04:27:36PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > Hi,
> >
> > On Fri, 5 Apr 2019 at 18:24, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.=
com> wrote:
> > >
> > > Hi,
> > >
> > > On Fri, 5 Apr 2019 at 17:08, Maxime Ripard <maxime.ripard@bootlin.com=
> wrote:
> > > >
> > > > On Fri, Apr 05, 2019 at 10:59:35PM +0800, Chen-Yu Tsai wrote:
> > > > > On Fri, Apr 5, 2019 at 10:50 PM Maxime Ripard <maxime.ripard@boot=
lin.com> wrote:
> > > > > >
> > > > > > On Fri, Apr 05, 2019 at 10:35:08PM +0800, Chen-Yu Tsai wrote:
> > > > > > > On Fri, Apr 5, 2019 at 5:02 PM Maxime Ripard <maxime.ripard@b=
ootlin.com> wrote:
> > > > > > > >
> > > > > > > > On Thu, Apr 04, 2019 at 03:57:36PM +0200, Cl=C3=A9ment P=C3=
=A9ron wrote:
> > > > > > > > > Allwinner H6 has a watchog compatible with A31.
> > > > > > > > >
> > > > > > > > > Declare it in the device tree.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.=
com>
> > > > > > > >
> > > > > > > > Applied both, thanks!
> > > > > > > > Maxime
> > > > > > >
> > > > > > > IIRC there are 3 watchdogs on the H6. One is the trusted watc=
hdog,
> > > > > > > which should be reserved for underlying firmware.
> > > > > > >
> > > > > > > The other two are the normal and R-block watchdog. Although t=
hey
> > > > > > > look the same, the "normal" one can't reset the system. :(
> > > > > > > That one is actually the one ATF currently uses. So reboot do=
esn't
> > > > > > > work on the H6.
> > >
> > > Some users report that the reboot on the PineH64 actually works.
> > >
> > > Clement
> > >
> > > > > >
> > > > > > So that patch will not do anything then?
> >
> > Did some test and only interrupts are working right now. If the WDOG
> > is configured to make the board reboot the system will be stuck :S
> > Maybe better to disabled it for now and leave a comment.
>
> I dropped the two patches
What do you think about having it but disabled with a comment ?

I have tested the r_watchdog and this one is functionnal.

Clement

>
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
