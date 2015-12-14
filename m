From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 6/6] staging: board: armadillo800eva: Use "arm,pl390"
Date: Mon, 14 Dec 2015 14:05:26 +0900
Message-ID: <20151214050526.GC18143@verge.net.au>
References: <1448023017-21816-1-git-send-email-geert+renesas@glider.be>
 <1448023017-21816-7-git-send-email-geert+renesas@glider.be>
 <20151211162830.GA9306@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151211162830.GA9306@kroah.com>
Sender: linux-sh-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 11, 2015 at 11:28:30AM -0500, Greg Kroah-Hartman wrote:
> On Fri, Nov 20, 2015 at 01:36:57PM +0100, Geert Uytterhoeven wrote:
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Must be applied together with "ARM: shmobile: r8a7740 dtsi: Use
> > "arm,pl390" for GIC"!
> > 
> > Greg: Can you please provide your ack? Thanks!
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks Greg,

I have taken the liberty of assuming that ack also applies to
patch 5/6 of this series, the other staging/board patch in
this series.

I have queued up this series accordingly.
