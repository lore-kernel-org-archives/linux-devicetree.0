From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/3] Revert "Documentation: devicetree: dwc2: Deprecate
 g-tx-fifo-size"
Date: Sat, 8 Oct 2016 15:49:16 -0500
Message-ID: <20161008204916.GA11595@rob-hp-laptop>
References: <becf876f7fbe993d4cadd4e38e26246e9e697eea.1475202428.git.johnyoun@synopsys.com>
 <db10dd0c6dcc9479b5a4846c040cf592154b730d.1475202428.git.johnyoun@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <db10dd0c6dcc9479b5a4846c040cf592154b730d.1475202428.git.johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 30, 2016 at 11:47:21AM -0700, John Youn wrote:
> This binding was deprecated due to commit aa381a7259c3 ("usb: dwc2:
> gadget: fix TX FIFO size and address initialization"). However that
> commit is now reverted, so also revert this commit.
> 
> The binding is valid and shouldn't be deprecated.
> 
> This reverts commit 65e1ff7f4b5b ("Documentation: devicetree: dwc2:
> Deprecate g-tx-fifo-size").
> 
> Signed-off-by: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.txt | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
