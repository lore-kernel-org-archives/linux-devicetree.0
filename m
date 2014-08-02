From: Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH 1/3] fpga manager framework core
Date: Sat, 2 Aug 2014 02:15:38 +0200
Message-ID: <20140802001538.GA11170@amd.pavel.ucw.cz>
References: <1406932118-13885-1-git-send-email-atull@opensource.altera.com>
 <1406932118-13885-2-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1406932118-13885-2-git-send-email-atull@opensource.altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: atull@opensource.altera.com
Cc: gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yvanderv@opensource.altera.com
List-Id: devicetree@vger.kernel.org

Hi!

> +static int fpga_mgr_get_new_minor(struct fpga_manager *mgr, int request_nr)
> +{
> +	int nr, start;
> +
> +	/* check specified minor number */
> +	if (request_nr >= FPGA_MAX_MINORS) {
> +		dev_err(mgr->parent, "Out of device minors (%d)\n", request_nr);
> +		return -ENODEV;
> +	}

if (request_nr < -1)
   return -EINVAL;
?

> +	/* FPGA mangager isr */
> +	irqreturn_t (*isr)(int irq, void *dev_id);
> +};

"manager"?

Best regards,
									Pavel

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
