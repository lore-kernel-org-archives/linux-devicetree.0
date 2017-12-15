From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] dt-bindings: mailbox: ti,message-manager: Fix interrupt
 name error
Date: Fri, 15 Dec 2017 15:03:45 -0600
Message-ID: <20171215210345.2eb3nm2uqegxn2q3@rob-hp-laptop>
References: <20171209193528.29491-1-nm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171209193528.29491-1-nm-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
Cc: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Dec 09, 2017 at 01:35:28PM -0600, Nishanth Menon wrote:
> Message Manager's mailbox interrupts are queue based and not proxy
> specific. The interrupt names are wrong in the binding, however
> correctly reflected in the example provided. Remove the relation
> to proxy ID in the documentation of binding. Existing device tree
> descriptions follow the correct conventions already and documentation
> update has been missed.
> 
> Signed-off-by: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/mailbox/ti,message-manager.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
