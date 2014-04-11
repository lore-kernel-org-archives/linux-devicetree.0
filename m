From: Paul Walmsley <paul@pwsan.com>
Subject: Re: [PATCH V3 2/6] ARM: AM43xx: fix dpll init in bypass mode
Date: Fri, 11 Apr 2014 18:23:31 +0000 (UTC)
Message-ID: <alpine.DEB.2.02.1404111823190.14347@utopia.booyaka.com>
References: <1395658916-9032-1-git-send-email-sathyap@ti.com> <1395658916-9032-3-git-send-email-sathyap@ti.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1395658916-9032-3-git-send-email-sathyap@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Sathya Prakash M R <sathyap@ti.com>
Cc: tomi.valkeinen@ti.com, devicetree@vger.kernel.org, linux-omap@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 24 Mar 2014, Sathya Prakash M R wrote:

> From: Tomi Valkeinen <tomi.valkeinen@ti.com>
> 
> On AM43xx, if a PLL is in bypass at kernel init, the code in
> omap2_get_dpll_rate() will not realize this and will try to calculate
> the clock rate using the multiplier and the divider, resulting in
> errors.
> 
> omap2_init_dpll_parent() has similar issue.
> 
> Add the missing soc_is_am43xx() check to make the code work on AM43xx.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Sathya Prakash M R <sathyap@ti.com>

Thanks, queued for v3.15-rc.

- Paul
