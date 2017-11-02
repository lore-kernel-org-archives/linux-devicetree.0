From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v7 2/2] bus: add driver for the Technologic Systems NBUS
Date: Thu, 2 Nov 2017 16:57:55 +0100
Message-ID: <CACRpkdZajBx0xano2f6art=ROtwysAAVW_9FnCO39+XEfYbwGg@mail.gmail.com>
References: <20171101171433.14445-1-sebastien.bourdelin@savoirfairelinux.com>
 <20171101171433.14445-2-sebastien.bourdelin@savoirfairelinux.com>
 <CACRpkdY4Y9g2PAXbt11e3mSzJk2Bri4WNXm-5dQ2iyTegBNYVw@mail.gmail.com> <b7a79314-66ff-6f09-6e53-aa548286b962@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b7a79314-66ff-6f09-6e53-aa548286b962@savoirfairelinux.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel <kernel@savoirfairelinux.com>, Rob Herring <robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>, Fabio Estevam <fabio.estevam@nxp.com>, Mark Featherston <mark@embeddedarm.com>, kris@embeddedarm.com
List-Id: devicetree@vger.kernel.org

On Thu, Nov 2, 2017 at 3:37 PM, Sebastien Bourdelin
<sebastien.bourdelin@savoirfairelinux.com> wrote:

>> BTW do you have a way upstream for this patch? ARM SoC?
>
> Honestly i have no idea, do you have a recommandation for this kind of
> bus driver? should i re-submit just this patch to a specific tree?

If this is for an ARM system I would suggest that you just sent
the patches to arm@kernel.org with CC to the linux-arm-kernel
mailing list and ask the ARM SoC maintainers to apply them directly
for the upstream kernel.

Yours,
Linus Walleij
