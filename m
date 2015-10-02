From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] tps65912: Cleanup TPS65912 subdevice configuration dependencies
Date: Fri, 2 Oct 2015 03:23:12 -0700
Message-ID: <CACRpkdZ4f7g8AWpZgEGrV15Mtx1m_O8WwAXFhyJTPRCMQBps3A@mail.gmail.com>
References: <1442339861-30300-1-git-send-email-afd@ti.com>
	<1442339861-30300-4-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1442339861-30300-4-git-send-email-afd@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 15, 2015 at 10:57 AM, Andrew F. Davis <afd@ti.com> wrote:

> The TPS65912 subdevices depend on the mfd core and not any particular
> interface. The core is only enabled by enabling an interface so this
> is safe.
>
> Signed-off-by: Andrew F. Davis <afd@ti.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

I assume Lee will merge this into the MFD tree.

Yours,
Linus Walleij
