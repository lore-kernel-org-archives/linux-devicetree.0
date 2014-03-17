From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: davinci: fix gpio selection for OF
Date: Mon, 17 Mar 2014 15:05:05 +0100
Message-ID: <CACRpkdYZMzw31NkA4uSq+ZowzOnZgZthXhZri-eJY2Ozb8aNRQ@mail.gmail.com>
References: <5316FFCE.1060603@ti.com>
	<1394018461-757-1-git-send-email-holler@ahsoftware.de>
	<CACRpkdaF=jc9Z1XZCtH8VPuih01t--qyV-sgH1R_ix0VM4RzVA@mail.gmail.com>
	<5322D529.4070904@ahsoftware.de>
	<CACRpkdaghneo1MvNCfxjTED+sJepHgeZCgmKsRteG9qrBNWAfQ@mail.gmail.com>
	<5326F8C5.5090406@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <5326F8C5.5090406@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Sekhar Nori <nsekhar@ti.com>
Cc: Alexander Holler <holler@ahsoftware.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "davinci-linux-open-source@linux.davincidsp.com" <davinci-linux-open-source@linux.davincidsp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Grygorii Strashko <grygorii.strashko@ti.com>, Prabhakar Lad <prabhakar.csengg@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 17, 2014 at 2:29 PM, Sekhar Nori <nsekhar@ti.com> wrote:

> One thing to note is that this driver is used by keystone too and all
> its users are DT-only. Although I do not see any in-kernel DT GPIO users
> even there.
>
> I can confirm the patch does not break my gpiolib based test module
> (test with and without DT), but then it did not have an issue even before.

Is that a Tested-by tag? :-)

If you're also convinced that fix is safe I'll push it as a fix to v3.14-rcN
if for nothing else so for getting Mr. Holler to stop poking me in the
chest.

Yours,
Linus Walleij
