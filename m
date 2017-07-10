From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] rtc: ds1307: remove legacy check for
 "isil,irq2-can-wakeup-machine" property
Date: Mon, 10 Jul 2017 09:08:50 -0500
Message-ID: <20170710140850.zqddgr2gy6gn3zpx@rob-hp-laptop>
References: <ff4ea92b-4af3-1a59-2ea3-056a43125c20@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ff4ea92b-4af3-1a59-2ea3-056a43125c20-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 06, 2017 at 10:40:03PM +0200, Heiner Kallweit wrote:
> Commit 8b44f5be20fd ("ARM: dts: armada: replace isil,irq2-can-wakeup-machine with wakeup-source property")
> removed the last usage of "isil,irq2-can-wakeup-machine" almost
> two years ago. So I think we can get rid of supporting this
> legacy binding.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/power/wakeup-source.txt | 9 ++++-----
>  Documentation/devicetree/bindings/rtc/isil,isl12057.txt   | 1 -
>  drivers/rtc/rtc-ds1307.c                                  | 8 +-------
>  3 files changed, 5 insertions(+), 13 deletions(-)

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
