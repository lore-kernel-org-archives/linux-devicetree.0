From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 1/2] Documentation: dt: mailbox: Add TI Message Manager
Date: Thu, 3 Mar 2016 15:09:47 -0600
Message-ID: <20160303210947.GA9057@rob-hp-laptop>
References: <1456525452-30638-1-git-send-email-nm@ti.com>
 <1456525452-30638-2-git-send-email-nm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1456525452-30638-2-git-send-email-nm-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
Cc: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, fcooper-l0cyMroinI0@public.gmane.org, s-anna-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 26, 2016 at 04:24:11PM -0600, Nishanth Menon wrote:
> Message Manager is a hardware block used to communicate with various
> processor systems within certain Texas Instrument's Keystone
> generation SoCs.
> 
> This hardware engine is used to transfer messages from various compute
> entities(or processors) within the SoC. It is designed to be self
> contained without needing software initialization for operation.
> 
> Signed-off-by: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>
> ---
> Changes in V2: major refactor of binding - Thanks for all the review from Rob and Jassi
> 	- Generic compatible property is dropped
> 	- no more child nodes, instead interrupt information is provided as part
> 	  of the the message manager node it self - part of data moved into
> 	  driver based on compatible property.
> 	- mbox-cells is 2 (passes queue_id and proxy_id) -added elaboration as well
> 	- change in interrupt names
> 
> V1: https://patchwork.kernel.org/patch/8237111/
> 
>  .../bindings/mailbox/ti,message-manager.txt        | 50 ++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/ti,message-manager.txt

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
