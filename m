From: Ayaka <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Subject: Re: [PATCH v7 3/4] usb: dwc2: assert phy reset when waking up in rk3288 platform
Date: Tue, 6 Sep 2016 07:38:34 +0800
Message-ID: <B43AE00F-5B70-4522-B5B7-DB02A5D02E8B@soulik.info>
References: <1472939729-15187-1-git-send-email-ayaka@soulik.info> <1472939729-15187-4-git-send-email-ayaka@soulik.info> <063D6719AE5E284EB5DD2968C1650D6DB00F483E@AcuExch.aculab.com>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain;
        charset=big5
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <063D6719AE5E284EB5DD2968C1650D6DB00F483E-VkEWCZq2GCInGFn1LkZF6NBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Laight <David.Laight-ZS65k/vG3HxXrIkS9f7CXA@public.gmane.org>
Cc: "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org" <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org" <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "kishon-l0cyMroinI0@public.gmane.org" <kishon-l0cyMroinI0@public.gmane.org>, "randy.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org" <randy.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org



從我的 iPad 傳送

> David Laight <David.Laight-ZS65k/vG3HxXrIkS9f7CXA@public.gmane.org> 於 2016年9月5日 下午9:35 寫道：
> 
> From: Randy Li
>> Sent: 03 September 2016 22:55
> ...
>> +            if (of_device_is_compatible(np, "rockchip,rk3288-usb")
>> +                    && (NULL != hsotg->phy->ops->reset))
>> +                hsotg->phy->ops->reset(hsotg->phy);
>> +
> 
> Is this the only place ops->reset() is called?
Yes.
> Probably much better to check it first.
Sure.
> 
>            if (hsotg->phy->ops->reset
>                    && of_device_is_compatible(np, "rockchip,rk3288-usb")
>                hsotg->phy->ops->reset(hsotg->phy);
I see, if there is no the other review request for this version, I would submit a new version to fix this problem tonight.
> 
>    David

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
