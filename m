From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH v3] ARM: zynq: DT: Add USB to device tree
Date: Mon, 26 Jan 2015 17:20:48 -0800
Message-ID: <b9115b5a2a4f4cefa4a16721dd4ea3b2@BY2FFO11FD053.protection.gbl>
References: <d78fedd84f354d80985187f851cb3cd1@BN1AFFO11FD055.protection.gbl>
 <54C5F89A.3090901@suse.de> <54C5F965.90100@monstr.eu>
 <54C5FBC3.7030903@suse.de> <54C60A56.7010403@suse.de>
 <c65880cef67945ebaf61306febc1349b@BN1BFFO11FD010.protection.gbl>
 <54C6698F.5020301@suse.de>
 <8f367d9b85924f8e9cc9cb6fdff9a054@BN1BFFO11FD040.protection.gbl>
 <bb50396a16ab4042bdb554f72bde0bf7@BL2FFO11FD023.protection.gbl>
 <54C6E672.4030602@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54C6E672.4030602@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Cc: monstr@monstr.eu, Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ola Jeppson <ola@adapteva.com>, linux-gpio@vger.kernel.org, linux-usb@vger.kernel.org, Felipe Balbi <balbi@ti.com>
List-Id: devicetree@vger.kernel.org

On Tue, 2015-01-27 at 02:14AM +0100, Andreas F=C3=A4rber wrote:
> + linux-gpio, linux-usb, Felipe Balbi
>=20
> Am 26.01.2015 um 19:44 schrieb S=C3=B6ren Brinkmann:
> > On Mon, 2015-01-26 at 08:23AM -0800, S=C3=B6ren Brinkmann wrote:
> >> On Mon, 2015-01-26 at 05:21PM +0100, Andreas F=C3=A4rber wrote:
> >>> Am 26.01.2015 um 16:50 schrieb S=C3=B6ren Brinkmann:
> >>>> On Mon, 2015-01-26 at 10:35AM +0100, Andreas F=C3=A4rber wrote:
> >>>>> Am 26.01.2015 um 09:33 schrieb Andreas F=C3=A4rber:
> >>>>>> Am 26.01.2015 um 09:23 schrieb Michal Simek:
> >>>>>>> On 01/26/2015 09:19 AM, Andreas F=C3=A4rber wrote:
> >>>>>>>> And if I apply it to my -next based tree, adding correspondi=
ng nodes to
> >>>>>>>> zynq-parallella.dts, I get repeatedly:
> >>>>>>>>
> >>>>>>>> [  +0,012242] ci_hdrc ci_hdrc.0: no of_node; not parsing pin=
ctrl DT
> >>>>>>>> [  +0,000157] ci_hdrc ci_hdrc.0: ChipIdea HDRC found, lpm: 0=
; cap:
> >>>>>>>> f090e100 op: f090e140
> >>>>>>>> [  +0,000081] platform ci_hdrc.0: Driver ci_hdrc requests pr=
obe deferral
> >>>>>>>> [  +0,005360] ci_hdrc ci_hdrc.1: no of_node; not parsing pin=
ctrl DT
> >>>>>>>> [  +0,000120] ci_hdrc ci_hdrc.1: ChipIdea HDRC found, lpm: 0=
; cap:
> >>>>>>>> f0910100 op: f0910140
> >>>>>>>> [  +0,001810] platform ci_hdrc.1: Driver ci_hdrc requests pr=
obe deferral
> >>>>>>>>
> >>>>>>>> Am I missing any other patches or config options?
> [...]
> >>>>>>> Why is it deferred? Is it because of pinmuxing stuff?
> >>>>>>
> >>>>>> No, happened without as well.
> >>>>>>
> >>>>>> Looking at a different place in dmesg, I spot this:
> >>>>>>
> >>>>>> [  +0,003988] usb_phy_generic phy0: GPIO lookup for consumer r=
eset-gpios
> >>>>>> [  +0,000012] usb_phy_generic phy0: using device tree for GPIO=
 lookup
> >>>>>> [  +0,000015] of_get_named_gpiod_flags: can't parse 'reset-gpi=
os-gpios'
> >>>>>> property
> >>>>>>  of node '/phy0[0]'
> >>>>>> [  +0,000013] of_get_named_gpiod_flags: can't parse 'reset-gpi=
os-gpio'
> >>>>>> property
> >>>>>> of node '/phy0[0]'
> >>>>>> [  +0,000010] usb_phy_generic phy0: using lookup tables for GP=
IO lookup
> >>>>>> [  +0,000153] usb_phy_generic phy0: lookup for GPIO reset-gpio=
s failed
> >>>>>> [  +0,000012] usb_phy_generic phy0: Error requesting RESET GPI=
O
> >>>>>> [  +0,004360] usb_phy_generic: probe of phy0 failed with error=
 -2
> >>>>>> [  +0,004991] usb_phy_generic phy1: GPIO lookup for consumer r=
eset-gpios
> >>>>>> [  +0,000012] usb_phy_generic phy1: using device tree for GPIO=
 lookup
> >>>>>> [  +0,000013] of_get_named_gpiod_flags: can't parse 'reset-gpi=
os-gpios'
> >>>>>> property
> >>>>>>  of node '/phy1[0]'
> >>>>>> [  +0,000013] of_get_named_gpiod_flags: can't parse 'reset-gpi=
os-gpio'
> >>>>>> property of node '/phy1[0]'
> >>>>>> [  +0,000010] usb_phy_generic phy1: using lookup tables for GP=
IO lookup
> >>>>>> [  +0,000012] usb_phy_generic phy1: lookup for GPIO reset-gpio=
s failed
> >>>>>> [  +0,000011] usb_phy_generic phy1: Error requesting RESET GPI=
O
> >>>>>> [  +0,004337] usb_phy_generic: probe of phy1 failed with error=
 -2
> >>>>>>
> >>>>>> So, I guess the chipidea driver is deferring because the phys =
want a
> >>>>>> property that neither me nor you are specifying? [...]
> [...]
> >>>>> In my manuals and notes I can't find any GPIO being used as res=
et for
> >>>>> the USB PHYs. Any thoughts appreciated.
> >>>>
> >>>> Such a connection is optional. The platform might rely on its re=
set
> >>>> circuit, though it might not work for warm reboots.
> >>>> I haven't looked at parallela docs, but if there is a schematic
> >>>> available, that should tell you if/what is connected to the PHY =
reset
> >>>> pin.
> >>>
> >>> I do have the schematic, and the way I read it, only the on-board=
 reset
> >>> button resets the PHYs.
> >>>
> >>> Yet it looks as if usb-nop-xceiv insists on a reset-gpios above, =
no?
> >>> Does it work on your boards with linux-next?
> >>
> >> I haven't re-tested it since I submitted the patches, but at that =
time
> >> it worked. But I also didn't test USB with the pinctrl patches tog=
ether.
> >> I'll do some testing later today.
> >=20
> > So, just did a test. I took all the pinctrl stuff and this patch an=
d ran
> > it on a zc702. I plugged in a thumb drive and that worked just fine=
=2E So,
> > basically this patch could go in, despite missing pinctrl propertie=
s.
>=20
> For my board I needed the following workaround:
>=20
> diff --git a/drivers/usb/phy/phy-generic.c b/drivers/usb/phy/phy-gene=
ric.c
> index dd05254241fb..96c7c36e22a6 100644
> --- a/drivers/usb/phy/phy-generic.c
> +++ b/drivers/usb/phy/phy-generic.c
> @@ -218,13 +218,13 @@ int usb_phy_gen_create_phy(struct device *dev,
> struct usb_phy_generic *nop,
>                         clk_rate =3D 0;
>=20
>                 needs_vcc =3D of_property_read_bool(node, "vcc-supply=
");
> -               nop->gpiod_reset =3D devm_gpiod_get(dev, "reset-gpios=
");
> +               /*nop->gpiod_reset =3D devm_gpiod_get(dev, "reset-gpi=
os");
>                 err =3D PTR_ERR(nop->gpiod_reset);
>                 if (!err) {
>                         nop->gpiod_vbus =3D devm_gpiod_get(dev,
>=20
> "vbus-detect-gpio");
>                         err =3D PTR_ERR(nop->gpiod_vbus);
> -               }
> +               }*/
>         } else if (pdata) {
>                 type =3D pdata->type;
>                 clk_rate =3D pdata->clk_rate;
>=20
> [  +0,004738] usb_phy_generic phy0: Looking up vcc-supply from device=
 tree
> [  +0,000018] usb_phy_generic phy0: Looking up vcc-supply property in
> node /phy0 failed
> [  +0,000011] phy0 supply vcc not found, using dummy regulator
> [  +0,004844] usb_phy_generic phy1: Looking up vcc-supply from device=
 tree
> [  +0,000017] usb_phy_generic phy1: Looking up vcc-supply property in
> node /phy1 failed
> [  +0,000008] phy1 supply vcc not found, using dummy regulator
>=20
> Basically, usb-nop-xceiv fails to probe when reset-gpios property is
> absent (and probably also when vbus-detect-gpio property is absent).
> So I don't understand why it would work for your boards without such
> properties on today's linux-next... sounds like you tested a differen=
t tree?

I tested on the 3.19 tip, not on next. I see the problems you see on
next though. Haven't really dug deeper yet.

>=20
> Take a look at __gpiod_get_index() called from devm_gpiod_get():
> http://lxr.free-electrons.com/source/drivers/gpio/gpiolib.c#L1648
>=20
> !desc || desc =3D=3D ERR_PTR(-ENOENT) results in the above "using loo=
kup
> tables for GPIO lookup", then IS_ERR(desc) in "lookup for GPIO %s fai=
led".
>=20
> My interpretation is that this gpiolib code is probably okay but that
> the generic usb phy code fails to check for specific error codes such=
 as
> absent property (as opposed to deferred resolution of a phandle, wher=
e
> we do want to return -EDEFER early).

Sounds like you're already close.

	S=C3=B6ren
