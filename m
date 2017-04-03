From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: dts: r7s72100: fix ethernet clock parent
Date: Mon, 3 Apr 2017 06:17:21 -0400
Message-ID: <20170403101720.GE31988@verge.net.au>
References: <20170330211609.598-1-chris.brandt@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170330211609.598-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 30, 2017 at 02:16:09PM -0700, Chris Brandt wrote:
> Technically, the Ethernet block is run off the 133MHz Bus (B) clock, not
> the 33MHz Peripheral 0 (P0) clock.
> 
> Fixes: 969244f9c720 ("ARM: dts: r7s72100: add ethernet clock to device tree")
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thanks, I have queued this up.
