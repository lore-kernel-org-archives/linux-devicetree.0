From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] arm: dts: add device_type="memory" for ste-ccu8540
Date: Tue, 22 Apr 2014 15:26:21 +0200
Message-ID: <CACRpkda6+0LyHsqP5J-OTHaau1QPJaJRAup1d3KQq5zu2XC=HA@mail.gmail.com>
References: <1397756521-29387-1-git-send-email-leif.lindholm@linaro.org>
	<1397756521-29387-2-git-send-email-leif.lindholm@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1397756521-29387-2-git-send-email-leif.lindholm@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Leif Lindholm <leif.lindholm@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Patch Tracking <patches@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 17, 2014 at 7:41 PM, Leif Lindholm <leif.lindholm@linaro.org> wrote:

> The current .dts for ste-ccu8540 lacks a 'device_type = "memory"' for
> its memory node, relying on an old ppc quirk in order to discover its
> memory. Add this, to permit that quirk to be made ppc only.
>
> Signed-off-by: Leif Lindholm <leif.lindholm@linaro.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Lee Jones <lee.jones@linaro.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

There are no systems like this deployed so this patch set will not
affect anything in the wild.

Yours,
Linus Walleij
