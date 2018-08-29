From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 0/8] pinctrl-ingenic GPIO merge + JZ4725B
Date: Wed, 29 Aug 2018 13:42:39 +0200
Message-ID: <CACRpkdabymwty1pLDgwUzf4eScN4ECfZ_zDKRSfYXxhq52-FYA@mail.gmail.com>
References: <20180821164236.21101-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180821164236.21101-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, od@zcrc.me, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 21, 2018 at 6:42 PM Paul Cercueil <paul@crapouillou.net> wrote:

> I created a V2 to address the issue that Rob's bot reported.
> The dt-bindings doc changes were moved to their own patch [1/8].
>
> The only other change is that I dropped the "ingenic,jz4725b-pinctrl"
> compatible string as it does not provide any functional difference.

I have queued these patches in the pinctrl tree on an immutable
branch "ib-ingenic" added a small patch of my own on top (include
file) and pulled into devel for both pinctrl and GPIO.

Very nice work!

Yours,
Linus Walleij
