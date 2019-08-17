From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 1/5] dt-bindings: clock: Add Bitmain BM1880 SoC clock
 controller binding
Date: Sat, 17 Aug 2019 09:04:22 +0530
Message-ID: <20190817033422.GB14652@Mani-XPS-13-9360>
References: <20190705151440.20844-1-manivannan.sadhasivam@linaro.org>
 <20190705151440.20844-2-manivannan.sadhasivam@linaro.org>
 <20190808050128.E3DA52186A@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190808050128.E3DA52186A@mail.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org, darren.tsao@bitmain.com, robh+dt@kernel.org, haitao.suo@bitmain.com, fisher.cheng@bitmain.com, alec.lin@bitmain.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On Wed, Aug 07, 2019 at 10:01:28PM -0700, Stephen Boyd wrote:
> Quoting Manivannan Sadhasivam (2019-07-05 08:14:36)
> > Add devicetree binding for Bitmain BM1880 SoC clock controller.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  .../bindings/clock/bitmain,bm1880-clk.txt     | 47 +++++++++++
> 
> Can you convert this to YAML? It's all the rage right now.
> 

Sure.

> >  include/dt-bindings/clock/bm1880-clock.h      | 82 +++++++++++++++++++
> >  2 files changed, 129 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/bitmain,bm1880-clk.txt
> >  create mode 100644 include/dt-bindings/clock/bm1880-clock.h
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/bitmain,bm1880-clk.txt b/Documentation/devicetree/bindings/clock/bitmain,bm1880-clk.txt
> > new file mode 100644
> > index 000000000000..9c967095d430
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/bitmain,bm1880-clk.txt
> > @@ -0,0 +1,47 @@
> > +* Bitmain BM1880 Clock Controller
> > +
> > +The Bitmain BM1880 clock controler generates and supplies clock to
> > +various peripherals within the SoC.
> > +
> > +Required Properties:
> > +
> > +- compatible: Should be "bitmain,bm1880-clk"
> > +- reg :        Register address and size of PLL and SYS control domains
> > +- reg-names : Register domain names: "pll" and "sys"
> > +- clocks : Phandle of the input reference clock.
> > +- #clock-cells: Should be 1.
> > +
> > +Each clock is assigned an identifier, and client nodes can use this identifier
> > +to specify the clock which they consume.
> > +
> > +All available clocks are defined as preprocessor macros in corresponding
> > +dt-bindings/clock/bm1880-clock.h header and can be used in device tree sources.
> > +
> > +External clocks:
> > +
> > +The osc clock used as the input for the plls is generated outside the SoC.
> > +It is expected that it is defined using standard clock bindings as "osc".
> > +
> > +Example: 
> > +
> > +        clk: clock-controller@800 {
> > +                compatible = "bitmain,bm1880-clk";
> > +                reg = <0xe8 0x0c>,<0x800 0xb0>;
> 
> It looks weird still. What hardware module is this actually part of?
> Some larger power manager block?
> 

These are all part of the sysctrl block (clock + pinctrl + reset) and the
register domains got split between system and pll.

Thanks,
Mani

> > +                reg-names = "pll", "sys";
> > +                clocks = <&osc>;
> > +                #clock-cells = <1>;
> > +        };
> > +
