From: Tomas Novotny <tomas-P46umIhNmdHrBKCeMvbIDA@public.gmane.org>
Subject: Re: [PATCH 0/4] rtc: ds1307: add support for device tree and
 mcp7940x
Date: Thu, 27 Nov 2014 16:17:41 +0100
Message-ID: <20141127161741.52e8d300@tomas>
References: <1416844164-16782-1-git-send-email-tomas@novotny.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416844164-16782-1-git-send-email-tomas-P46umIhNmdHrBKCeMvbIDA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 24 Nov 2014 16:49:20 +0100
Tomas Novotny <tomas-P46umIhNmdHrBKCeMvbIDA@public.gmane.org> wrote:

> This series is tested with MCP79401 and it is based on 3.18-rc6.
> 
> Tomas Novotny (4):
>   rtc: ds1307: add support for mcp7940x chips
>   of: add vendor prefix for Pericom Technology
>   rtc: ds1307: add device tree bindings documentation
>   rtc: ds1307: add device tree support
> 
>  .../devicetree/bindings/rtc/maxim,ds1307.txt       |  23 ++++
>  .../devicetree/bindings/vendor-prefixes.txt        |   1 +
>  drivers/rtc/rtc-ds1307.c                           | 149 ++++++++++++---------
>  3 files changed, 110 insertions(+), 63 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/rtc/maxim,ds1307.txt

It is now in the -mm and linux-next.
Thanks to Andrew for pick up,

Tomas
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
