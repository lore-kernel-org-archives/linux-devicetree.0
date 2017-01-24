From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v3 1/3] of: Support parsing phandle argument lists through
 a nexus node
Date: Mon, 23 Jan 2017 22:36:29 -0800
Message-ID: <5886F5ED.3030509@gmail.com>
References: <20170123204851.12808-1-stephen.boyd@linaro.org>
 <20170123204851.12808-2-stephen.boyd@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170123204851.12808-2-stephen.boyd@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <stephen.boyd@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Stephen,

Sorry I did not get to v1 and v2 in a timely manner.


On 01/23/17 12:48, Stephen Boyd wrote:
> Platforms like 96boards have a standardized connector/expansion
> slot that exposes signals like GPIOs to expansion boards in an
> SoC agnostic way. We'd like the DT overlays for the expansion
> boards to be written once without knowledge of the SoC on the
> other side of the connector. This avoids the unscalable
> combinatorial explosion of a different DT overlay for each
> expansion board and SoC pair.
> 
> We need a way to describe the GPIOs routed through the connector
> in an SoC agnostic way. Let's introduce nexus property parsing
> into the OF core to do this. This is largely based on the
> interrupt nexus support we already have. This allows us to remap
> a phandle list in a consumer node (e.g. reset-gpios) through a
> connector in a generic way (e.g. via gpio-map). Do this in a
> generic routine so that we can remap any sort of variable length
> phandle list.
> 
> Taking GPIOs as an example, the connector would be a GPIO nexus,
> supporting the remapping of a GPIO specifier space to multiple
> GPIO providers on the SoC. DT would look as shown below, where
> 'soc_gpio1' and 'soc_gpio2' are inside the SoC, 'connector' is an
> expansion port where boards can be plugged in, and
> 'expansion_device' is a device on the expansion board.
> 
> 	soc {
> 		soc_gpio1: gpio-controller1 {
> 			#gpio-cells = <2>;
> 		};
> 
> 		soc_gpio2: gpio-controller2 {
> 			#gpio-cells = <2>;
> 		};
> 	};
> 
> 	connector: connector {
> 		#gpio-cells = <2>;
> 		gpio-map = <0 0 &soc_gpio1 1 0>,
> 			   <1 0 &soc_gpio2 4 0>,
> 			   <2 0 &soc_gpio1 3 0>,
> 			   <3 0 &soc_gpio2 2 0>;
> 		gpio-map-mask = <0xf 0x0>;
> 		gpio-map-pass-thru = <0x0 0x1>
> 	};
> 
> 	expansion_device {
> 		reset-gpios = <&connector 2 GPIO_ACTIVE_LOW>;
> 	};

The how to architect connectors and plugs threads fell asleep before
coming to a resolution.  We need to revive that discussion.

One of the concepts of the plug and connector architecture is that
a main board may contain multiple connectors of the same type (or
different types, but the same type is sufficient for this discussion).

The node describing the card that plugs into one of the connectors
does not know the phandle of the connector it is going to be
connected to.  Some other mechanism is provided to allow a card
to be plugged into any of the available connectors.  If there are
two identical cards plugged into two connectors, then both cards
have the same exact device tree node.  But some mechanism will
exist to resolve (or "link") the two card nodes to the different
connector nodes.

As a result of this, in the above example the reset-gpios property
in the node 'expansion_device' can not contain '&connector'.  The
concept of &connector belongs to the entire expansion_device node,
not to individual properties within the node.

I'm not sure where this puts us.  I'm thinking....

-Frank

> 
> The GPIO core would use of_parse_phandle_with_args_map() instead
> of of_parse_phandle_with_args() and arrive at the same type of
> result, a phandle and argument list. The difference is that the
> phandle and arguments will be remapped through the nexus node to
> the underlying SoC GPIO controller node. In the example above,
> we would remap 'reset-gpios' from <&connector 2 GPIO_ACTIVE_LOW>
> to <&soc_gpio1 3 GPIO_ACTIVE_LOW>.
> 
> Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Mark Brown <broonie@kernel.org>
> Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
> ---
>  drivers/of/base.c  | 184 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/of.h |  12 ++++
>  2 files changed, 196 insertions(+)

< snip >
