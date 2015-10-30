From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 04/19] clk: sunxi: Add TCON channel1 clock
Date: Fri, 30 Oct 2015 14:37:34 -0700
Message-ID: <20151030213734.GI19782@codeaurora.org>
References: <1446214865-3972-1-git-send-email-maxime.ripard@free-electrons.com>
 <1446214865-3972-5-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1446214865-3972-5-git-send-email-maxime.ripard@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hdegoede@redhat.com>, Alexander Kaplan <alex@nextthing.co>, Wynter Woods <wynter@nextthing.co>, Boris Brezillon <boris.brezillon@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
List-Id: devicetree@vger.kernel.org

On 10/30, Maxime Ripard wrote:
> The TCON is a controller generating the timings to output videos signals,
> acting like both a CRTC and an encoder.
> 
> It has two channels depending on the output, each channel being driven by
> its own clock (and own clock controller).
> 
> Add a driver for the channel 1 clock.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Similar comments apply to patches 3 and 4. Was the same code
copy/pasted two more times and then changed to have different
values? Looks like we should consolidate all that stuff into
something more generic so that we don't have the same problems 3
times.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
