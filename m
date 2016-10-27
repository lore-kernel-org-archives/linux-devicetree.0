From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mcp23s08: Add option to configure pullups.
Date: Thu, 27 Oct 2016 14:22:14 +0200
Message-ID: <CACRpkda9N7xQE0=dXrgPZUuBzTo39OPUWGPYS6nith-E29NprQ@mail.gmail.com>
References: <1477062035-30825-1-git-send-email-enric.balletbo@collabora.com>
 <CACRpkdY15Hv_ydHyOXRM6G0ewVTHkVa1w3Z89AdvSDR=eyi7sQ@mail.gmail.com>
 <11644726.TmP4uu3h4l@ws-stein> <CAFqH_53SSctH9Ms-0Zm5fhEgMtkWq_SP9VChY-QYV-qDLLj_WA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAFqH_53SSctH9Ms-0Zm5fhEgMtkWq_SP9VChY-QYV-qDLLj_WA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo Serra <eballetbo@gmail.com>
Cc: Alexander Stein <alexander.stein@systec-electronic.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 26, 2016 at 11:59 AM, Enric Balletbo Serra
<eballetbo@gmail.com> wrote:
> 2016-10-24 8:13 GMT+02:00 Alexander Stein
> <alexander.stein@systec-electronic.com>:
>> On Monday 24 October 2016 02:53:31, Linus Walleij wrote:
>>> On Fri, Oct 21, 2016 at 5:00 PM, Enric Balletbo i Serra
>>>
>>> <enric.balletbo@collabora.com> wrote:
>>> > Default is without pullups, but if property is specified in DT and the bit
>>> > is set, set a pullup on GPIO-n.
>>> >
>>> > Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>>>
>>> I don't generally like this.
>>>
>
> I tried to use the same approach as used in gpio-twl4030.c because is
> what I knew before. Maybe you can point me to a better approach?

Move the whole driver to a pin control variant:
Documentation/pinctrl.txt

We just did this with the sx150x, see
commit 9e80f9064e73f9f82679884ddf8b03ac3606cf4a
"pinctrl: Add SX150X GPIO Extender Pinctrl Driver"
in linux-next.

However that is a heavy operation. And a lot of upfront work.

If it is really *JUST* this one extra parameter, it's not a super-big
deal, but I do not like to create a plethora of custom attributes
to hack around stuff we already have generic solutions for.

And if it makes sense for clients to specify the pullup, it should
definately be done on the consumer side rather than on the
producer side as these approaches do. For that approach see
commit 69d301fdd19635a39cb2b78e53fdd625b7a27924
"gpio: add DT bindings for existing consumer flags"
commit c663e5f56737757db4d0b317c510ab505f93cecb
"gpio: support native single-ended hardware drivers"

Yours,
Linus Walleij
