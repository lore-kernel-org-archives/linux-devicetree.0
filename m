From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx: add Gateworks Ventana GW5904 support
Date: Mon, 13 Mar 2017 14:28:54 +0100
Message-ID: <20170313132854.GB748@lunn.ch>
References: <1489178411-6559-1-git-send-email-tharvey@gateworks.com>
 <04584d61-f1e2-3722-1f13-ff133edc0c22@gmail.com>
 <CAJ+vNU1NcW=y_c-jJBnAaOozrzYJAekd9BEiMdd2=Bpx=Ng79Q@mail.gmail.com>
 <b105d1ea-7975-bd21-0aa0-762060ceb62a@gmail.com>
 <CAJ+vNU1JAp3=bxrKY9cNac8=aEG4MMh01Cb6iwb-dV+gyNPn_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAJ+vNU1JAp3=bxrKY9cNac8=aEG4MMh01Cb6iwb-dV+gyNPn_g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> >> &fec {
> >>         pinctrl-names = "default";
> >>         pinctrl-0 = <&pinctrl_enet>;
> >>         phy-mode = "rgmii-id";
> >>         status = "okay";
> >
> > You most likely need to declare a fixed PHY for the FEC to be setting up
> > the link, speed and duplex?
> 
> Florian,
> 
> Thanks - this appears to be the issue. I declared the fixed-phy down
> in the cpu port but I guess it needs to be done in the net device.

Hi Tim

There are two different MACs here. The switch CPU port MAC, and the
FEC MAC. You need to force the FEC MAC to 1Gbps, hence the fixed-phy
needs to be in the FEC node.

DSA will configure the CPU switch port to its fastest mode. You only
need a fixed-phy if you need it to run slower, e.g. it is connected to
a 100Mbps port of the vf610, or you need to set a phy-mode in order to
set RGMII delays, etc.

    Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
