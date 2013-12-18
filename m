From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v4 0/9] Reuse davinci-nand driver for Keystone arch
Date: Tue, 17 Dec 2013 23:14:57 -0800
Message-ID: <20131218071457.GB5551@norris-Latitude-E6410>
References: <1387285155-19182-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1387285155-19182-1-git-send-email-ivan.khoronzhuk@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>, Rob Landley <rob@landley.net>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <rob.herring@calxeda.com>, Stephen Warren <swarren@wwwdotorg.org>, Kumar Gala <galak@kernel.crashing.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, grygorii.strashko@ti.com, dwmw2@infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 17, 2013 at 02:59:06PM +0200, Ivan Khoronzhuk wrote:
> This series contains fixes and updates of Davinci nand driver in
> order to reuse it for Keystone platform.
> 
> v3..v4:
> - mtd: nand: davinci: fix driver registration
> 	dropped __init/__exit/__exit_p as module_platform_driver() is used
> - mtd: nand: davinci: adjust DT properties to MTD generic
> 	used of_get_nand_bus_width() helper
> - mtd: nand: davinci: don't request AEMIF address range
> 	added comment at code change

Pushed the series to l2-mtd.git. Thanks!

Brian
