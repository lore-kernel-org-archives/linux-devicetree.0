From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v4 0/4] stm32 clocksource driver rework
Date: Mon, 9 Oct 2017 11:27:17 +0200
Message-ID: <b7179354-1a97-375e-56b3-8aef383d90d2@linaro.org>
References: <1506959513-16851-1-git-send-email-benjamin.gaignard@linaro.org>
 <CA+M3ks551+w1wtg9O_bYRiTjx00M8qOBsB92og2-EL0Wnrf2rw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+M3ks551+w1wtg9O_bYRiTjx00M8qOBsB92og2-EL0Wnrf2rw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Thomas Gleixner <tglx@linutronix.de>, Ludovic Barre <ludovic.barre@st.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 09/10/2017 11:23, Benjamin Gaignard wrote:
> 2017-10-02 17:51 GMT+02:00 Benjamin Gaignard <benjamin.gaignard@linaro.org>:
>> version 4:
>> - split patch in 3 parts
>>   - convert code to timer_of
>>   - only use 32 bits timers
>>   - add clocksource support
> 
> Hello Daniel,
> 
> Does the patches split sound good for you ?

Hi Benjamin,

Yes, the split is ok. I will go for the details as soon as I can.

Thanks.

  -- Daniel


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
