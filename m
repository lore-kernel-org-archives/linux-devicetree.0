From: Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH v10 6/8] staging: add bindings document for simple fpga
 bus
Date: Mon, 17 Aug 2015 13:52:57 +0200
Message-ID: <20150817115257.GA434@amd>
References: <1439487452-23977-1-git-send-email-atull@opensource.altera.com>
 <1439487452-23977-8-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1439487452-23977-8-git-send-email-atull@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: atull@opensource.altera.com
Cc: gregkh@linuxfoundation.org, jgunthorpe@obsidianresearch.com, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org, Moritz Fischer <moritz.fischer@ettus.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devel@driverdev.osuosl.org, Petr Cvek <petr.cvek@tul.cz>, delicious.quinoa@gmail.
List-Id: devicetree@vger.kernel.org

On Thu 2015-08-13 12:37:30, atull@opensource.altera.com wrote:
> From: Alan Tull <atull@opensource.altera.com>
> 
> New bindings document for simple fpga bus.
> 
> Signed-off-by: Alan Tull <atull@opensource.altera.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

> +				onchip_memory2_0: memory@0x000000000 {
> +					device_type = "memory";
> +					compatible = "ALTR,onchipmem-15.1";

I guess this should be "altr," .


> +				jtag_uart: serial@0x100020000 {
> +					compatible = "altr,juart-15.1", "altr,juart-1.0";
> +					reg = <0x00000001 0x00020000 0x00000008>;
> +					interrupt-parent = <&intc>;

Best regards,
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
