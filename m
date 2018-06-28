From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH v3] dmaengine: rcar-dmac: don't use DMAC error interrupt
Date: Thu, 28 Jun 2018 09:51:23 +0530
Message-ID: <20180628042123.GJ22377@vkoul-mobl>
References: <87lgbgswl5.wl%kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87lgbgswl5.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Dan Williams <dan.j.williams@intel.com>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran@ksquared.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, dmaengine@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 15-06-18, 00:53, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> rcar-dmac has 2 types of interrupt, 1) error IRQ (for all),
> 2) IRQ for each channels.
> If error happens on some channels, the error IRQ will be handled
> by 1), and "all" channels will be restarted.
> But in this design, error handling itself will be problem for
> non error channel users.
> This patch removes 1) handler, and handles error IRQ on 2)
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> [Kuninori: updated patch to adjust DMACHCR/DMAOR]
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Tested-by: Nguyen Viet Dung <nv-dung@jinso.co.jp>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied, thanks

-- 
~Vinod
