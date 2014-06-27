From: Michael Grzeschik <mgr@pengutronix.de>
Subject: Re: [PATCH v2 2/2] usb: chipidea: Add support for zynq usb host and
 device controller
Date: Fri, 27 Jun 2014 14:55:15 +0200
Message-ID: <20140627125515.GA6025@pengutronix.de>
References: <1403868233-5123-1-git-send-email-punnaia@xilinx.com>
 <fa656d2d-a2a8-4b8d-a29b-e89e4bfced3e@BL2FFO11FD034.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <fa656d2d-a2a8-4b8d-a29b-e89e4bfced3e@BL2FFO11FD034.protection.gbl>
Sender: linux-doc-owner@vger.kernel.org
To: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
Cc: robh+dt@kernel.org, Peter.Chen@freescale.com, gregkh@linuxfoundation.org, galak@codeaurora.org, rdunlap@infradead.org, michal.simek@xilinx.com, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, kpc528@gmail.com, kalluripunnaiahchoudary@gmail.com, Punnaiah Choudary Kalluri <punnaia@xilinx.com>
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Jun 27, 2014 at 04:53:53PM +0530, Punnaiah Choudary Kalluri wrote:
> Zynq soc uses Chipidea/Synopsys usb IP core(CI13612). This patch adds
> necessary glue to allow the chipidea driver to work on zynq soc.
> 

Did you see the currently discussed patches for the generic chipidea
glue?

http://www.spinics.net/lists/linux-usb/msg109576.html

Try to improve that code instead writing another version
of this simple gluecode.


Thanks,
Michael


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
