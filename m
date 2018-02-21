From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 05/10] dt-bindings: gpio: Add gpio nodes for Actions S900
 SoC
Date: Wed, 21 Feb 2018 20:28:21 +0530
Message-ID: <20180221145821.bhoxjndibp3bqfxi@linaro.org>
References: <20180217204433.3095-1-manivannan.sadhasivam@linaro.org>
 <20180217204433.3095-6-manivannan.sadhasivam@linaro.org>
 <20180219203523.rhvbnym7oomzahwi@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180219203523.rhvbnym7oomzahwi@rob-hp-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, daniel.thompson@linaro.org, linus.walleij@linaro.org, liuwei@actions-semi.com, linux-kernel@vger.kernel.org, amit.kucheria@linaro.org, linux-gpio@vger.kernel.org, mp-cs@actions-semi.com, 96boards@ucrobotics.com, afaerber@suse.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Rob,
On Mon, Feb 19, 2018 at 02:35:23PM -0600, Rob Herring wrote:
> On Sun, Feb 18, 2018 at 02:14:28AM +0530, Manivannan Sadhasivam wrote:
> > Add gpio nodes for Actions Semi S900 SoC.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  .../devicetree/bindings/gpio/actions,owl-gpio.txt         | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/gpio/actions,owl-gpio.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/gpio/actions,owl-gpio.txt b/Documentation/devicetree/bindings/gpio/actions,owl-gpio.txt
> > new file mode 100644
> > index 000000000000..4cd4cb7bfd1b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpio/actions,owl-gpio.txt
> > @@ -0,0 +1,15 @@
> > +* Actions Semi OWL GPIO controller bindings
> > +
> > +- compatible      : Should be "actions,s900-gpio"
> > +- reg             : Address and range of the GPIO controller registers.
> > +- gpio-controller : Marks the device node as a GPIO controller.
> > +- #gpio-cells     : Should be <2>. The first cell is the gpio number and
> > +                    the second cell is used to specify optional parameters.
> 
> Doesn't do interrupts?
> 
Interrupt support will be added once this base driver gets in.
One step at a time ;-)

Thanks,
Mani
> > +
> > +Example:
> > +       gpio: gpio@e01b0000 {
> > +               compatible = "actions,s900-gpio";
> > +               reg = <0x0 0xe01b0000 0x0 0x1000>;
> > +               gpio-controller;
> > +               #gpio-cells = <2>;
> > +       };
> > -- 
> > 2.14.1
> > 
