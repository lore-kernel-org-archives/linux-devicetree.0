From: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH 2/5] pinctrl: stm32: add STM32F769 MCU support
Date: Tue, 23 Jan 2018 09:44:46 +0100
Message-ID: <7dd6bae8-87ef-7dd1-477a-a40d6ab48a94@st.com>
References: <1512982475-32661-2-git-send-email-alexandre.torgue@st.com>
 <1512982475-32661-3-git-send-email-alexandre.torgue@st.com>
 <CACRpkdYTbjXx5tx9LjRKkbZ7zCBZz0Fhe_cmRm4DMq_3hTTmtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdYTbjXx5tx9LjRKkbZ7zCBZz0Fhe_cmRm4DMq_3hTTmtA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 01/22/2018 09:25 AM, Linus Walleij wrote:
> On Mon, Dec 11, 2017 at 9:54 AM, Alexandre Torgue
> <alexandre.torgue-qxv4g6HH51o@public.gmane.org> wrote:
> 
>> This patch which adds STM32F769 pinctrl and GPIO support, relies on the
>> generic STM32 pinctrl driver.
>>
>> Signed-off-by: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
> 
> Patch applied as Patrice poked me.
> 
> I hope it works fine being applied in isolation from the other
> patches?

Yes it does. I will add other patches in my next pull request (for v4.17).

Thanks
Alex

> 
> Yours,
> Linus Walleij
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
