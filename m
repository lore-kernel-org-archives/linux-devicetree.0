From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v3 3/3] arm64: dts: meson-axg: add clock DT info for
 Meson AXG SoC
Date: Tue, 5 Dec 2017 17:00:55 -0800
Message-ID: <20171206010055.GE4283@codeaurora.org>
References: <20171128125330.363-1-yixun.lan@amlogic.com>
 <20171128125330.363-4-yixun.lan@amlogic.com>
 <20171129193536.GB19419@codeaurora.org>
 <8353c264-3253-0268-91fc-8d42fbe82611@amlogic.com>
 <20171201163437.GE19419@codeaurora.org>
 <1512147583.12869.10.camel@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1512147583.12869.10.camel@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Yixun Lan <yixun.lan@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Carlo Caione <carlo@caione.org>, Qiufang Dai <qiufang.dai@amlogic.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12/01, Jerome Brunet wrote:
> On Fri, 2017-12-01 at 08:34 -0800, Stephen Boyd wrote:
> > On 11/30, Yixun Lan wrote:
> > > Hi Stephen
> > > 
> > > On 11/30/17 03:35, Stephen Boyd wrote:
> > > > 
> > > > Maybe just call the node "bus@ff63c000"?
> > > > 
> > > 
> > > isn't this just a name? what's the benefits to change?
> > > personally, I tend to keep it this way, because it's better map to the
> > > data sheet
> > > 
> > > we also has 'aobus', 'cbus' scattered there..
> > 
> > Per the ePAPR node names are supposed to be generic, like disk,
> > cpu, display-controller, gpu, etc. I've never heard of a hiubus,
> > so probably it's some vendor specific thing? We have the phandle
> > anyway so it's not like we're losing much information here.
> 
> Stephen, there is a lot of busses on platform. We can't just call them all
> 'bus'.
> I don't get the problem with this name.
> We are re-using the name from the datasheet here, no fancy invention. It seems
> to be quite common. 
> 

Ok. I'm not the maintainer of the DTS so no worries from me. I'm
just pointing out that the ePAPR says that node names should be
generic, and 'hiubus' doesn't sound generic to me. If it matches
some datasheet then I suppose that's good, but probably that sort
of distinction should have gone into the compatible string
instead of the node name.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
