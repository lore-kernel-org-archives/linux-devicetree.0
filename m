From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 0/2] ARM: shmobile: sh73a0: Add MSIOF support
Date: Tue, 1 Dec 2015 15:36:03 +0900
Message-ID: <20151201063602.GG16260@verge.net.au>
References: <1448893012-8465-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1448893012-8465-1-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-sh@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 30, 2015 at 03:16:50PM +0100, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> This patch series adds support for the 4 MSIOF channels on SH-Mobile
> AG5.
> 
> It has been tested (TX only) using MSIOF1 on the CN21 test connector.
> RX hasn't been tested, as there are one-directional buffers between the
> real MSIOF interface on high-density connector CN8 and the CN21 test
> connector.
> 
> Functionality-wise, this depends on the bindings in "[PATCH] spi:
> sh-msiof: Add support for SH-Mobile AG5", and pinctrl in "[PATCH]
> pinctrl: sh-pfc: sh73a0: Add MSIOF support".
> 
> Thanks!

Thanks, I have queued these up.
