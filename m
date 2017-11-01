From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/3] soc: renesas: Identify R-Car M3-W ES1.1
Date: Wed, 1 Nov 2017 09:42:38 +0100
Message-ID: <20171101084237.atr25lujcqctwhjj@verge.net.au>
References: <1509384599-28953-1-git-send-email-geert+renesas@glider.be>
 <1509384599-28953-3-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1509384599-28953-3-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Oct 30, 2017 at 06:29:58PM +0100, Geert Uytterhoeven wrote:
> The Product Register of R-Car M3-W ES1.1 incorrectly identifies the SoC
> revision as ES2.0.  Add a workaround to fix this.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Is it already known how future revisions will be identified?

I'd like there to be some sort of conclusion to that discussion before
applying that patch (I seem to recall we discussed it some time ago
but I don't recall the outcome). The reason that I am being cautious here
is that it potentially has implications for old-kernel/new-SoC compatibility
which may be hard to fix later.

I am happy to apply the other patches in the series if you think that is
worthwhile.
