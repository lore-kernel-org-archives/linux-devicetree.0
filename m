From: Haojian Zhuang <haojian.zhuang@gmail.com>
Subject: Re: [PATCH] gpio: pxa: using for_each_set_bit to simplify the code
Date: Mon, 17 Sep 2012 21:43:11 +0800
Message-ID: <CAN1soZzF_GjSOHb3WwbWLHTOWecQih6FYpoX4PS3Kryz4TMWqg@mail.gmail.com>
References: <CAPgLHd93SqsiFmE7y356VwBJtaac0APE__vk+8dBZnaOyt4org@mail.gmail.com>
	<CACRpkdYAeChEqeLrz0hQxpXrWp477iXoko01swG8Y=SA7tNh5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYAeChEqeLrz0hQxpXrWp477iXoko01swG8Y=SA7tNh5Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Wei Yongjun <weiyj.lk@gmail.com>, Eric Miao <eric.y.miao@gmail.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, grant.likely@secretlab.ca, rob.herring@calxeda.com, yongjun_wei@trendmicro.com.cn, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 17, 2012 at 6:56 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Sep 14, 2012 at 4:36 AM, Wei Yongjun <weiyj.lk@gmail.com> wrote:
>
>> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>>
>> Using for_each_set_bit() to simplify the code.
>>
>> spatch with a semantic match is used to found this.
>> (http://coccinelle.lip6.fr/)
>>
>> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> PXA maintainers: does this look OK?
>
> Yours,
> Linus Walleij

It seems good.

Acked-by: Haojian Zhuang <haojian.zhuang@gmail.com>
