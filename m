From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2 9/9] ARM: dts: stm32: add initial support of
 stm32mp157c eval board
Date: Thu, 21 Dec 2017 10:18:28 +0100
Message-ID: <CACRpkdYE+u1o_KDDihX7=7RLNDkkFDOCFsQtBKBZW0i6123ZoQ@mail.gmail.com>
References: <1513610272-7824-1-git-send-email-ludovic.Barre@st.com>
 <1513610272-7824-10-git-send-email-ludovic.Barre@st.com> <CACRpkdZaEjdGB2k6HdPt1_E0jRXEimEUxT9NmMwMw7OiyeqGLA@mail.gmail.com>
 <27a339f7-33a7-eb73-27fe-9927838729d6@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <27a339f7-33a7-eb73-27fe-9927838729d6@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Ludovic Barre <ludovic.Barre@st.com>, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Gerald Baeza <gerald.baeza@st.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 20, 2017 at 10:19 AM, Alexandre Torgue
<alexandre.torgue@st.com> wrote:
> On 12/20/2017 08:44 AM, Linus Walleij wrote:

>> gpio-line-names = "foo", "bar" ...;
>>
>> See for example
>> arch/arm/boot/dts/bcm2835-rpi-a.dts
>> arch/arm/boot/dts/ste-snowball.dts
(...)
>
> It looks like useful for pins used as gpio line. Are you saying that we also
> have to describe pins used as Alternate Function ?

No. The use of the names is up to the platform maintainer (you),
leaving a blank string for non-GPIO lines is just fine.

Some platforms add the name of the actual function used by the
line on the design, if it is not GPIO, sometimes something in
brachets like "[i2c0-SDA]" that says what it is used for and explains
why you can't use it for GPIO on this setup.

But just leaving it blank is just as good.

Yours,
Linus Walleij
