From: "Cousson, Benoit" <b-cousson-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 2/9] irq: check domain hwirq range for DT translate
Date: Mon, 19 Dec 2011 16:21:15 +0100
Message-ID: <4EEF566B.6080703@ti.com>
References: <1323876538-20406-1-git-send-email-robherring2@gmail.com>
 <1323876538-20406-3-git-send-email-robherring2@gmail.com>
 <4EEF3110.30203@ti.com> <4EEF48EE.1070800@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4EEF48EE.1070800-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kevin Hilman <khilman-l0cyMroinI0@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Linus Walleij <linus.ml.walleij-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Barry Song <baohua.song-kQvG35nSl+M@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/19/2011 3:23 PM, Rob Herring wrote:
> Benoit,
>
> On 12/19/2011 06:41 AM, Cousson, Benoit wrote:
>> Hi Rob,
>>
>> While trying your series to take advantage of the generic-irq domain
>> support for OMAP3 INTC, I realized that the following patch is breaking
>> drivers that are using irq_domain_add_simple.
>>
>> The point is that irq_domain_add_simple does not populate hwirq_base or
>> nr_irq, so that test will always fail if the domain is created by the
>> irq_domain_add_simple API.
>>
>> Adding an extra parameter to provide the nr_irq should fix that.
>>
>> The long term fix should be to use the generic-irq for such driver, but
>> this is not the same effort, so it might worth fixing that API for the
>> moment.
>>
>> Regards,
>> Benoit
>>
>> On 12/14/2011 4:28 PM, Rob Herring wrote:
>>> From: Rob Herring<rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>>>
>>> A DT node may have more than 1 domain associated with it, so make sure
>>> the hwirq number is within range when doing DT translation.
>>>
>>> Signed-off-by: Rob Herring<rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>>> Cc: Thomas Gleixner<tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
>>> ---
>>>    kernel/irq/irqdomain.c |    3 +++
>>>    1 files changed, 3 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
>>> index 200ce83..ae6441e 100644
>>> --- a/kernel/irq/irqdomain.c
>>> +++ b/kernel/irq/irqdomain.c
>>> @@ -135,6 +135,9 @@ int irq_domain_simple_dt_translate(struct
>>> irq_domain *d,
>>>            return -EINVAL;
>>>        if (intsize<   1)
>>>            return -EINVAL;
>>> +    if ((intspec[0]<   d->hwirq_base) ||
>>> +        (intspec[0]>= d->hwirq_base + d->nr_irq))
>
> I think this should work:
>
> if (d->nr_irq&&  ((intspec[0]<  d->hwirq_base) ||
>      (intspec[0]>= d->hwirq_base + d->nr_irq)))

Yes, indeed. It is even simpler that fixing the API.

I can now repost the OMAP3/4 series based on this series.

Thanks,
Benoit
