From: xuejiancheng <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2] mtd: spi-nor: add hisilicon spi-nor flash controller
 driver
Date: Mon, 11 Jan 2016 11:53:38 +0800
Message-ID: <56932742.5070105@huawei.com>
References: <1452216405-10826-1-git-send-email-xuejiancheng@huawei.com>
 <20160109154249.GA28102@rob-hp-laptop> <56930369.1050000@huawei.com>
 <CAL_Jsq+K-tF=snhq+w9yYQKmAxbxDSLq6cv5fLfWjHTgdJxQWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_Jsq+K-tF=snhq+w9yYQKmAxbxDSLq6cv5fLfWjHTgdJxQWQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, shijie.huang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, pengbinquan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, han.xu-KZfg59tc24xl57MIdRCFDg@public.gmane.org, Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, yanhaifeng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, yanghongwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, suwenping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, ml.yang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, gaofei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhangzhenxing-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, xuejiancheng-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 2016/1/11 11:09, Rob Herring wrote:
> On Sun, Jan 10, 2016 at 7:20 PM, xuejiancheng <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org> wrote:
>> Hi Rob,
>>
>> On 2016/1/9 23:42, Rob Herring wrote:
>>> On Fri, Jan 08, 2016 at 09:26:45AM +0800, Jiancheng Xue wrote:
>>>> add hisilicon spi-nor flash controller driver
>>>>
>>>> Signed-off-by: Binquan Peng <pengbinquan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>>>> Signed-off-by: Jiancheng Xue <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
>>>> ---
> 
>>>> +Required properties:
>>>> +- compatible : Should be "hisilicon,hisi-sfc".
>>>
>>> I missed this last time, but you also need a more specific compatible
>>> string with the SOC name in it.
>>>
>>
>> This IP block is used in many SOCs. Do I need to add a specific compatible
>> string for every SOC? Thank you.
> 
> Yes. You can keep the generic one for driver matching, but you want to
> have the specific one in case there ever is a quirk/errata in a
> specific SOC.
> 

I see. Thank you.

> Rob
> 
> .
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
