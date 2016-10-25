From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v3] pinctrl: Add SX150X GPIO Extender Pinctrl Driver
Date: Tue, 25 Oct 2016 08:57:08 +0200
Message-ID: <580F0244.7070701@baylibre.com>
References: <1477040998-2016-1-git-send-email-narmstrong@baylibre.com> <CAHQ1cqESoRdeHyvP=m=8F_VwiaYL+wbjFoNa6KvWBGfijhcRjg@mail.gmail.com> <CACRpkdbwqFRtFN1gx1G7BuFe44mvPyCSeoQ5g9_FR11j_ZO4ug@mail.gmail.com> <CAHQ1cqGLQ=DdhXg1ebkgBbLN8P2P8BEDrGGTx9_r+6=Wy3uUWA@mail.gmail.com> <CACRpkdY7vLU4yVP7M-O4rGt_L5cqL57ApmMQJ4aRGgzh3Nat6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdY7vLU4yVP7M-O4rGt_L5cqL57ApmMQJ4aRGgzh3Nat6Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Peter Rosin <peda@axentia.se>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Roland Stigge <stigge@antcom.de>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
List-Id: devicetree@vger.kernel.org

Hi Linus,

Le 24/10/2016 16:39, Linus Walleij a écrit :
> On Mon, Oct 24, 2016 at 6:51 AM, Andrey Smirnov
> <andrew.smirnov@gmail.com> wrote:
> 
>> It seem strange to me that the driver uses "handle_edge_irq", given
>> how none of the individual interrupts seem to require any ACKing,
>> since it is all handled in sx150x_irq_thread_fn(), line 533. More so,
>> I had trouble finding who/where sets .irq_ack() callback, which AFAIU
>> is mandatory for handle_edge_irq().
> 
> Yes that looks strange.
> 
> Neil have you tested IRQs with this code?

To be frank, I took the IRQ code from the GPIO driver verbatim, and only tested
a simple use case on beagle bone black.
The interrupt code is very complex and sincerely I was not able to understand
clearly how it worked.

The IRQ_TYPE_EDGE_BOTH did work for me since the BBB irq controller dealt with it.

I will dig in the datasheet and run more uses cases next week, but since the
code hasn't changed since the GPIO driver, so this is a nice to have !

> 
> If there is trouble, please follow up with a fix for the edge handler.
> Maybe it should just be handle_simple_irq().
> 
> Yours,
> Linus Walleij
> 

Andrey, can we talk over irc somehow ? I'm idling as narmstrong on freenode.

Neil
