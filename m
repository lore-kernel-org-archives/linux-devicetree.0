From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH][RESEND] of: return of_get_cpu_node from
 of_cpu_device_node_get if CPUs are not registered
Date: Thu, 17 Aug 2017 16:49:11 +0100
Message-ID: <11afa843-01c3-145e-8c0d-49c143b1f01d@arm.com>
References: <1502727520-5635-1-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502727520-5635-1-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On 14/08/17 17:18, Sudeep Holla wrote:
> Instead of the callsites choosing between of_cpu_device_node_get if the
> CPUs are registered as of_node is populated by then and of_get_cpu_node
> when the CPUs are not yet registered as CPU of_nodes are not yet stashed
> thereby needing to parse the device tree, we can call of_get_cpu_node
> in case the CPUs are not yet registered in of_cpu_device_node_get.
> 
> This will allow to use of_cpu_device_node_get anywhere hiding the
> details from the caller.
> 
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> ---
>  include/linux/of_device.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Hi Rob,
> 
> You have already acked this patch, but I wanted you to pick up this via
> your tree and hence I am resending it. I tried pinging on that thread
> but I can understand that it's lost in your mailbox :)
> 

Gentle ping!

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
