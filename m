From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 3/7] drm: rockchip: vop: add rk3066 vop definitions
Date: Fri, 11 Jan 2019 08:54:24 -0600
Message-ID: <20190111145424.GA21604@bogus>
References: <20181229133318.18128-1-jbx6244@gmail.com>
 <20181229133318.18128-4-jbx6244@gmail.com>
 <154632658.xpTMZOjgxT@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <154632658.xpTMZOjgxT@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Johan Jonker <jbx6244@gmail.com>, hjc@rock-chips.com, airlied@linux.ie, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Dec 30, 2018 at 06:22:00PM +0100, Heiko Stuebner wrote:
> Hi Johan,
> 
> Am Samstag, 29. Dezember 2018, 14:33:14 CET schrieb Johan Jonker:
> > From: Mark Yao <mark.yao@rock-chips.com>
> > 
> > This patch adds the rk3066 VOP definitions.
> > 
> > The VOP or LCD Controller serves as interface between
> > framebuffer memory and a display device (LCD panel or TV set).
> > 
> > This SOC has two symmetrical LCDC's for a dual panel application.
> > 
> > A LCDC has 5 display layers.
> > Only 3 are used here.
> > 
> > - Video layer 0 (Win0)
> > - Video layer 1 (Win1)
> > - OSD layer     (Win2)
> 
> Patch itself looks good, we'll need to wait a bit to give Rob a chance
> to look at the (simple) dt-binding change and I'll drop the paragraph
> about the display layers when applying.

Don't wait on me for simple oneline compatible additions.

Acked-by: Rob Herring <robh@kernel.org>

Rob
