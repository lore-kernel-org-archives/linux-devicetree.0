From: Roland Stigge <stigge@antcom.de>
Subject: Re: [PATCH v7] MTD: LPC32xx SLC NAND driver
Date: Wed, 27 Jun 2012 17:26:17 +0200
Message-ID: <4FEB2619.8020000@antcom.de>
References: <1339064536-20553-1-git-send-email-stigge@antcom.de>  <1340794007.29342.50.camel@sauron.fi.intel.com>  <4FEAF90B.5030809@antcom.de> <1340800392.1799.17.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1340800392.1799.17.camel@sauron.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dedekind1@gmail.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dwmw2@infradead.org, kevin.wells@nxp.com, srinivas.bakki@nxp.com, linux-arm-kernel@lists.infradead.org, hechtb@googlemail.com, lars@metafoo.de, b32955@freescale.com, leiwen@marvell.com, linux@arm.linux.org.uk
List-Id: devicetree@vger.kernel.org

On 06/27/2012 02:33 PM, Artem Bityutskiy wrote:
> On Wed, 2012-06-27 at 14:14 +0200, Roland Stigge wrote:
>> Thanks for the note! I'm sending an incremental patch. There was 
>> actually only one place in the two functions that could fail
>> (return code of lpc32xx_xfer()).
> 
> Could you please check the MCL patch as well and re-send it against
> the l2 tree?
> 
> I've squashed your change into the driver and pushed out, thanks!

Yes, thanks!

Will post an updated MLC against l2-mtd later today.

Roland
