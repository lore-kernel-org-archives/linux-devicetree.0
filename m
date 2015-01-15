From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/4] gpio: max732x: Fix possible deadlock
Date: Thu, 15 Jan 2015 18:04:16 +0100
Message-ID: <CACRpkdY9iV8_2BX7fSkkdKFmP3d8QjHATMLfHdP9-oindRWrnw@mail.gmail.com>
References: <1421156505-16600-1-git-send-email-semen.protsenko@globallogic.com>
	<1421156505-16600-4-git-send-email-semen.protsenko@globallogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1421156505-16600-4-git-send-email-semen.protsenko@globallogic.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Semen Protsenko <semen.protsenko@globallogic.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Mark Rutland <mark.rutland@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Marc Zyngier <maz@misterjones.org>, Grygorii Strashko <grygorii.strashko@globallogic.com>, Illia Smyrnov <illia.smyrnov@globallogic.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 13, 2015 at 2:41 PM, Semen Protsenko
<semen.protsenko@globallogic.com> wrote:

> This patch was derived from next one:
> "gpio: fix pca953x set_type 'scheduling while atomic' bug".
>
> After adding entry that consumes max732x GPIO as interrupt line to dts
> file, deadlock appears somewhere in max732x probe function.

Patch applied.

Yours,
Linus Walleij
