From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] arm64: dts: mt2712: Add auxadc device node.
Date: Mon, 16 Oct 2017 17:09:14 +0200
Message-ID: <6680d15a-625a-cc16-830f-9831f5f52ad3@gmail.com>
References: <1505957212-13402-1-git-send-email-zhiyong.tao@mediatek.com>
 <1505957212-13402-4-git-send-email-zhiyong.tao@mediatek.com>
 <20170924164705.78cbb856@archlinux>
 <0e1bac27-18ca-121c-f1d7-8063af177a8b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0e1bac27-18ca-121c-f1d7-8063af177a8b-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Zhiyong Tao <zhiyong.tao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, liguo.zhang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 10/13/2017 05:11 PM, Matthias Brugger wrote:
> 
> 
> On 09/24/2017 05:47 PM, Jonathan Cameron wrote:
>> On Thu, 21 Sep 2017 09:26:52 +0800
>> Zhiyong Tao <zhiyong.tao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>>
>>> Add auxadc device node for MT2712.
>>>
>>> Signed-off-by: Zhiyong Tao <zhiyong.tao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>>
>> I've applied the IIO patches to make this work, so assume this will get
>> picked up in due course.
>>
> 
> pushed now to v4.14-next/dts64
> Thanks.
> 

I realized that this needs the mt2712 clock patches to actually work.
Dropped for now. Please resubmit as soon as mt2712 clock patches got [1] 
accepted upstream.

Thanks,
Matthias

[1] https://lkml.org/lkml/2017/9/19/9
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
