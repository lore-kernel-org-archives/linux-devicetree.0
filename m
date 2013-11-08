From: Christian Gmeiner <christian.gmeiner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 00/12] pwm-backlight: Add GPIO and power supply support
Date: Fri, 8 Nov 2013 14:58:56 +0100
Message-ID: <CAH9NwWc0AjmnXX1uen1z1bX5Z0pRyYrGY9a949L6=ZAF6YeL8w@mail.gmail.com>
References: <1381145866-445-1-git-send-email-treding@nvidia.com>
 <CAH9NwWfDRiQ3FegMyx1YBQ5jUgPvc7h2cxd3KgyeDdnsq6UgMw@mail.gmail.com> <20131108123619.GC31551@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131108123619.GC31551-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Guan Xuetao <gxt-TG0Ac1+ktVePQbnJrJN+5g@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pwm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2013/11/8 Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> On Thu, Nov 07, 2013 at 01:00:04PM +0100, Christian Gmeiner wrote:
>> Hi Thierry
>>
>>
>> This series adds the ability to specify a GPIO and a power supply to
>> > enable a backlight.
>> >
>>
>> Whats the state of this patch set? I am looking for this kind of
>> functionality for a pwm based
>> backlight on a devicetree only imx6 device.
>
> Those patches (except the one that adds the backlight-boot-off property)
> will be part of my pull request for 3.13.
>

That are really good news.. will try this patch set on a 3.12 kernel.

--
Christian Gmeiner, MSc
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
