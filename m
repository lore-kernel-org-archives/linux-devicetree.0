From: James Liao <jamesjj.liao@mediatek.com>
Subject: Re: [PATCH v3 4/4] dts: mediatek: Enable clock support for
 Mediatek MT8135.
Date: Thu, 8 Jan 2015 10:34:46 +0800
Message-ID: <1420684486.27952.23.camel@mtksdaap41>
References: <1420601123-25859-1-git-send-email-jamesjj.liao@mediatek.com>
 <1420601123-25859-5-git-send-email-jamesjj.liao@mediatek.com>
 <CABuKBeL34hV63t+zDy3Nbz_V4qAvCF87+=hV=eUUCTrKybBFjA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CABuKBeL34hV63t+zDy3Nbz_V4qAvCF87+=hV=eUUCTrKybBFjA@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Ashwin Chaugule <ashwin.chaugule@linaro.org>, Vladimir Murzin <vladimir.murzin@arm.com>, Mike Turquette <mturquette@linaro.org>, Pawel Moll <pawel.moll@arm.com>, srv_heupstream <srv_heupstream@mediatek.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, HenryC Chen <henryc.chen@mediatek.com>, "Joe.C" <yingjoe.chen@mediatek.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, jamesjj.liao@mediatek.com, Russell King <linux@arm.linux.org.uk>, huang eddie <eddie.huang@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Matthias,

On Wed, 2015-01-07 at 17:25 +0100, Matthias Brugger wrote:
> > +
> > +               clk_null: clk_null {
> > +                       compatible = "fixed-clock";
> > +                       #clock-cells = <0>;
> > +                       clock-frequency = <0>;
> > +               };
> > +
> > +               clk26m: clk26m {
> > +                       compatible = "fixed-clock";
> > +                       #clock-cells = <0>;
> > +                       clock-frequency = <26000000>;
> > +               };
> > +
> > +               rtc32k: rtc32k {
> > +                       compatible = "fixed-clock";
> > +                       #clock-cells = <0>;
> > +                       clock-frequency = <32000>;
> > +               };
> 
> Why do you add this clocks here?
> This clocks are not represented by the clock tree? If so, what are the
> consumers of this clocks?

These clocks are currently used in clk-mt8135.c to be root clocks, which
represent clocks outside SoC and can't be controlled by MT8135.


Best regards,

James
