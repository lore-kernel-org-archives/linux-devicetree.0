From: Dong Aisheng <dongas86@gmail.com>
Subject: Re: [PATCH v5 01/10] pinctrl: generic: Add bi-directional and output-enable
Date: Fri, 9 Jun 2017 15:26:57 +0800
Message-ID: <CAA+hA=T56WHugmA+5V5ZC6TTxeSUVt1hr0v53YuDsUYgBcvKTw@mail.gmail.com>
References: <SG2PR06MB11658EC3A3A80C57E6F539AC8A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAHp75VeLtOuty=iaxuCaH43rnBZDTT03iH7JyjDJBQhTD-EjzA@mail.gmail.com>
 <CACRpkdZkNGSUvTrEdjbGKO1hr799QpJBGSHPVbsBibph7Jx61A@mail.gmail.com>
 <20170508160120.GB25206@w540> <CAHp75VfOMKOhpkec+htA6DRQhivpSmNXy1=Ayig1W+ZC84gTLw@mail.gmail.com>
 <20170508172516.GC25206@w540> <CACRpkdY1h+yfFuk2y9=nZqqvW9=G33_eHCisvuMkJ5b3zizY7Q@mail.gmail.com>
 <CAA+hA=Q9hwe7_xL440Reoi7z7m8-SScZ5E057419KSA7dQK=tQ@mail.gmail.com>
 <20170523183735.GC13664@w540> <CACRpkdYcaGzSvAN2Trqwer+8GbqXyfpE=VqiYcQvCOqhDO9MMw@mail.gmail.com>
 <20170529104229.GB21347@w540>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170529104229.GB21347@w540>
Sender: linux-gpio-owner@vger.kernel.org
To: jmondi <jacopo@jmondi.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Chris Brandt <Chris.Brandt@renesas.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Linus & j,

On Mon, May 29, 2017 at 6:42 PM, jmondi <jacopo@jmondi.org> wrote:
> Hi Linus,
>
> On Mon, May 29, 2017 at 10:45:44AM +0200, Linus Walleij wrote:
>> On Tue, May 23, 2017 at 8:37 PM, jmondi <jacopo@jmondi.org> wrote:
>>
>> >> I did not follow too much.
>> >> But it seems IMX7ULP/Vybrid to be also a fan of generic
>> >> output-enable/input-enable
>> >> property.
>> >>
>> >> See:
>> >> Figure 5-2. GPIO PAD in Page 241
>> >> http://www.nxp.com/assets/documents/data/en/reference-manuals/VFXXXRM.pdf
>> >>
>> >> It has separate register bits to control input buffer enable and
>> >> output buffer enable
>> >> and we need set it property for GPIO function.
>> >
>> > As it seems we have another user for 'output-enable' here, what if we just
>> > add that one to the generic bindings properties list, and we keep
>> > 'bi-directional' (which seems to be the most debated property we have
>> > added) out of generic properties?
>> >
>> > We can handle 'bi-directional' pins with static tables in our pin
>> > controller driver and not have it anywhere in DT.
>>
>> This sounds like a viable approach.
>>
>> I just want to know if "output-enable" is the right name?
>> "output-buffer-enable"?
>
> Great! Thanks!
>
> On naming: if we need "output-buffer-enable" should we add
> "input-buffer-enable" as well?
>
> Currently we are using "input-enable" to pair with "output-enable",
> but as you said, just "output-enable" when "output-high" and
> "output-low" are there already seems a bit confusing.
> At the same time "input-buffer-enable" seems to actually be just
> electrically equivalent to "input-enable", so adding it is a bit of a
> waste as well.
>
> I see three options here:
>
> 1) Add "output-buffer-enable" and "input-buffer-enable"
> we end up with
> "output-high"
> "output-low"
> "input-enable"
> "output-buffer-enable"
> "input-buffer-enable"
>
> 2) Add "output-buffer-enable" only
> we end up with
> "output-high"
> "output-low"
> "input-enable"
> "output-buffer-enable"
>
> Binding may be confusing as in one case we use "output-buffer-enable"
> while in the other "input-enable"
>
> 3) Add "output-enable" only
> "output-high"
> "output-low"
> "input-enable"
> "output-enable"
>
> As you, I don't like "output-enable" that much but it pairs better with
> "input-enable".
>
> I'll let you and DT people decide on this, as it's really an ABI definition
> problem and you have better judgment there.
>

What's the final decision of this?

I saw the following revert patch in pinctrl-next but did not see a successive
patch to add output-enable back?

IMX7ULP pinctrl driver is pending on this because it needs use both
input-enable and output-enable if we want to make them generic property.

commit b4d2ea2af95cb77e2f320e24da526280d4aa2f6b
Author: Linus Walleij <linus.walleij@linaro.org>
Date:   Mon May 8 10:48:21 2017 +0200

    Revert "pinctrl: generic: Add bi-directional and output-enable"

    This reverts commit 8c58f1a7a4b6d1d723bf25fef9d842d5a11200d0.

    It turns out that applying these generic properties was
    premature: the properties used in the driver using this
    are of unclear electrical nature and the subject need to
    be discussed.

    Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Regards
Dong Aisheng

>>
>> > I see commit 42d5a11200d0[1] has not been reverted yet as Andy asked
>> > in some previous email.
>>
>> I'm just overloaded. I sent that revert to Torvalds today.
>
> Thank you. Didn't want to put pressure ;)
>>
>> > I can send another version of that patch with
>> > only 'output-enable' if you wish.
>>
>> That's what we want.
>>
>> > Once we reach consesus, I can then send v6 of our pin controller driver
>> > based on that.
>>
>> OK sounds like a plan.
>>
>> Sorry for the mess, I'm just trying to get this right :/
>
> Not a mess, and thanks for your effort in maintaining  all of this
>
> Thanks
>    j
>>
>> Yours,
>> Linus Walleij
