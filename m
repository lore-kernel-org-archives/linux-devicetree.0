From: Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gpio: pxa: using for_each_set_bit to simplify the code
Date: Tue, 18 Sep 2012 14:39:45 +0800
Message-ID: <CAMPhdO9xKL48=0FRPrLZ=JP8epF5D=Ta0qheLEMQaL-eoe305w@mail.gmail.com>
References: <CAPgLHd93SqsiFmE7y356VwBJtaac0APE__vk+8dBZnaOyt4org@mail.gmail.com>
 <CACRpkdYAeChEqeLrz0hQxpXrWp477iXoko01swG8Y=SA7tNh5Q@mail.gmail.com>
 <CAMPhdO_XJ2+=yrkLXVFTR4ykf8QnON7mBXQ2+2xiTor=wY5S+w@mail.gmail.com>
 <CAN1soZzFmRxWUh9Og31O8XoXKwPcNPszCseJDkt_6oNPx7gD-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAN1soZzFmRxWUh9Og31O8XoXKwPcNPszCseJDkt_6oNPx7gD-g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org, Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 18, 2012 at 1:56 PM, Haojian Zhuang
<haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, Sep 18, 2012 at 1:43 PM, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Mon, Sep 17, 2012 at 6:56 PM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>> On Fri, Sep 14, 2012 at 4:36 AM, Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>
>>>> From: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
>>>>
>>>> Using for_each_set_bit() to simplify the code.
>>>>
>>>> spatch with a semantic match is used to found this.
>>>> (http://coccinelle.lip6.fr/)
>>>>
>>>> Signed-off-by: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
>>>
>>> PXA maintainers: does this look OK?
>>
>> I seem to have Acked this already in another mail, if that got lost, here
>> it is:
>>
>> Acked-by: Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
> The another mail thread is for irq, not gpio. I'll apply it today. :)

Thanks Haojian!
