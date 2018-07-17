From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: phy: add DT bindings for UniPhier USB3
 PHY driver
Date: Tue, 17 Jul 2018 08:16:23 -0600
Message-ID: <CAL_JsqKjC3J16uk2GTQyTquMbvO5Aw6kr4BfdNLAfZHD3MuBgQ@mail.gmail.com>
References: <1530261541-23104-2-git-send-email-hayashi.kunihiko@socionext.com>
 <20180716205049.GA3663@rob-hp-laptop> <20180717195531.8587.4A936039@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180717195531.8587.4A936039@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Masami Hiramatsu <masami.hiramatsu@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 17, 2018 at 4:55 AM Kunihiko Hayashi
<hayashi.kunihiko@socionext.com> wrote:
>
> Hi Rob,
> Thank you for your comments.
>
> On Mon, 16 Jul 2018 14:50:49 -0600 <robh@kernel.org> wrote:
>
> > On Fri, Jun 29, 2018 at 05:38:58PM +0900, Kunihiko Hayashi wrote:
> > > Add DT bindings for PHY interface built into USB3 controller
> > > implemented in UniPhier SoCs.
> > >
> > > Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> > > ---
> > >  .../devicetree/bindings/phy/uniphier-usb3-phy.txt  | 118 +++++++++++++++++++++

[...]

> > > +Optional properties:
> > > +- phy-supply: A phandle to the regulator for USB VBUS.
> >
> > The phy actually needs Vbus or you just want to control Vbus from the
> > phy driver?
>
> To enable each USB port correspond with phy, we must enable Vbus for each port.
> However, the host driver doesn't have the way to control regulators directly,
> then I think it is reasonable to control Vbus by using phy regulator.

DT should reflect the h/w. If Vbus rail is powering the phy then it
should be in the phy node. If you just happen to want to put Vbus
control in the phy driver, that's an OS problem and doesn't belong in
DT. In that case, Vbus should be described as part of a USB connector
node and any driver can walk the tree or graph and get Vbus regulator.

Rob
