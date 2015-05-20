From: Bintian <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 4/5] clk: hi6220: Clock driver support for Hisilicon
 hi6220 SoC
Date: Wed, 20 May 2015 08:52:37 +0800
Message-ID: <555BDAD5.1080301@huawei.com>
References: <1430827599-11560-1-git-send-email-bintian.wang@huawei.com>	<1430827599-11560-5-git-send-email-bintian.wang@huawei.com>	<20150515002527.GD31753@codeaurora.org>	<5555A37B.1090105@huawei.com>	<20150515193041.GO31753@codeaurora.org> <CAAS=xmjsFoQg-HgWA5-e=cF3qF+PcVNc3i_3Z5EBPNJ2HyOZKQ@mail.gmail.com> <555B9E7B.9000809@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <555B9E7B.9000809-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Brent Wang <wangbintian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Zhangfei Gao <zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Xu Wei <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Haifeng Yan <yanhaifeng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org" <xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, "sledge.yanwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org" <sledge.yan>
List-Id: devicetree@vger.kernel.org

Hello Stephen,

On 2015/5/20 4:35, Stephen Boyd wrote:
> On 05/15/15 19:54, Brent Wang wrote:
>>
>>>> How about just send this patch for review not the whole patch set in
>>>> next version?
>>>>
>>> Yes a single patch is fine. I take it you want the patch to go
>>> through arm-soc with some Ack from us?
>> Yes, exactly.
>> The dts file includes the clock head file,  this patch goes through
>> arm-soc is a good choice.
>
> One way to avoid that problem is to split the clock header file into its
> own patch and then duplicate that patch in two trees, one that goes
> through arm-soc and one that goes through clk.
>
Thanks for your suggestion, I will talk about this with Hisilicon SoC
maintainer XuWei.

I have updated this patch based on your suggestion, could you help
review patch "[PATCH v6 5/6] clk: hi6220: Clock driver support for 
Hisilicon hi6220 SoC"?

Thanks,

Bintian

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
