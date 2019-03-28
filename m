From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] of: property: Document that
 of_graph_get_endpoint_by_regs needs of_node_put
Date: Thu, 28 Mar 2019 14:40:55 -0500
Message-ID: <20190328194055.GA13068@bogus>
References: <20190315092247.7286-1-maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190315092247.7286-1-maxime.ripard@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 15, 2019 at 10:22:47AM +0100, Maxime Ripard wrote:
> The node returned by of_graph_get_endpoint_by_regs has a reference taken,
> and we need to put that reference back when done with the node.
> 
> However, the documentation for that node doesn't mention it, so let's make
> sure it does.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  drivers/of/property.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied.

Rob
