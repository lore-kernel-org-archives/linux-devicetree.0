From: James Liao <jamesjj.liao@mediatek.com>
Subject: Re: [PATCH 5/5] ARM64: MediaTek MT8173: Add SCPSYS device node
Date: Fri, 22 May 2015 10:41:43 +0800
Message-ID: <1432262503.14396.14.camel@mtksdaap41>
References: <1432131540-2523-1-git-send-email-s.hauer@pengutronix.de>
	 <1432131540-2523-6-git-send-email-s.hauer@pengutronix.de>
	 <CAGS+omDHEY54TzhNTJcFOeHkGbXAQwiTh9gxc=PsbzjwmpHEDA@mail.gmail.com>
	 <20150521174916.GQ6325@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150521174916.GQ6325@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>, Daniel Kurtz <djkurtz@chromium.org>
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org, Sasha Hauer <kernel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Daniel,

On Thu, 2015-05-21 at 19:49 +0200, Sascha Hauer wrote:
> On Thu, May 21, 2015 at 10:32:40PM +0800, Daniel Kurtz wrote:
> > > +               scpsys: scpsys@10006000 {
> > > +                       compatible = "mediatek,mt8173-scpsys";
> > > +                       #power-domain-cells = <1>;
> > > +                       reg = <0 0x10006000 0 0x1000>;
> > > +                       clocks = <&clk26m>,
> > 
> > Why is mfg using <&clk26m> and not <&topckgen CLK_TOP_MFG_SEL>?
> 
> Because James Liao said to me that it is derived from clk26m and not
> from mfg_sel.

Sascha is right. I had confirmed with our designer that MFG on MT8173
uses clk26m to check state. I also tested MFG domain power on/off with
CLK_TOP_MFG_SEL off and it worked correctly.

> > I saw another patch set on the list today from James Liao that adds more clocks.
> > Perhaps we can move the SCPSYS set on top of that one and include more clocks?
> > 
> > > +                                <&topckgen CLK_TOP_MM_SEL>;

The clocks used by scpsys driver are subsystem bus clocks that need to
be on before power on these domains. On MT8173, subsystem bus clocks are
come from topckgen.

My patch set yesterday add subsystem clocks, which are not needed by
power domain on/off. So I think these 2 patch set are independent.


Best regards,

James
