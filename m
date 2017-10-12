From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] clk: renesas: rz: clk-rz is meant for RZ/A1
Date: Thu, 12 Oct 2017 14:01:05 +0200
Message-ID: <20171012120105.jwgf6brveumg2kku@verge.net.au>
References: <1507801068-12024-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1507801068-12024-1-git-send-email-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Chris Brandt <chris.brandt@renesas.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Oct 12, 2017 at 11:37:48AM +0200, Geert Uytterhoeven wrote:
> The RZ family of Renesas SoCs has several different subfamilies (RZ/A,
> RZ/G, RZ/N, and RZ/T).  Clarify that the renesas,rz-cpg-clocks DT
> bindings and clk-rz driver apply to RZ/A1 only.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

