From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3] ARM: zynq: DT: Add USB to device tree
Date: Mon, 26 Jan 2015 10:44:03 -0800
Message-ID: <bb50396a16ab4042bdb554f72bde0bf7@BL2FFO11FD023.protection.gbl>
References: <1417536431-27759-1-git-send-email-soren.brinkmann@xilinx.com>
 <d78fedd84f354d80985187f851cb3cd1@BN1AFFO11FD055.protection.gbl>
 <54C5F89A.3090901@suse.de> <54C5F965.90100@monstr.eu>
 <54C5FBC3.7030903@suse.de> <54C60A56.7010403@suse.de>
 <c65880cef67945ebaf61306febc1349b@BN1BFFO11FD010.protection.gbl>
 <54C6698F.5020301@suse.de>
 <8f367d9b85924f8e9cc9cb6fdff9a054@BN1BFFO11FD040.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8f367d9b85924f8e9cc9cb6fdff9a054-fm2tX0oQAVwNXa/fZpHrC+hlVc3/7hDbVaz/vdPVXQ4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter Crosthwaite <peter.crosthwaite-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ola Jeppson <ola-hhg9azYwhpdWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2015-01-26 at 08:23AM -0800, S=C3=B6ren Brinkmann wrote:
> On Mon, 2015-01-26 at 05:21PM +0100, Andreas F=C3=A4rber wrote:
> > Am 26.01.2015 um 16:50 schrieb S=C3=B6ren Brinkmann:
> > > On Mon, 2015-01-26 at 10:35AM +0100, Andreas F=C3=A4rber wrote:
> > >> Am 26.01.2015 um 09:33 schrieb Andreas F=C3=A4rber:
> > >>> Am 26.01.2015 um 09:23 schrieb Michal Simek:
> > >>>> On 01/26/2015 09:19 AM, Andreas F=C3=A4rber wrote:
> > >>>>> And if I apply it to my -next based tree, adding correspondin=
g nodes to
> > >>>>> zynq-parallella.dts, I get repeatedly:
> > >>>>>
> > >>>>> [  +0,012242] ci_hdrc ci_hdrc.0: no of_node; not parsing pinc=
trl DT
> > >>>>> [  +0,000157] ci_hdrc ci_hdrc.0: ChipIdea HDRC found, lpm: 0;=
 cap:
> > >>>>> f090e100 op: f090e140
> > >>>>> [  +0,000081] platform ci_hdrc.0: Driver ci_hdrc requests pro=
be deferral
> > >>>>> [  +0,005360] ci_hdrc ci_hdrc.1: no of_node; not parsing pinc=
trl DT
> > >>>>> [  +0,000120] ci_hdrc ci_hdrc.1: ChipIdea HDRC found, lpm: 0;=
 cap:
> > >>>>> f0910100 op: f0910140
> > >>>>> [  +0,001810] platform ci_hdrc.1: Driver ci_hdrc requests pro=
be deferral
> > >>>>>
> > >>>>> Am I missing any other patches or config options?
> > >>>>> (I do notice that the pinctrl v3 patch that got merged has a =
trivial bug
> > >>>>> for usb0, for which I'll send a patch later on.)
> > >>>>
> > >>>> Why is it deferred? Is it because of pinmuxing stuff?
> > >>>
> > >>> No, happened without as well.
> > >>>
> > >>> Looking at a different place in dmesg, I spot this:
> > >>>
> > >>> [  +0,003988] usb_phy_generic phy0: GPIO lookup for consumer re=
set-gpios
> > >>> [  +0,000012] usb_phy_generic phy0: using device tree for GPIO =
lookup
> > >>> [  +0,000015] of_get_named_gpiod_flags: can't parse 'reset-gpio=
s-gpios'
> > >>> property
> > >>>  of node '/phy0[0]'
> > >>> [  +0,000013] of_get_named_gpiod_flags: can't parse 'reset-gpio=
s-gpio'
> > >>> property
> > >>> of node '/phy0[0]'
> > >>> [  +0,000010] usb_phy_generic phy0: using lookup tables for GPI=
O lookup
> > >>> [  +0,000153] usb_phy_generic phy0: lookup for GPIO reset-gpios=
 failed
> > >>> [  +0,000012] usb_phy_generic phy0: Error requesting RESET GPIO
> > >>> [  +0,004360] usb_phy_generic: probe of phy0 failed with error =
-2
> > >>> [  +0,004991] usb_phy_generic phy1: GPIO lookup for consumer re=
set-gpios
> > >>> [  +0,000012] usb_phy_generic phy1: using device tree for GPIO =
lookup
> > >>> [  +0,000013] of_get_named_gpiod_flags: can't parse 'reset-gpio=
s-gpios'
> > >>> property
> > >>>  of node '/phy1[0]'
> > >>> [  +0,000013] of_get_named_gpiod_flags: can't parse 'reset-gpio=
s-gpio'
> > >>> property of node '/phy1[0]'
> > >>> [  +0,000010] usb_phy_generic phy1: using lookup tables for GPI=
O lookup
> > >>> [  +0,000012] usb_phy_generic phy1: lookup for GPIO reset-gpios=
 failed
> > >>> [  +0,000011] usb_phy_generic phy1: Error requesting RESET GPIO
> > >>> [  +0,004337] usb_phy_generic: probe of phy1 failed with error =
-2
> > >>>
> > >>> So, I guess the chipidea driver is deferring because the phys w=
ant a
> > >>> property that neither me nor you are specifying? Would that be =
the two
> > >>> MDIO pins 52 and 53 that would need to be specified?
> > >>
> > >> Erm, scratch that last question - wrong PHY. Trying it resolved =
the
> > >> above phy errors but not the original problem. And so does an em=
pty one:
> > >>
> > >> @@ -99,11 +100,13 @@
> > >>
> > >>         usb_phy0: phy0 {
> > >>                 compatible =3D "usb-nop-xceiv";
> > >> +               reset-gpios =3D <>;
> > >>                 #phy-cells =3D <0>;
> > >>         };
> > >>
> > >>         usb_phy1: phy1 {
> > >>                 compatible =3D "usb-nop-xceiv";
> > >> +               reset-gpios =3D <>;
> > >>                 #phy-cells =3D <0>;
> > >>         };
> > >>  };
> > >>
> > >> In my manuals and notes I can't find any GPIO being used as rese=
t for
> > >> the USB PHYs. Any thoughts appreciated.
> > >=20
> > > Such a connection is optional. The platform might rely on its res=
et
> > > circuit, though it might not work for warm reboots.
> > > I haven't looked at parallela docs, but if there is a schematic
> > > available, that should tell you if/what is connected to the PHY r=
eset
> > > pin.
> >=20
> > I do have the schematic, and the way I read it, only the on-board r=
eset
> > button resets the PHYs.
> >=20
> > Yet it looks as if usb-nop-xceiv insists on a reset-gpios above, no=
?
> > Does it work on your boards with linux-next?
>=20
> I haven't re-tested it since I submitted the patches, but at that tim=
e
> it worked. But I also didn't test USB with the pinctrl patches togeth=
er.
> I'll do some testing later today.

So, just did a test. I took all the pinctrl stuff and this patch and ra=
n
it on a zc702. I plugged in a thumb drive and that worked just fine. So=
,
basically this patch could go in, despite missing pinctrl properties.

Michal: How do you wanna handle this? Could you create a branch that ha=
s
all the DT updates I can base stuff on, please? We could either take th=
e
pinctrl patches and this patch and add another one adding the pinctrl
properties to the USB nodes. Or leave this patch out for now and revise
it on top of the pinctrl patches.

	Thanks,
	S=C3=B6ren
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
