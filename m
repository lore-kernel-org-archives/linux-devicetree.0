From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 01/10] dt/bindings: Add binding for BCM2835 mailbox driver
Date: Mon, 16 Mar 2015 21:08:16 -0600
Message-ID: <55079AA0.5090904@wwwdotorg.org>
References: <1425329684-23968-1-git-send-email-eric@anholt.net> <1425329684-23968-2-git-send-email-eric@anholt.net> <20150303080550.GF6976@x1> <87vbih98za.fsf@eliezer.anholt.net> <54F66FDD.2040409@wwwdotorg.org> <87egothkaf.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87egothkaf.fsf-omZaPlIz5HhaEpDpdNBo/KxOck334EZe@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Craig McGeachie <slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/12/2015 05:23 PM, Eric Anholt wrote:
...
> The power-domain rework ended up not working out -- it needs the 
> power-domain part of device/base to support throwing -EPROBE_DEFER
> if the driver hasn't probed yet,

That makese sense.

> unless we're willing to just bake in the power domain driver in
> static init ordering.

Indeed, that's quite unlikely to be acceptable.

> Device base maintainers weren't excited about my patch for
> -EPROBE_DEFER, because then a new DT would mean we start failing to
> probe the USB driver in an older kernel, which whould be a
> regression in the case that the user had U-Boot setting up USB for
> them.

The main ABI issue is that old DTs should work with new kernels. The
other way around is nice, but certainly not as strict a requirement. I
don't think that should block a change. Do you have a link to the
thread; I don't think I noticed it.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
