From: Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>
Subject: Re: [PATCH REPOST] ARM: Fix incorrect FDT initrd parameter override
Date: Fri, 17 Jan 2014 22:45:02 +1000
Message-ID: <52D925CE.8050204@killerwolves.net>
References: <deeb5f$5527t1@icp-osb-irony-out2.iinet.net.au> <CAL_JsqJNPbQVKtW0amaOSc1is9oKrGapaHR=YJGJy6TrGQeKYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJNPbQVKtW0amaOSc1is9oKrGapaHR=YJGJy6TrGQeKYw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 16, 2014 at 10:04 AM -0600, Rob Herring wrote:
>> Signed-off-by: Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>
> 
> I'd really like to see phys_initrd_* removed, but that would be more
> invasive, so:
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
> Please submit to Russell's patch system and mark for stable. I don't
> think there is time before 3.13 is released.

This patch (7941/2) was submitted on 14 Jan after being acked by Jason Cooper.

<http://lists.infradead.org/pipermail/linux-arm-kernel/2014-January/225272.html>

I apologise for the duplicate patch post.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
