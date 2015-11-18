From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 0/2] VIN, ADV7180 for r8a7794/alt
Date: Wed, 18 Nov 2015 12:52:55 -0800
Message-ID: <20151118205255.GB10471@verge.net.au>
References: <1447851067-8214-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1447851067-8214-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: linux-sh@vger.kernel.org, magnus.damm@gmail.com, laurent.pinchart@ideasonboard.com, sergei.shtylyov@cogentembedded.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 18, 2015 at 01:51:05PM +0100, Ulrich Hecht wrote:
> Hi!
> 
> This series adds VIN support for the Alt board.  The hardware configuration
> for I2C1 and the video decoder of Alt is exactly identical to that of Silk,
> so these are largely identical to Sergei's Silk definitions.
> 
> To be applied on top of Horms's "ARM: shmobile: alt: Add pfc pins to DT"
> patch.

Thanks, I have queued-up this series on top of the patch mentioned above.
