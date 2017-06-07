From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] ARM: shmobile: Update R-Car Gen3 ULCB board part numbers
Date: Wed, 7 Jun 2017 17:12:03 -0500
Message-ID: <20170607221203.hgjp3izxpjuvxd7t@rob-hp-laptop>
References: <1496313269-27795-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1496313269-27795-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Vladimir Barinov <vladimir.barinov@cogentembedded.com>, linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 01, 2017 at 12:34:29PM +0200, Geert Uytterhoeven wrote:
> The board part numbers for the R-Car H3 and M3 ULCB boards corresponded
> to versions predating mass production.  Update them for mass production.
> 
> Note that the H3 ULCB board can be equipped with either revision ES1.1
> or ES2.0 of the R-Car H3 SoC.  While these have different board part
> numbers, no new compatible values are needed, as the revision can be
> detected at runtime using the PRR register.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> See also http://elinux.org/index.php?title=R-Car/Boards/H3SK
> 
>  Documentation/devicetree/bindings/arm/shmobile.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
