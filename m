From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] reset: socfpga: use arch_initcall for early initialization
Date: Sat, 18 Oct 2014 11:22:20 +0200
Message-ID: <2269547.Q1ItkFJzpa@wuerfel>
References: <1412822646-11257-1-git-send-email-dinguyen@opensource.altera.com> <20141009151935.GK15799@pengutronix.de> <alpine.DEB.2.02.1410101123590.11270@atx-linux-37>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.02.1410101123590.11270@atx-linux-37>
Sender: linux-kernel-owner@vger.kernel.org
To: atull <atull@opensource.altera.com>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, Dinh Nguyen <dinguyen@opensource.altera.com>, Philipp Zabel <p.zabel@pengutronix.de>, dinh.linux@gmail.com, grant.likely@linaro.org, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Friday 10 October 2014 11:32:35 atull wrote:
> On Thu, 9 Oct 2014, Steffen Trumtrar wrote:
> > Do you have an example where this is really needed?
> 
> My last version of the fpga manager framework 
> (https://lkml.org/lkml/2014/8/1/518)
> added fpga_mgr_firmware_write().  This can be called from a device driver's 
> probe function to request a fpga image be loaded.  I want to support FPGA 
> based functionality being seen pretty similar to really hard hardware.  So 
> the FPGA could have a PCI bus or something else that would want to be 
> early.

Please be more specific. I agree we need a good reason for not just
using deferred probing, and PCI host bridges in general are no longer
something that needs to be probed early.

If you have a particular use case in mind that can't be solved in a
better way, we can talk about making this an earlier initcall (probably
not arch_initcall), but in general we try hard to avoid new ones
like this.

	Arnd
