From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/5] iio: xoadc: augment DT bindings a bit
Date: Mon, 27 Mar 2017 09:56:03 +0200
Message-ID: <CACRpkdZwB9D_DrgKxTUUA-87qK7U4+tMPV+MCFM2zgVVO4t8ow@mail.gmail.com>
References: <20170318133358.22314-1-linus.walleij@linaro.org> <20170326045717.GB70446@Bjorns-MacBook-Pro-2.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170326045717.GB70446-iTMlPVAvTYNoL7IsjepNBwq4bfNCki47rNQQ6b5fDX0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Mar 26, 2017 at 6:57 AM, Bjorn Andersson
<bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Sat 18 Mar 06:33 PDT 2017, Linus Walleij wrote:
>

>> +adc-channel@0c {
>
> Shouldn't the @ be followed by the value of the first cell in "reg"?
> (Which will collide if we name them all "adc-channel").

I don't think we have a rule about these other than that they should
be unique. I renamed them so that it is unique using the combined
premux+amux number:

>> +     reg = <0x00 0x0c>;

So this becomes

adc-channel@000c {
    reg = <0x00 0x0c>;
};

>> +  On PM8058 the hardware only supports 16 channels, but we get the same
>> +  channels repeating with its input divided down by 1 or 3. Channels 00,
>> +  10, 20, ... f0 are the raw values, 04, 14, 24 .. f4 are "unity" channels
>> +  divided by 1, and 08, 18, 28 .. f8 are channels divided by 3. Bits 0
>> +  and 1 of the channel index should always be 0.
>> +
>> +  On PM8921 the hardware supports more than 16 channels through a complex
>> +  routing matrix using a premux, so 00, 10, 20 .. f0 are the basic raw
>> +  channels while another set of channels appear for 04, 14, 24 .. f4,
>> +  and again some of the same channels appear again divided down by 3
>> +  in 08, 18, 28 .. f8. Again bits 0 and 1 of the channel index should
>> +  always be 0.
>
> While I believe documenting this is a good thing I do not think it adds
> value to this binding document (other than showing Rob the absurdness of
> the addressing scheme). Please consider moving it to the driver (haven't
> checked how you commented it yet) and drop it from here.

Dropped it.

I'm sending this modified version as v2.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
