From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] iio: imu: st_lsm6dsx: support open drain mode
Date: Thu, 29 Jun 2017 13:46:32 +0200
Message-ID: <CACRpkdYLbHrNehFeJZDAHoOfegBJqqTesJUrXSALNqGLPT_SPA@mail.gmail.com>
References: <20170621192129.10226-1-lorenzo.bianconi@st.com>
 <20170621192129.10226-2-lorenzo.bianconi@st.com> <20170624210835.56ffdd1c@kernel.org>
 <CAA2SeNJ5yPqMiW2tVSc9ZSC5Rt=Q+CRoMibzigjvPyw05Qsr5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAA2SeNJ5yPqMiW2tVSc9ZSC5Rt=Q+CRoMibzigjvPyw05Qsr5Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lorenzo BIANCONI <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Jun 25, 2017 at 11:34 AM, Lorenzo Bianconi
<lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

>> In common with the mpu3050 which was the first driver in IIO to do open drain,

I think I implemented it on the ST sensors first actually.

>> I think you need to think about precedence as we allow for IRQF_RISING
>> and IRQF_FALLING already.  Open drain only allows for shared interrupts
>> if IRQF_FALLING (I think)
>>>       err = devm_request_threaded_irq(hw->dev, hw->irq,
>>>                                       st_lsm6dsx_handler_irq,
>>>                                       st_lsm6dsx_handler_thread,
>
> I have not got the difference between IRQF_RISING and IRQF_FALLING
> when the irq line
> is marked as shared (when open drain is enabled).
> Looking at the code, mpu3050 gyro sensor does not support shared interrupts
> with IRQF_RISING and IRQF_TRIGGER_HIGH. Is it a hw limitation?

It seems like I have inverted the logic in the MPU3050 driver.
I'll send a patch.

> Speaking with digital designer, lsm6dsx series allows open drain mode
> even if the requested irq line
> is IRQF_TRIGGER_HIGH or IRQF_RISING, we need to add a pull-down resistor.
> Moreover ST framework already supports open drain if the requested
> interrupt is IRQF_RISING.

This seems correct.

Yours,
Linus Walleij
