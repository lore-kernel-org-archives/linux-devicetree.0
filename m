From: Evgeniy Polyakov <zbr@ioremap.net>
Subject: Re: [PATCH] w1-gpio: fix section mismatch
Date: Mon, 28 Jan 2013 19:31:56 +0400
Message-ID: <20130128153156.GB9089@ioremap.net>
References: <1359317277-29161-1-git-send-email-hauke@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1359317277-29161-1-git-send-email-hauke@hauke-m.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: gregkh@linuxfoundation.org, panto@antoniou-consulting.com, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Hi

On Sun, Jan 27, 2013 at 09:07:57PM +0100, Hauke Mehrtens (hauke@hauke-m.de) wrote:
> This fixes the following section mismatch:
> 
> WARNING: drivers/w1/masters/w1-gpio.o(.data+0x188): Section mismatch in
> reference from the variable w1_gpio_driver to the function
> .init.text:w1_gpio_probe()
> The variable w1_gpio_driver references
> the function __init w1_gpio_probe()
> If the reference is valid then annotate the
> variable with __init* or __refdata (see linux/init.h) or name the variable:
> *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console
> 
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>

Looks good to me
Acked-by: Evgeniy Polyakov <zbr@ioremap.net>

-- 
	Evgeniy Polyakov
