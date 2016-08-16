From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/8] ARM: dts: sun8i: Add dt node for rtl8703as wifi chip
 on ga10h
Date: Tue, 16 Aug 2016 10:41:45 +0200
Message-ID: <e8dbda57-a931-0f13-28b3-9cb63bb0f5c4@redhat.com>
References: <1470685398-14568-1-git-send-email-hdegoede@redhat.com>
 <1470685398-14568-2-git-send-email-hdegoede@redhat.com>
 <CAGb2v67=54_cW6Svt2ZNvtMXwOU7wvzj_V6MT0fGB9hAjX=8PA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGb2v67=54_cW6Svt2ZNvtMXwOU7wvzj_V6MT0fGB9hAjX=8PA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 16-08-16 04:43, Chen-Yu Tsai wrote:
> On Tue, Aug 9, 2016 at 3:43 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>> The ga10h tablet has a rtl8703as wifi chip, add a dt node describing it.
>>
>> This enables usage of wifi on this tablet (together with the out of
>> tree rtl8732bs driver).
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>
> Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>
> Does the chip or board support out of band interrupts?

I believe so, but since the sunxi-mmc controller properly supports
sdio-irq-s (without needing to poll) there is not to much to win there,
so currently I've no plans to support this (this would require defining
a dt binding + dts changes + driver changes).

Regards,

Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
