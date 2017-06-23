From: jmondi <jacopo@jmondi.org>
Subject: Re: [PATCH v6 2/8] dt-bindings: pinctrl: Add RZ/A1 bindings doc
Date: Fri, 23 Jun 2017 10:05:31 +0200
Message-ID: <20170623080531.GA14273@w540>
References: <1498143276-7976-1-git-send-email-jacopo+renesas@jmondi.org>
 <1498143276-7976-3-git-send-email-jacopo+renesas@jmondi.org>
 <20170622210917.ljbxkpaalckhegmq@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170622210917.ljbxkpaalckhegmq@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, linus.walleij@linaro.org, geert+renesas@glider.be, laurent.pinchart@ideasonboard.com, chris.brandt@renesas.com, mark.rutland@arm.com, linux@armlinux.org.uk, aisheng.dong@nxp.com, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Thu, Jun 22, 2017 at 04:09:17PM -0500, Rob Herring wrote:
> On Thu, Jun 22, 2017 at 04:54:30PM +0200, Jacopo Mondi wrote:
> > Add device tree bindings documentation for Renesas RZ/A1 gpio and pin
> > controller.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  .../bindings/pinctrl/renesas,rza1-pinctrl.txt      | 221 +++++++++++++++++++++
> >  1 file changed, 221 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
>
> Please add acks when posting new versions. It seems there are 2 more
> lines here, but I have no idea what changed. I'm assuming it was minor
> enough to retain my ack.

I have dropped your Acked-by in v4, as compared to the previous
versions bindings changed "significantly".
Quoting the v4 cover letter:

"The device tree bindings changed significantly, and as anticipated I
have not incorporated Rob's ack as I would like him to have a look there again."

Now that I look at bindings again, I guess I could have kept it
because all of the changes are related to pin controller subsystem
specificities and are not that "significant" in the end..

I'll list them here for your reference

- use "pinmux" in place of "renesas,pins" property
- use generic properties in place of pin mux flags
- a bit of shuffling on generic properties in v4->v6 transition

If none of these is relevant to you, we can add you Acked-by back when
sending pull-request (right Geert?)

Thanks
   j

>
> Rob
