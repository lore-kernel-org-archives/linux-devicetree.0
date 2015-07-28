From: James Liao <jamesjj.liao@mediatek.com>
Subject: Re: [PATCH v4 7/7] arm64: dts: mt8173: Add subsystem clock
 controller device nodes
Date: Tue, 28 Jul 2015 13:29:58 +0800
Message-ID: <1438061398.17770.25.camel@mtksdaap41>
References: <1437706925-3222-1-git-send-email-jamesjj.liao@mediatek.com>
	 <CAGS+omAUAHZUJQMnWJbH7NXB_Etp=OF3dWyMB7Ri1+rAyzyPBg@mail.gmail.com>
	 <1437965782.5614.4.camel@mtksdaap41> <24796517.2pfRdOOmRJ@ubix>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <24796517.2pfRdOOmRJ@ubix>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Daniel Kurtz <djkurtz@chromium.org>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Heiko Stubner <heiko@sntech.de>, srv_heupstream <srv_heupstream@mediatek.com>, Ricky Liang <jcliang@chromium.org>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, 2015-07-27 at 03:21 -0700, Matthias Brugger wrote:
> On Monday, July 27, 2015 10:56:22 AM James Liao wrote:
> > Hi Daniel,
> > 
> > On Fri, 2015-07-24 at 19:32 +0800, Daniel Kurtz wrote:
> > > > @@ -88,6 +88,13 @@
> > > > 
> > > >                 #clock-cells = <0>;
> > > >         
> > > >         };
> > > > 
> > > > +       cpum_ck: dummy_clk {
> > > 
> > > I'm not a big fan of this "dummy_clk".
> > > The 'name' part of the devicetree node is supposed to be generic.
> > > So, perhaps just oscillator@2, and move it down below clk32k:
> > > oscillator@1.
> > 
> > > Otherwise:
> > cpum_ck is a test clock which only available in IC test. It's empty on
> > MT8173 evaluation or production boards. Should we name this kind of
> > empty clock as an oscillator? Or is there a better name for it?
> > 
> 
> So if it will never be part of any available boards, why do you want to add 
> it?

infra_cpum is a clock gate, and its clock comes from an external clock.
In previous versions we named the external clock as "clk_null", but it's
not accepted. A specified name is preferred even it's not available on
some boards. So I named it as cpum_ck in this patch.


Best regards,

James
