From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: Re: [PATCH 1/4] dt-bindings: phy: add DT bindings for UniPhier USB3 PHY driver
Date: Tue, 24 Jul 2018 20:10:39 +0900
Message-ID: <20180724201039.F6E6.4A936039@socionext.com>
References: <20180717195531.8587.4A936039@socionext.com> <CAL_JsqKjC3J16uk2GTQyTquMbvO5Aw6kr4BfdNLAfZHD3MuBgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKjC3J16uk2GTQyTquMbvO5Aw6kr4BfdNLAfZHD3MuBgQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Tue, 17 Jul 2018 08:16:23 -0600 <robh@kernel.org> wrote:

> On Tue, Jul 17, 2018 at 4:55 AM Kunihiko Hayashi
> <hayashi.kunihiko@socionext.com> wrote:
> >
> > Hi Rob,
> > Thank you for your comments.
> >
> > On Mon, 16 Jul 2018 14:50:49 -0600 <robh@kernel.org> wrote:
> >
> > > On Fri, Jun 29, 2018 at 05:38:58PM +0900, Kunihiko Hayashi wrote:
> > > > Add DT bindings for PHY interface built into USB3 controller
> > > > implemented in UniPhier SoCs.
> > > >
> > > > Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> > > > ---
> > > >  .../devicetree/bindings/phy/uniphier-usb3-phy.txt  | 118 +++++++++++++++++++++
> 
> [...]
> 
> > > > +Optional properties:
> > > > +- phy-supply: A phandle to the regulator for USB VBUS.
> > >
> > > The phy actually needs Vbus or you just want to control Vbus from the
> > > phy driver?
> >
> > To enable each USB port correspond with phy, we must enable Vbus for each port.
> > However, the host driver doesn't have the way to control regulators directly,
> > then I think it is reasonable to control Vbus by using phy regulator.
> 
> DT should reflect the h/w. If Vbus rail is powering the phy then it
> should be in the phy node. If you just happen to want to put Vbus
> control in the phy driver, that's an OS problem and doesn't belong in
> DT. In that case, Vbus should be described as part of a USB connector
> node and any driver can walk the tree or graph and get Vbus regulator.

I think it's difficult to describe port nodes related to connectors that
has vbus regulator.

This controller has a glue layer, that consists of "reset", "regulator",
and "phy", and there are their respective drivers and their own nodes,
but no glue layer driver [1].

[1] https://www.spinics.net/lists/linux-usb/msg165060.html

For example, when the glue layer node has each port that includes vbus,
we will describe like that:

--------------------------------
usb {
	...
	resets = <&usb_reset>;
	phys = <&usb_phy0>, <&usb_phy1>;
};

usb-glue {
	usb_reset: reset {
		...
	};
	usb_vbus0: regulator {
		...
	};
	usb_vbus1: regulator {
		...
	};
	usb_phy0: phy {
		...
	};
	usb_phy1: phy {
		...
	};

	ports {
		port@0 {
			...
			vbus-supply = <&usb_vbus0>;
		};
		port@1 {
			...
			vbus-supply = <&usb_vbus1>;
		};
	};
};
--------------------------------

However, there is no driver that can walk the tree to get vbus regulator,
and we can't describe that the vbus and phy are related.

In this controller, each port with vbus corresponds to each phy,
and we need to enable the phy and control the vbus.

For the above reasons, and since vbus is not phy's power,
I think it's reasonable to add "vbus-supply" only instead of "phy-supply"
in the phy node like sun4i-usb-phy, rockchip-usb-phy, etc.

--------------------------------
usb {
	...
	resets = <&usb_reset>;
	phys = <&usb_phy0>, <&usb_phy1>;
};

usb-glue {
	usb_reset: reset {
		...
	};
	usb_vbus0: regulator {
		...
	};
	usb_vbus1: regulator {
		...
	};
	usb_phy0: phy {
		...
		vbus-supply = <&usb_vbus0>;
	};
	usb_phy1: phy {
		...
		vbus-supply = <&usb_vbus1>;
	};
};
--------------------------------

Thank you,

---
Best Regards,
Kunihiko Hayashi
