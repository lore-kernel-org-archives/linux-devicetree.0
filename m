From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Subject: Re: [PATCH v9 0/7] FPGA Manager Framework and Simple FPGA Bus
Date: Fri, 17 Jul 2015 11:25:58 -0600
Message-ID: <20150717172558.GB15808@obsidianresearch.com>
References: <1437148277-5405-1-git-send-email-atull@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1437148277-5405-1-git-send-email-atull@opensource.altera.com>
Sender: linux-doc-owner@vger.kernel.org
To: atull@opensource.altera.com
Cc: gregkh@linuxfoundation.org, hpa@zytor.com, monstr@monstr.eu, michal.simek@xilinx.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, pantelis.antoniou@konsulko.com, robh+dt@kernel.org, grant.likely@linaro.org, iws@ovro.caltech.edu, linux-doc@vger.kernel.org, pavel@denx.de, broonie@kernel.org, philip@balister.org, rubini@gnudd.com, s.trumtrar@pengutronix.de, jason@lakedaemon.net, kyle.teske@ni.com, nico@linaro.org, balbi@ti.com, m.chehab@samsung.com, davidb@codeaurora.org, rob@landley.net, davem@davemloft.net, cesarb@cesarb.net, sameo@linux.intel.com, akpm@linux-foundation.org, linus.walleij@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devel@driverdev.osuosl.org, Petr Cvek <petr.cvek@tul.cz>, delicious.quinoa@gmail.com, dinguyen@opensource.altera.com, yvanderv@opensource.alte
List-Id: devicetree@vger.kernel.org

On Fri, Jul 17, 2015 at 10:51:10AM -0500, atull@opensource.altera.com wrote:
> From: Alan Tull <atull@opensource.altera.com>
> 
> This patchset adds two chunks plus documentation:
>  * fpga manager core: exports ABI functions that write an image to a FPGA
>  * DT Overlay support: simple-fpga-bus to handle FPGA from a DT overlay

I didn't read super closely, but overall it makes sense to me..

Providing an in-kernel API will let someone else figure out how to
expose that to user space. The DT based scheme seems pretty nice.

Can you use this without DT overlay? Ie if I provide the FGPA
description as part of my boot time DT will it just work?

Jason
