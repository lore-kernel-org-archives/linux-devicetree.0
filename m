From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
Subject: Re: [PATCH v2 06/16] drm/sun4i: Don't process LVDS if TCON doesn't support it
Date: Wed, 28 Feb 2018 22:43:30 +0100
Message-ID: <5333678.QYsGi30oEL@jernej-laptop>
References: <20180227222701.9716-1-jernej.skrabec@siol.net> <20180227222701.9716-7-jernej.skrabec@siol.net> <20180228073608.r2zd3qkiudm2uarm@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180228073608.r2zd3qkiudm2uarm@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: wens@csie.org, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

Hi Maxime,

Dne sreda, 28. februar 2018 ob 08:36:08 CET je Maxime Ripard napisal(a):
> On Tue, Feb 27, 2018 at 11:26:51PM +0100, Jernej Skrabec wrote:
> > TCON checks for LVDS properties even if it doesn't support it. Add a
> > check to skip that part of the code if TCON doesn't support channel 0.
> > 
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> 
> I have already sent a similar patch here:
> https://lists.freedesktop.org/archives/dri-devel/2018-February/166665.html

Right. However, check last chunk in my patch. There is no need to call 
sun4i_rgb_init() if TCON doesn't support channel 0. It doesn't do anything, 
except producing warning. Will you add that this change to your patch and then 
I can remove this patch from next revision?

BTW, your patch won't apply cleanly, since you didn't base it on latest code 
(every TCON variant has at least one entry now).

Best regards,
Jernej
