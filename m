From: Lokesh Vutla <lokeshvutla-l0cyMroinI0@public.gmane.org>
Subject: Re: dt-bindings: mailbox: ti,message-manager: Fix interrupt name
 error
Date: Wed, 13 Dec 2017 13:32:30 +0530
Message-ID: <11fac98b-412d-97ff-6bfd-e6def6a6e6f7@ti.com>
References: <20171209193528.29491-1-nm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171209193528.29491-1-nm-l0cyMroinI0@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Sunday 10 December 2017 01:05 AM, Nishanth Menon wrote:
> Message Manager's mailbox interrupts are queue based and not proxy
> specific. The interrupt names are wrong in the binding, however
> correctly reflected in the example provided. Remove the relation
> to proxy ID in the documentation of binding. Existing device tree
> descriptions follow the correct conventions already and documentation
> update has been missed.
> 
> Signed-off-by: Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>

Reviewed-by: Lokesh Vutla <lokeshvutla-l0cyMroinI0@public.gmane.org>

Thanks and regards,
Lokesh
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
