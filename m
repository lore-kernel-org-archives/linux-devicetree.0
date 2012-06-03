From: Roland Stigge <stigge@antcom.de>
Subject: Re: [PATCH v4] MTD: LPC32xx SLC NAND driver
Date: Sun, 03 Jun 2012 21:49:40 +0200
Message-ID: <4FCBBFD4.9090401@antcom.de>
References: <1338748689-29645-1-git-send-email-stigge@antcom.de> <20120603190932.GB23368@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20120603190932.GB23368@n2100.arm.linux.org.uk>
Sender: linux-doc-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dwmw2@infradead.org, kevin.wells@nxp.com, srinivas.bakki@nxp.com, linux-arm-kernel@lists.infradead.org, hechtb@googlemail.com, lars@metafoo.de, b32955@freescale.com, leiwen@marvell.com, dedekind1@gmail.com
List-Id: devicetree@vger.kernel.org

Hi!

Thanks for the suggestions!

On 03/06/12 21:09, Russell King - ARM Linux wrote:
>> +	dma_async_issue_pending(host->dma_chan);
>> +
>> +	wait_for_completion_timeout(&host->comp, msecs_to_jiffies(1000));
> 
> What about unmapping the buffer upon completion?

OK - by not specifying DMA_COMPL_SKIP_*_UNMAP in flags, I was thinking
that this happens somehow magically. ;-) But maybe I was just confused.

Thanks,

Roland
