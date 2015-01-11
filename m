From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH v2 4/8] irqchip: devicetree: document Conexant Digicolor
 irq binding
Date: Sun, 11 Jan 2015 13:29:44 +0200
Message-ID: <20150111112944.GP2481@sapphire.tkos.co.il>
References: <cover.1420744368.git.baruch@tkos.co.il>
 <3bdf8fa0bf971b4881024e72312c3c9d29298e79.1420744369.git.baruch@tkos.co.il>
 <54AFEFEC.5000300@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54AFEFEC.5000300@cogentembedded.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On Fri, Jan 09, 2015 at 06:12:44PM +0300, Sergei Shtylyov wrote:
> On 1/8/2015 10:40 PM, Baruch Siach wrote:
> 
> >Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> >---
> >  .../bindings/interrupt-controller/digicolor-ic.txt   | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/digicolor-ic.txt
> 
> >diff --git a/Documentation/devicetree/bindings/interrupt-controller/digicolor-ic.txt b/Documentation/devicetree/bindings/interrupt-controller/digicolor-ic.txt
> >new file mode 100644
> >index 000000000000..fdf9a4c59bf3
> >--- /dev/null
> >+++ b/Documentation/devicetree/bindings/interrupt-controller/digicolor-ic.txt
> >@@ -0,0 +1,20 @@
> >+Conexant Digicolor Interrupt Controller
> >+
> >+Required properties:
> >+
> >+- compatible : should be "cnxt,cx92755-ic"
> >+- reg : Specifies base physical address and size of the MISC area, that is
> >+  where the interrupt controller registers are located
> >+- interrupt-controller : Identifies the node as an interrupt controller
> >+- #interrupt-cells : Specifies the number of cells needed to encode an
> >+  interrupt source. The value shall be 1.
> >+
> >+Example:
> >+
> >+	intc: intc@f0000000 {
> 
>    The node name should be "interrupt-controller@f0000000", according to the
> ePAPR standard, section 2.2.2.

I'll change that in my next submission.

Thanks,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
