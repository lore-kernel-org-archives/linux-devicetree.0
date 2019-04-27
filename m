From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 0/4] Add drive-strength in Meson pinctrl driver
Date: Sat, 27 Apr 2019 21:46:50 +0200
Message-ID: <CAFBinCCgGbvN6nLywsGk3TXT7eDLD=2A=uD_W07QumyBJSCAuQ@mail.gmail.com>
References: <20190418124758.24022-1-glaroque@baylibre.com> <CACRpkdbLJYgU5ZP5CkwX1FBv8eHp+7TsAMv3_H51C_EOA85X4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbLJYgU5ZP5CkwX1FBv8eHp+7TsAMv3_H51C_EOA85X4A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Guillaume La Roque <glaroque@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On Tue, Apr 23, 2019 at 1:13 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Apr 18, 2019 at 2:48 PM Guillaume La Roque
> <glaroque@baylibre.com> wrote:
>
> > The purpose of this patchset is to add drive-strength support in meson pinconf
> > driver. This is a new feature that was added on the g12a. It is critical for us
> > to support this since many functions are failing with default pad drive-strength.
> >
> > The value achievable by the SoC are 0.5mA, 2.5mA, 3mA and 4mA and the DT property
> > 'drive-strength' is expressed in mA.
> > So this patch add another generic property "drive-strength-uA". The change to do so
> > would be minimal and could be benefit to other platforms later on.
> >
> > Cheers
> > Guillaume
>
> This needs to be reviewed by Martin Blumenstigl, Martin can you have a look
> at this patch set? If you don't have the patches I think Guillaume can
> resend them.
thank you for the reminder - I just sent my feedback.
can you please also have a look at patch 4/4? there are two cases
where I'm not sure what the best practice of the pinctrl subsystem is


Regards
Martin
