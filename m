From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/6] serial: sh-sci: Reveal ptrval in dev_dbg
Date: Mon, 6 May 2019 15:47:05 +0200
Message-ID: <20190506134700.ya565idfzzc3enbm@verge.net.au>
References: <20190504004258.23574-1-erosca@de.adit-jv.com>
 <20190504004258.23574-2-erosca@de.adit-jv.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190504004258.23574-2-erosca@de.adit-jv.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eugeniu Rosca <roscaeugeniu@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Chris Brandt <chris.brandt@renesas.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "George G . Davis" <george_davis@mentor.com>, Andy Lowe <andy_lowe@mentor.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eugeniu Rosca <erosca@de.adit-jv.com>
List-Id: devicetree@vger.kernel.org

On Sat, May 04, 2019 at 02:42:53AM +0200, Eugeniu Rosca wrote:
> Starting with v4.15-rc2 commit ad67b74d2469d9 ("printk: hash addresses
> printed with %p"), enabling debug prints in sh-sci.c would generate
> output like below confusing the users who try to sneak into the
> internals of the driver:
> 
> sh-sci e6e88000.serial: sci_request_dma: TX: got channel (____ptrval____)
> sh-sci e6e88000.serial: sci_request_dma: mapped 4096@(____ptrval____) to 0x00000006798bf000
> sh-sci e6e88000.serial: sci_request_dma: RX: got channel (____ptrval____)
> sh-sci e6e88000.serial: sci_dma_tx_work_fn: (____ptrval____): 0...2, cookie 2
> 
> There are two possible fixes for that:
>  - get rid of '%p' prints if they don't reveal any useful information
>  - s/%p/%px/, since it is unlikely we have any concerns leaking the
>    pointer values when running a debug/non-production kernel

I am concerned that this may expose information in circumstances
where it is undesirable. Is it generally accepted practice to
use %px in conjunction with dev_dbg() ?

...
