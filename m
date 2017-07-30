From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] rtc: ds1307: remove legacy check for
 "isil,irq2-can-wakeup-machine" property
Date: Sun, 30 Jul 2017 16:30:59 +0200
Message-ID: <20170730143059.bdopnnvajlj6gw6u@piout.net>
References: <ff4ea92b-4af3-1a59-2ea3-056a43125c20@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <ff4ea92b-4af3-1a59-2ea3-056a43125c20-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 06/07/2017 at 22:40:03 +0200, Heiner Kallweit wrote:
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
> 
Applied, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
