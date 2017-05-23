From: Dong Aisheng <dongas86@gmail.com>
Subject: Re: [PATCH v5 01/10] pinctrl: generic: Add bi-directional and output-enable
Date: Tue, 23 May 2017 18:08:31 +0800
Message-ID: <CAA+hA=Q9hwe7_xL440Reoi7z7m8-SScZ5E057419KSA7dQK=tQ@mail.gmail.com>
References: <1493281194-5200-2-git-send-email-jacopo+renesas@jmondi.org>
 <CAHp75Vcy1OE+9htFx9k3kQhGARQPT1C0gg3SEKZd7ULu_vkUMA@mail.gmail.com>
 <CACRpkdayW0qPXDcc_JofkwtX5UHhDPxiY_8deZZ7+hPNJkjgeQ@mail.gmail.com>
 <SG2PR06MB1165E7E651BE96CD7B7738B08A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAHp75Vcp_eMWrjZRX-x3=Tt3JRXcL_wWG43MymF=oyLLP4EJwg@mail.gmail.com>
 <SG2PR06MB11658EC3A3A80C57E6F539AC8A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAHp75VeLtOuty=iaxuCaH43rnBZDTT03iH7JyjDJBQhTD-EjzA@mail.gmail.com>
 <CACRpkdZkNGSUvTrEdjbGKO1hr799QpJBGSHPVbsBibph7Jx61A@mail.gmail.com>
 <20170508160120.GB25206@w540> <CAHp75VfOMKOhpkec+htA6DRQhivpSmNXy1=Ayig1W+ZC84gTLw@mail.gmail.com>
 <20170508172516.GC25206@w540> <CACRpkdY1h+yfFuk2y9=nZqqvW9=G33_eHCisvuMkJ5b3zizY7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdY1h+yfFuk2y9=nZqqvW9=G33_eHCisvuMkJ5b3zizY7Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: jmondi <jacopo@jmondi.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Chris Brandt <Chris.Brandt@renesas.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 9, 2017 at 5:19 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Mon, May 8, 2017 at 7:25 PM, jmondi <jacopo@jmondi.org> wrote:
>
>> From my perspective these flags are configurations internal to the pin
>> controller hardware used to enable/disable input buffers when a pin needs to
>> perform in both direction.
>> The level of detail I can provide on this is the logical diagram we have pointed
>> you to already.
>>
>> As I assume you are trying to get this answer from us in order to
>> avoid duplicating things in pin controller sub-system, and I
>> understand this, but my question here was "can we have those flags as part
>> of the pinmux property argument list, as that property description
>> seems to allow us to do that, instead of making them generic pin
>> configuration properties and upset other developers?"
>
> Pinmux with all it's magic flags baked into one is not any better
> or any more readable. The solution is already very pretty except
> for these two flags which I am sure we can agree on a way forward
> for.
>
> What we choose between is not this or another less transparent
> pin configuration mechanism, the mechanism (whether magic bits
> to pinmux or reasonable properties) does not matter.
>
> There is a strong preference to use the generic bindings.
>
> So the discussion is whether to use:
>
> bi-directional;
> output-enable;
>
> Or some already defined config flags.
>
> If these are too idiomatic to be used by others, they should anyways
> look similar, like:
>
> renesas,bi-directional;
> renesas,output-enable;
>
> Like the Qualcomm weirdness found in drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
>
> qcom,pull-up-strength = <..>;
>
> Check how they use
> #define PMIC_GPIO_CONF_PULL_UP                 (PIN_CONFIG_END + 1)
>
> Etc.
>
>> Anyway, I still fail to see why those configuration flags, only
>> affecting the way the pin controller hardware enables/disables
>> its internal buffers and its internal operations have to be
>> described in term of their externally visible electrically characteristics.
>
> To me internal vs external is not what matters. What matters is
> if this is likely to pop up in more platforms, and then the property
> should be generic.
>
> The generic pin config definitions are likely to be picked up by other
> standards and even be inspiration to hardware engineers so that
> is why it matters so much.
>
>> To me, what already exists are pin configuration properties generic to
>> the whole pin controller subsystem, and I understand you don't want to
>> see duplication there.
>>
>> At the same time, to me, those flags are settings the pin controller
>> wants to have specified by software to overcome its hw design flaws,
>> and are intended to configure its internal buffers in a way it cannot
>> do by itself for some very specific operation modes (they are listed
>> in the hw reference manual, it's not something you can chose to
>> configure or not, if you want a pin working in i2c mode, you HAVE to
>> pass those flags to pin controller).
>
> Sounds like a case for
>
> renesas,bi-directional;
> renesas,output-enable;
>
> following the Qualcomm pattern in that case.
>
> But let's see if something else comes out of this discussion.
>

I did not follow too much.
But it seems IMX7ULP/Vybrid to be also a fan of generic
output-enable/input-enable
property.

See:
Figure 5-2. GPIO PAD in Page 241
http://www.nxp.com/assets/documents/data/en/reference-manuals/VFXXXRM.pdf

It has separate register bits to control input buffer enable and
output buffer enable
and we need set it property for GPIO function.

Regards
Dong Aisheng
