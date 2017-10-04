From: Richard Leitner <richard.leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/9 v2] usb: usb251xb: Add USB2517i specific struct and
 IDs
Date: Wed, 4 Oct 2017 09:39:12 +0200
Message-ID: <8022002c-956f-28e6-abca-5919157704c1@skidata.com>
References: <20170915233113.17855-1-fancer.lancer@gmail.com>
 <20170916104220.3742-1-fancer.lancer@gmail.com>
 <20170916104220.3742-2-fancer.lancer@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170916104220.3742-2-fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: Sergey.Semin-vHJ8rsvMqnUPfZBKTuL5GA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Leitner <Richard.Leitner-WcANXNA0UjBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Serge,

On 09/16/2017 12:42 PM, Serge Semin wrote:
> There are USB2517 and USB2517i hubs, which have almost the same
> registers space as already supported USB251xbi series. The difference
> it in DIDs and in few functions. This patch adds the USB2517/i data
> structures to the driver, so it would have different setting depending
> on the device discovered on i2c-bus.
> 
> Signed-off-by: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/usb251xb.txt  |  3 ++-
>  drivers/usb/misc/usb251xb.c                         | 21 ++++++++++++++++++++-
>  2 files changed, 22 insertions(+), 2 deletions(-)

...

Please also mention support for the USB2517(i) hubs in the Kconfig
helptext of the driver @ drivers/usb/misc/Kconfig. Thanks.

Apart from that the patch looks good to me.

regards,
Richard.L
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
