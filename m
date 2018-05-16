From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v7 3/3] pinctrl: bcm2835: Add support for output-low
 output-high properties
Date: Wed, 16 May 2018 14:02:15 +0200
Message-ID: <CACRpkdaz01EPL2JBzuXW=qmi68u3oPwGHZcXyZsQAExgxkxD2A@mail.gmail.com>
References: <1525030092-3643-3-git-send-email-matheus@castello.eng.br>
 <1525135334-28506-1-git-send-email-matheus@castello.eng.br> <1525135334-28506-3-git-send-email-matheus@castello.eng.br>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525135334-28506-3-git-send-email-matheus@castello.eng.br>
Sender: linux-kernel-owner@vger.kernel.org
To: Matheus Castello <matheus@castello.eng.br>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Eric Anholt <eric@anholt.net>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 1, 2018 at 2:42 AM, Matheus Castello
<matheus@castello.eng.br> wrote:

> Properties to set initial value of pin output buffer.
> This can be useful for configure hardware in overlay files, and in early
> boot for checking it states in QA sanity tests.
>
> Signed-off-by: Matheus Castello <matheus@castello.eng.br>
> Reviewed-by: Eric Anholt <eric@anholt.net>

Patch applied with Stefan's ACK.

Yours,
Linus Walleij
