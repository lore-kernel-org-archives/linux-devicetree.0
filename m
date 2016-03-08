From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/5] ARM: bcm2835: Move most RPi default pin groups to
 their devices.
Date: Tue, 8 Mar 2016 15:25:55 +0700
Message-ID: <CACRpkdYCe_iOLEae1NP=xFLRvXXsMEUguLxj9n8Udf=ZuOFmFw@mail.gmail.com>
References: <1456510756-15337-1-git-send-email-eric@anholt.net>
	<1456510756-15337-6-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1456510756-15337-6-git-send-email-eric@anholt.net>
Sender: linux-gpio-owner@vger.kernel.org
To: Eric Anholt <eric@anholt.net>
Cc: linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>
List-Id: devicetree@vger.kernel.org

On Sat, Feb 27, 2016 at 1:19 AM, Eric Anholt <eric@anholt.net> wrote:

> This way we can get the duplicated pin group definitions out of each
> RPi board file, and just leave the i2s variations in them.
>
> Signed-off-by: Eric Anholt <eric@anholt.net>

Aha I speak too soon I see. This set of patches look fine to
me but you need to address Stephens comments and obtain his
ACK.

Yours,
Linus Walleij
