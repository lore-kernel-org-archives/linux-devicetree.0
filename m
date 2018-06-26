From: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH 1/2] dt-bindings: Add mtk-systimer bindings
Date: Tue, 26 Jun 2018 14:36:24 +0800
Message-ID: <1529994984.17448.27.camel@mtkswgap22>
References: <1529910601-15005-1-git-send-email-stanley.chu@mediatek.com>
         <1529910601-15005-2-git-send-email-stanley.chu@mediatek.com>
         <ad38a952-4400-984a-a7fd-aa4e6af13c13@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ad38a952-4400-984a-a7fd-aa4e6af13c13@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On Mon, 2018-06-25 at 23:53 +0200, Daniel Lezcano wrote:
> On 25/06/2018 09:10, Stanley Chu wrote:
> > Add binding documentation for the System Timer driver of
> > the Mediatek SoCs.
> > 
> > Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> > ---
> >  .../bindings/timer/mediatek,mtk-systimer.txt       |   18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/timer/mediatek,mtk-systimer.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-systimer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-systimer.txt
> > new file mode 100644
> > index 0000000..735a6fd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-systimer.txt
> > @@ -0,0 +1,18 @@
> > +Mediatek System Timers
> > +----------------------
> > +
> > +Required properties:
> > +- compatible: should contain
> > +	"mediatek,sys_timer" for those platforms which support system timer.
> > +- reg: Mandatory. The location and length for system timer registers.
> > +- clock-frequency: Optional. If not assigned specifically, default
> > +	value 13000000 (means 13 MHz) would be applied.
> 
> The driver tells there is an error if it is not defined, so it can't be
> optional.
> 
> > +Examples:
> > +
> > +	sys_timer@10017000 {
> > +		compatible = "mediatek,sys_timer";
> > +		reg = <0 0x10017000 0 0x1000>;
> > +		interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
> > +		clock-frequency = <13000000>;
> 
> Replace it by a phandle to a 'fixed-clock'.
> 
> eg.
> 
> clocks = <&myclk>;
> 
> 
> > +	};
> 
> myclk: myclk {
> 	#clock-cells = <0>;
> 	compatible = "fixed-clock";
>         clock-frequency = <13000000>;
> };
> 
> Thanks
> 
>   -- DAniel
> 
> 
> 
> 
Hi Daniel,

13 MHz clock is necessary. We will fix it in v2 by using system's
fixed-clock.

Thanks.
Stanley Chu
