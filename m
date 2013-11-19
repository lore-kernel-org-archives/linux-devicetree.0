From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: gpio-generic DT bindings?
Date: Tue, 19 Nov 2013 14:59:51 -0700
Message-ID: <528BDF57.8080400@wwwdotorg.org>
References: <CAMuHMdU9F_EjA+ZF0mn4PW3HDJ9rkM_84SHiDKkWwWr7MLJKJA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdU9F_EjA+ZF0mn4PW3HDJ9rkM_84SHiDKkWwWr7MLJKJA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/19/2013 02:45 PM, Geert Uytterhoeven wrote:
> This topic seems to come up from time to time.
> Unfortunately the last time it coincided with the move of the mailing list
> from ozlabs to vger, causing the mailing list archives not to have captured
> the full discussion.
> 
> Is there anything definitive/usable out there?

What do you mean by "gpio-generic DT bindings"? A generic binding for a
controller, or something else? I think it's best to have a specific
binding for each individual controller, so it's always possible to know
exactly which controller is present. Now, all the binding definitions
should all look the same or as similar as possible for consistency...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
