From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx: add Gateworks Ventana GW5904 support
Date: Sat, 11 Mar 2017 04:04:26 +0100
Message-ID: <20170311030426.GB6677@lunn.ch>
References: <1489178411-6559-1-git-send-email-tharvey@gateworks.com>
 <04584d61-f1e2-3722-1f13-ff133edc0c22@gmail.com>
 <CAJ+vNU1NcW=y_c-jJBnAaOozrzYJAekd9BEiMdd2=Bpx=Ng79Q@mail.gmail.com>
 <b105d1ea-7975-bd21-0aa0-762060ceb62a@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <b105d1ea-7975-bd21-0aa0-762060ceb62a-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 10, 2017 at 05:20:11PM -0800, Florian Fainelli wrote:
> On 03/10/2017 05:07 PM, Tim Harvey wrote:
> > On Fri, Mar 10, 2017 at 12:43 PM, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >>
> >>> +     dsa {
> >>> +             compatible = "marvell,dsa";
> >>> +             #address-cells = <2>;
> >>> +             #size-cells = <0>;
> >>> +
> >>> +             dsa,ethernet = <&fec>;
> >>> +             dsa,mii-bus = <&mdio>;
> >>> +
> >>
> >> Please consider using the new binding for DSA switches, see:
> >>
> >> https://patchwork.kernel.org/patch/9493037/
> >>
> > 
> > Hi Florian,
> > 
> > I tried the new binding first, but haven't gotten it to work yet. Let
> > me make sure I understand what I should be doing.
> > 
> > This is a MV88E6176 so I first need to add dt support for that to the
> > mv88e6xxx driver (which supports the device, just not via dt):

Hi Tim

Nope. The 6176 is compatible with the 6085.

> > Then I remove the old binding and add the new binding as such:
> > 
> > &fec {
> >         pinctrl-names = "default";
> >         pinctrl-0 = <&pinctrl_enet>;
> >         phy-mode = "rgmii-id";
> >         status = "okay";
> 
> You most likely need to declare a fixed PHY for the FEC to be setting up
> the link, speed and duplex?

Take a look at arch/arm/boot/dts/vf610-zii-dev* as an example. This
uses a vf610, so is somewhat similar to the imx6. Same fec driver, but
the mdio is more complex due to there being 3 switches.

     Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
