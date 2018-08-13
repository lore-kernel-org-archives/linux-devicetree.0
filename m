From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: interrupt-controller: Actions
 external interrupt controller
Date: Mon, 13 Aug 2018 14:45:47 +0530
Message-ID: <20180813091547.GA22149@mani>
References: <20180812122215.1079590-1-pn@denx.de>
 <20180812122215.1079590-2-pn@denx.de>
 <20180813043406.GA16275@Mani-XPS-13-9360>
 <f1043a48-6c8d-cf08-d6a1-582d84ea2530@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f1043a48-6c8d-cf08-d6a1-582d84ea2530@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Parthiban Nallathambi <pn@denx.de>, tglx@linutronix.de, jason@lakedaemon.net, robh+dt@kernel.org, mark.rutland@arm.com, afaerber@suse.de, catalin.marinas@arm.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, sravanhome@gmail.com, thomas.liau@actions-semi.com, mp-cs@actions-semi.com, linux@cubietech.com, edgar.righi@lsitec.org.br, laisa.costa@lsitec.org.br, guilherme.simoes@lsitec.org.br, mkzuffo@lsi.usp.br
List-Id: devicetree@vger.kernel.org

On Mon, Aug 13, 2018 at 08:51:54AM +0100, Marc Zyngier wrote:
> On 13/08/18 05:34, Manivannan Sadhasivam wrote:
> > Hi Parthiban,
> > 
> > On Sun, Aug 12, 2018 at 02:22:13PM +0200, Parthiban Nallathambi wrote:
> >> Actions Semi OWL family SoC's provides support for external interrupt
> >> controller to be connected and controlled using SIRQ pins. S500, S700
> >> and S900 provides 3 SIRQ lines and works independently for 3 external
> >> interrupt controllers.
> >>
> >> Signed-off-by: Parthiban Nallathambi <pn@denx.de>
> >> Signed-off-by: Saravanan Sekar <sravanhome@gmail.com>
> >> ---
> >>  .../interrupt-controller/actions,owl-sirq.txt      | 46 ++++++++++++++++++++++
> >>  1 file changed, 46 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.txt b/Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.txt
> >> new file mode 100644
> >> index 000000000000..4b8437751331
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/interrupt-controller/actions,owl-sirq.txt
> >> @@ -0,0 +1,46 @@
> >> +Actions Semi Owl SoCs SIRQ interrupt controller
> >> +
> >> +S500, S700 and S900 SoC's from Actions provides 3 SPI's from GIC,
> >> +in which external interrupt controller can be connected. 3 SPI's
> >> +45, 46, 47 from GIC are directly exposed as SIRQ. It has
> >> +the following properties:
> > 
> > We should really document the driver here. What it does? and how the
> > hierarchy is handled with GIC? etc...
> 
> Absolutely not. This should document the binding, irrespective of the
> operating system. The word "driver" is completely out of place here.
>

Oops, my bad. I meant to say that we should add it as a description in the
commit message.

Thanks,
Mani

> Thanks,
> 
> 	M.
> -- 
> Jazz is not dead. It just smells funny...
