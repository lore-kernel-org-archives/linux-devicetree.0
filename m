From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] pinctrl: Add SX150X GPIO Extender Pinctrl Driver
Date: Mon, 24 Oct 2016 16:39:17 +0200
Message-ID: <CACRpkdY7vLU4yVP7M-O4rGt_L5cqL57ApmMQJ4aRGgzh3Nat6Q@mail.gmail.com>
References: <1477040998-2016-1-git-send-email-narmstrong@baylibre.com>
 <CAHQ1cqESoRdeHyvP=m=8F_VwiaYL+wbjFoNa6KvWBGfijhcRjg@mail.gmail.com>
 <CACRpkdbwqFRtFN1gx1G7BuFe44mvPyCSeoQ5g9_FR11j_ZO4ug@mail.gmail.com> <CAHQ1cqGLQ=DdhXg1ebkgBbLN8P2P8BEDrGGTx9_r+6=Wy3uUWA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHQ1cqGLQ=DdhXg1ebkgBbLN8P2P8BEDrGGTx9_r+6=Wy3uUWA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>
Cc: Peter Rosin <peda@axentia.se>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Roland Stigge <stigge@antcom.de>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 24, 2016 at 6:51 AM, Andrey Smirnov
<andrew.smirnov@gmail.com> wrote:

> It seem strange to me that the driver uses "handle_edge_irq", given
> how none of the individual interrupts seem to require any ACKing,
> since it is all handled in sx150x_irq_thread_fn(), line 533. More so,
> I had trouble finding who/where sets .irq_ack() callback, which AFAIU
> is mandatory for handle_edge_irq().

Yes that looks strange.

Neil have you tested IRQs with this code?

If there is trouble, please follow up with a fix for the edge handler.
Maybe it should just be handle_simple_irq().

Yours,
Linus Walleij
