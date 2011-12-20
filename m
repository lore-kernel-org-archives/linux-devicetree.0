From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v2 1/3] regulator: twl: adapt twl-regulator driver to dt
Date: Tue, 20 Dec 2011 01:03:52 +0000
Message-ID: <20111220010351.GP2860@opensource.wolfsonmicro.com>
References: <1323771575-3550-1-git-send-email-rnayak@ti.com>
 <1323771575-3550-2-git-send-email-rnayak@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-omap-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1323771575-3550-2-git-send-email-rnayak@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@ti.com>
Cc: devicetree-discuss@lists.ozlabs.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tony@atomide.com, lrg@ti.com, b-cousson@ti.com, patches@linaro.org, linaro-dev@lists.linaro.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 13, 2011 at 03:49:33PM +0530, Rajendra Nayak wrote:

I'm OK with this but would prefer that OMAP or TWL people were OK with
it too.  If you do need to respin:

> +For twl4030 regulators/LDO's

' should *not* be used for plurals except when omitting a duplicated s
introduced by one (grammar nit but it really bugs me).
