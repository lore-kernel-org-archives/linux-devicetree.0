From: Stewart Smith <stewart-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0030/1529] Fix typo
Date: Mon, 23 May 2016 11:17:51 +1000
Message-ID: <878tz1y3ls.fsf@linux.vnet.ibm.com>
References: <20160521113934.453-1-andrea.gelmini@gelma.net>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160521113934.453-1-andrea.gelmini-PT7Us6ch6G9eoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrea Gelmini <andrea.gelmini-PT7Us6ch6G9eoWH0uzbU5w@public.gmane.org>andrea.gelmini-PT7Us6ch6G9eoWH0uzbU5w@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, sudeep.holla-5wv7dgnIgG8@public.gmane.org, paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Andrea Gelmini <andrea.gelmini-PT7Us6ch6G9eoWH0uzbU5w@public.gmane.org> writes:
> Signed-off-by: Andrea Gelmini <andrea.gelmini-PT7Us6ch6G9eoWH0uzbU5w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/rtc/rtc-opal.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-opal.txt b/Documentation/devicetree/bindings/rtc/rtc-opal.txt
> index a1734e5..2340938c 100644
> --- a/Documentation/devicetree/bindings/rtc/rtc-opal.txt
> +++ b/Documentation/devicetree/bindings/rtc/rtc-opal.txt
> @@ -2,7 +2,7 @@ IBM OPAL real-time clock
>  ------------------------
>  
>  Required properties:
> -- comapatible: Should be "ibm,opal-rtc"
> +- compatible: Should be "ibm,opal-rtc"
>  
>  Optional properties:
>  - wakeup-source: Decides if the wakeup is supported or not

Acked-by: Stewart Smith <stewart-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>

-- 
Stewart Smith
OPAL Architect, IBM.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
