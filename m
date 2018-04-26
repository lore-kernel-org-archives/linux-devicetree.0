From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 3/3] pinctrl: bcm2835: Add support for output-low
 output-high properties
Date: Thu, 26 Apr 2018 14:25:16 +0200
Message-ID: <CACRpkdaH6kgbM+3UHVJ_JfKZ367XXRhSjXhvsZ-8b0Ovbkpmew@mail.gmail.com>
References: <f500b25c-eea0-9f01-7d7b-5a9dd90c50fa@castello.eng.br>
 <1523422726-7910-1-git-send-email-matheus@castello.eng.br> <1523422726-7910-4-git-send-email-matheus@castello.eng.br>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1523422726-7910-4-git-send-email-matheus@castello.eng.br>
Sender: linux-kernel-owner@vger.kernel.org
To: Matheus Castello <matheus@castello.eng.br>
Cc: Rob Herring <robh@kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>, Eric Anholt <eric@anholt.net>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 11, 2018 at 6:58 AM, Matheus Castello
<matheus@castello.eng.br> wrote:

> Properties to set initial value of pin output buffer.
> This can be useful for configure hardware in overlay files, and in early boot
> for checking it states in QA sanity tests.
>
> Signed-off-by: Matheus Castello <matheus@castello.eng.br>

Will apply this when I apply 2/3.

You only need to resend patch 2+3.

Yours,
Linus Walleij
