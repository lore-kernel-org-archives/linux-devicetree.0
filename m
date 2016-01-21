From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [RFC 2/9] clk: bcm2835: add support for parent selection in DT
Date: Thu, 21 Jan 2016 09:26:42 +0100
Message-ID: <20160121082642.GB13237@pengutronix.de>
References: <1453215100-2382-1-git-send-email-kernel@martin.sperl.org>
 <1453215100-2382-3-git-send-email-kernel@martin.sperl.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1453215100-2382-3-git-send-email-kernel@martin.sperl.org>
Sender: linux-clk-owner@vger.kernel.org
To: kernel@martin.sperl.org
Cc: Rob Herring <robh+dt@kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Remi Pommarel <repk@triplefau.lt>, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Martin,

On Tue, Jan 19, 2016 at 02:51:33PM +0000, kernel@martin.sperl.org wrote:
> From: Martin Sperl <kernel@martin.sperl.org>
> 
> Allow for a per clock custom selection of clocks in the device tree.
> 
> Basic setup in dt looks like this:
>   clock@BCM2835_CLOCK_PCM {
>     reg = <BCM2835_CLOCK_PCM>;
>     parent-clock-names = "xosc", "plld_per", "plla_per", "pll_aux_per";
>   };

Isn't this the same as the already existing assigned-clock-parents property?
If yes, that should be used.

Sascha


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
