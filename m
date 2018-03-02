From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] gpio: Add Spreadtrum EIC driver support
Date: Fri, 2 Mar 2018 13:40:08 +0100
Message-ID: <CACRpkdY2CZHBc_646Q+LJPXYHca+TYxH=pL707t2DHE0gg7kLA@mail.gmail.com>
References: <334505d3a13a73ad347427b408ed581832434289.1519468782.git.baolin.wang@linaro.org>
 <2e9852f21fcc6213bdb1cef0c473b9d002ad5670.1519468782.git.baolin.wang@linaro.org>
 <CACRpkdY8hcNYASBFJewVfpiukT+AAR-5WZb0uaJws0B025+GJw@mail.gmail.com> <CAMz4kuJe=joBCzF=SnGEKZhWZANT5uDycb7OtJ+zy=LM+8PLVw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMz4kuJe=joBCzF=SnGEKZhWZANT5uDycb7OtJ+zy=LM+8PLVw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Baolin Wang <baolin.wang@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 2, 2018 at 11:48 AM, Baolin Wang <baolin.wang@linaro.org> wrote:
> On 2 March 2018 at 17:53, Linus Walleij <linus.walleij@linaro.org> wrote:

>> This is looking nice!
>>
>> I guess we agreed with the input maintainer that what
>> needs to happen is to implement edge trigger emulation
>> for all variants in the driver, test it with the keys and
>> then we should be done.
>
> I want to send one separate patch to implement edge trigger emulation
> for EIC drivers, since we can have some talks for the implementation.
> If there are no other issues for this patch set, I will send out the
> V3 after fixing the issues in patch 3 pointed by Andy. Is it OK?

OK go for it.

Yours,
Linus Walleij
