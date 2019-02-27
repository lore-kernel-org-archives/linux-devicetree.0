From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: rockchip: add document for rk3066 hdmi
Date: Wed, 27 Feb 2019 13:06:26 -0600
Message-ID: <CABGGisyUfENpaHgE3u9ECiMYn-fvC22x3BRKdj2y3eCdgFjKUA@mail.gmail.com>
References: <20181229133318.18128-1-jbx6244@gmail.com> <20190201123235.1693-1-jbx6244@gmail.com>
 <20190225165923.GA2578@bogus> <b183d099-dcb3-9c3f-7031-2bd54d7fe5bb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b183d099-dcb3-9c3f-7031-2bd54d7fe5bb@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Jonker <jbx6244@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, hjc@rock-chips.com, airlied@linux.ie, Mark Rutland <mark.rutland@arm.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-rockchip@lists.infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 27, 2019 at 12:04 PM Johan Jonker <jbx6244@gmail.com> wrote:
>
> Thanks for your advice.
>
> On 2/25/19 5:59 PM, Rob Herring wrote:> On Fri, Feb 01, 2019 at
> 01:32:35PM +0100, Johan Jonker wrote:
> >> This patch adds a binding that describes the HDMI controller for
> >> rk3066.
> >
> > This is not using the DW block like other Rockchip SoCs (IIRC)?
>
> As outsider it's a little bit difficult to comment on that.
> Maybe an insider can give a better answer.
> The rk3066 is there early model.
> Reusing blocks like in the later improved models wasn't in the fashion
> yet I think.
> Also comparing the rk3066-hdmi driver to the inno driver gives too many
> differences in registers, sound support and irqs.
> If it was similar they would have combined it in there own kernel.
> Given the age there won't come any other support for it.
> This is what we have...

Okay, if it looks different then good enough for me.

> >> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> >> ---
> >>  .../display/rockchip/rk3066_hdmi-rockchip.txt      | 60
> ++++++++++++++++++++++
> >
> > Using the compatible string plus '.txt' is the preferred naming.
>
> Will change that in V2.
> rk3066-hdmi      -> rk3066-hdmi-rockchip.txt
>
> How about the other documents?
> rk3036-inno-hdmi -> inno_hdmi-rockchip.txt
> rk3288-dw-hdmi   -> dw_hdmi-rockchip.txt
> rk3288-dp        -> analogix_dp-rockchip.txt
> etc.

Just leave them for now.

> >>  1 file changed, 60 insertions(+)
> >>  create mode 100644
> Documentation/devicetree/bindings/display/rockchip/rk3066_hdmi-rockchip.txt
> >>
> >> diff --git
> a/Documentation/devicetree/bindings/display/rockchip/rk3066_hdmi-rockchip.txt
> b/Documentation/devicetree/bindings/display/rockchip/rk3066_hdmi-rockchip.txt
> >> new file mode 100644
> >> index 000000000..6a8f3754f
> >> --- /dev/null
> >> +++
> b/Documentation/devicetree/bindings/display/rockchip/rk3066_hdmi-rockchip.txt
> >> @@ -0,0 +1,60 @@
> >> +Rockchip specific extensions for rk3066 HDMI
> >> +============================================
> >> +
> >> +Required properties:
> >> +- compatible:
> >> +    "rockchip,rk3066-hdmi";
> >> +- reg:
> >> +    Physical base address and length of the controller's registers.
> >> +- clocks, clock-names:
> >> +    Phandle to HDMI controller clock, name should be "hclk".
> >> +- interrupts:
> >> +    HDMI interrupt number.
> >> +- power-domains:
> >> +    Phandle to the RK3066_PD_VIO power domain.
> >> +- rockchip,grf:
> >> +    This soc uses GRF regs to switch the HDMI TX input between vop0 and
> vop1.
> >> +- ports:
>
> Should "ports" be replaced by: "hdmi_in: port"?
> What is preferred?
>
> There are two different methods in use:
> -1
>                 hdmi_in: port {
>
> -2
>                 ports {
>                         hdmi_in: port {

Generally, you have 'ports' when there is more than one 'port' node
which you should in this case.

> >> +    Contains one port node with two endpoints, numbered 0 and 1,
> >> +    connected respectively to vop0 and vop1.
> >
> > You should have an output port to an hdmi-connector node (or bridge) as
> > well.
>
> Which hdmi-connector node?
> Could you explane with an example?

grep hdmi-connector in the tree there's lot's of examples.

> The Rockchip hdmi nodes I'm aware off only use the port nodes as a way
> to switch the hdmi input between the vop's.
> The vop nodes can have multiple outputs.

Yes, that's the input side. And generally, muxing is represented as
multiple endpoints.

Not all cases of HDMI have defined a connector node as that came along later.

Rob
