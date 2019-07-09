From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [linux,dev-5.1 v1] dt-bindings: gpio: aspeed: Add SGPIO support
Date: Tue, 9 Jul 2019 12:53:12 -0600
Message-ID: <CAL_Jsq+0z4OZ7qbaiUva1v5xCKXpsaPBZ9tj_M4HbEihsU_MfA@mail.gmail.com>
References: <1562184069-22332-1-git-send-email-hongweiz@ami.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1562184069-22332-1-git-send-email-hongweiz@ami.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hongwei Zhang <hongweiz@ami.com>
Cc: devicetree@vger.kernel.org, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-aspeed@lists.ozlabs.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 3, 2019 at 2:01 PM Hongwei Zhang <hongweiz@ami.com> wrote:
>
> Add bindings to support SGPIO on AST2400 or AST2500.
>
> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> ---
>  .../devicetree/bindings/gpio/sgpio-aspeed.txt      | 36 ++++++++++++++++++++++

Is this SGPIO as in the blinky lights for HDDs in servers? If so, that
has nothing to do with Linux GPIO subsystem.

BTW, You might want to look at Calxeda highbank SATA driver. It has a
bit-banged SGPIO interface using GPIO lines in it.


Rob
