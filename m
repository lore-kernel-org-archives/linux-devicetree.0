From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 07/13] ARM: dts: r8a7790: Add missing clocks for
 secondary CA15 CPU cores
Date: Mon, 16 Oct 2017 11:42:17 +0200
Message-ID: <20171016094209.2rnsdgye2dfx7dol@verge.net.au>
References: <1507800916-11509-1-git-send-email-geert+renesas@glider.be>
 <1507800916-11509-8-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1507800916-11509-8-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 12, 2017 at 11:35:10AM +0200, Geert Uytterhoeven wrote:
> Currently only the primary CPU in the CA15 cluster has a clocks
> property, while the secondary CPU cores are driven by the same clock.
> Add the missing clocks properties to fix this.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Tested-by: Simon Horman <horms+renesas@verge.net.au>
