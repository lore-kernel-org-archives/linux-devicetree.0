From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 01/10] pinctrl: generic: Add bi-directional and output-enable
Date: Mon, 29 May 2017 10:45:44 +0200
Message-ID: <CACRpkdYcaGzSvAN2Trqwer+8GbqXyfpE=VqiYcQvCOqhDO9MMw@mail.gmail.com>
References: <SG2PR06MB1165E7E651BE96CD7B7738B08A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAHp75Vcp_eMWrjZRX-x3=Tt3JRXcL_wWG43MymF=oyLLP4EJwg@mail.gmail.com>
 <SG2PR06MB11658EC3A3A80C57E6F539AC8A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAHp75VeLtOuty=iaxuCaH43rnBZDTT03iH7JyjDJBQhTD-EjzA@mail.gmail.com>
 <CACRpkdZkNGSUvTrEdjbGKO1hr799QpJBGSHPVbsBibph7Jx61A@mail.gmail.com>
 <20170508160120.GB25206@w540> <CAHp75VfOMKOhpkec+htA6DRQhivpSmNXy1=Ayig1W+ZC84gTLw@mail.gmail.com>
 <20170508172516.GC25206@w540> <CACRpkdY1h+yfFuk2y9=nZqqvW9=G33_eHCisvuMkJ5b3zizY7Q@mail.gmail.com>
 <CAA+hA=Q9hwe7_xL440Reoi7z7m8-SScZ5E057419KSA7dQK=tQ@mail.gmail.com> <20170523183735.GC13664@w540>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170523183735.GC13664@w540>
Sender: linux-kernel-owner@vger.kernel.org
To: jmondi <jacopo@jmondi.org>
Cc: Dong Aisheng <dongas86@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Chris Brandt <Chris.Brandt@renesas.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 23, 2017 at 8:37 PM, jmondi <jacopo@jmondi.org> wrote:

>> I did not follow too much.
>> But it seems IMX7ULP/Vybrid to be also a fan of generic
>> output-enable/input-enable
>> property.
>>
>> See:
>> Figure 5-2. GPIO PAD in Page 241
>> http://www.nxp.com/assets/documents/data/en/reference-manuals/VFXXXRM.pdf
>>
>> It has separate register bits to control input buffer enable and
>> output buffer enable
>> and we need set it property for GPIO function.
>
> As it seems we have another user for 'output-enable' here, what if we just
> add that one to the generic bindings properties list, and we keep
> 'bi-directional' (which seems to be the most debated property we have
> added) out of generic properties?
>
> We can handle 'bi-directional' pins with static tables in our pin
> controller driver and not have it anywhere in DT.

This sounds like a viable approach.

I just want to know if "output-enable" is the right name?
"output-buffer-enable"?

> I see commit 42d5a11200d0[1] has not been reverted yet as Andy asked
> in some previous email.

I'm just overloaded. I sent that revert to Torvalds today.

> I can send another version of that patch with
> only 'output-enable' if you wish.

That's what we want.

> Once we reach consesus, I can then send v6 of our pin controller driver
> based on that.

OK sounds like a plan.

Sorry for the mess, I'm just trying to get this right :/

Yours,
Linus Walleij
