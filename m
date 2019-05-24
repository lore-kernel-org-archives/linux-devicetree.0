From: Rob Herring <robh@kernel.org>
Subject: Re: [EXT] Re: [PATCH] arm64: dts: ls1028a: fix watchdog device node
Date: Fri, 24 May 2019 07:29:20 -0500
Message-ID: <CAL_Jsq+evXqKKyXLFbE+9o8X5BA9NWmcjvZ9-Y1Y7-pwcu8nJg@mail.gmail.com>
References: <20190509070657.18281-1-chuanhua.han@nxp.com> <20190517023728.GA15856@dragon>
 <AM6PR04MB4357C78FCEBA1B00AA42ED2E970B0@AM6PR04MB4357.eurprd04.prod.outlook.com>
 <AM6PR04MB586341334E62A663EE5E8BD18F0B0@AM6PR04MB5863.eurprd04.prod.outlook.com>
 <AM6PR04MB435758E1498B6A2BE0C0ACE397070@AM6PR04MB4357.eurprd04.prod.outlook.com>
 <AM6PR04MB58631458E6D851E4D83A77ED8F070@AM6PR04MB5863.eurprd04.prod.outlook.com>
 <AM6PR04MB435708872A4DBA92561C772597000@AM6PR04MB4357.eurprd04.prod.outlook.com>
 <AM6PR04MB5863FA1CE6D1E40F11B2E5008F000@AM6PR04MB5863.eurprd04.prod.outlook.com>
 <AM6PR04MB4357072E079BDD8D1866595797020@AM6PR04MB4357.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AM6PR04MB4357072E079BDD8D1866595797020@AM6PR04MB4357.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chuanhua Han <chuanhua.han@nxp.com>
Cc: Leo Li <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ying Zhang <ying.zhang22455@nxp.com>
List-Id: devicetree@vger.kernel.org

On Fri, May 24, 2019 at 4:48 AM Chuanhua Han <chuanhua.han@nxp.com> wrote:
>
> Hi, Rob Herring
>
> > -----Original Message-----
> > From: Leo Li
> > Sent: 2019=E5=B9=B45=E6=9C=8822=E6=97=A5 14:50


> > > > > > > > > -             wdog0: watchdog@23c0000 {
> > > > > > > > > -                     compatible =3D "fsl,ls1028a-wdt",
> > > > "fsl,imx21-wdt";
> > > > > > > > > -                     reg =3D <0x0 0x23c0000 0x0 0x10000>=
;
> > > > > > > > > -                     interrupts =3D <GIC_SPI 59
> > > > > > IRQ_TYPE_LEVEL_HIGH>;
> > > > > > > > > -                     clocks =3D <&clockgen 4 1>;
> > > > > > > > > -                     big-endian;
> > > > > > > > > -                     status =3D "disabled";
> > > > > > > > > +             cluster1_core0_watchdog: wdt@c000000 {
> > > > > > > >
> > > > > > > > Keep 'watchdog' as the node name,
> > > > > > > Thanks for your replay
> > > > > > > Do you mean replace the =E2=80=98wdt=E2=80=99 with =E2=80=98w=
atchdog=E2=80=99?
> > > > > > > and keep nodes sort in unit-address.
> > > > > > > What does this mean?
> > > > > >
> > > > > > That means order the nodes by the addresses (e.g. c000000,
> > > > > > c010000)
> > > > > The current order is correct=EF=BC=88The first is c000000, then c=
000000=EF=BC=89.
> > > >
> > > > But they are added after gpio@2320000 and before sata@3200000.
> > > I changed and made the second version of the patch, but I found the
> > > following error when I executed ./scripts/checkpatch.pl xxx.patch to
> > > check the patch:
> > >
> > > WARNING: DT compatible string vendor "arm" appears un-documented --
> > > check ./Documentation/devicetree/bindings/vendor-prefixes.txt
> > > #43: FILE: arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi:351:
> > > + compatible =3D "arm,sp805", "arm,primecell";
> > >
> > > However, there is no vendor-prefixes.txt file in the
> > > ./Documentation/devicetree/bindings/ directory, only vendor-
> > > prefixes.yaml.
> > > Moreover, there are =E2=80=98arm=E2=80=99 vendors in vendor-prefixes.=
yaml.
> >
> > Added Rob Herring to the thread.
> >
> > > Request help=EF=BC=8Cthanks
> How can I solve this patch check error? Ask for help, thank you!

Ignore it. A fix to checkpatch.pl is pending.

Rob
