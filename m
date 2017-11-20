From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCHv2] of: Document exactly what of_find_node_by_name() puts
Date: Mon, 20 Nov 2017 14:44:58 -0600
Message-ID: <20171120204458.swv43avbsjgvy3km@rob-hp-laptop>
References: <20171117165321.18591-1-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171117165321.18591-1-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Frank Rowand <frowand.list@gmail.com>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 17, 2017 at 08:53:21AM -0800, Stephen Boyd wrote:
> It isn't clear if this function of_node_put()s the 'from'
> argument, or the node it searches. Clearly indicate which
> variable is touched. Fold in some more fixes from Randy too
> because we're in the area.
> 
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
> 
> Changes from v1:
>  * Fold in Randy's fixes
> 
>  drivers/of/base.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Rob
