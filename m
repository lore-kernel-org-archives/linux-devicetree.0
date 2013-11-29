From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 0/6] gpio: daVinci: cleanup and feature enhancement
Date: Fri, 29 Nov 2013 08:47:55 +0100
Message-ID: <CACRpkdYvNwF+dxfiLCHpCL+Ze17PMAMkJo4s-4T4ku1KxDPXxw@mail.gmail.com>
References: <1385057731-4348-1-git-send-email-prabhakar.csengg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1385057731-4348-1-git-send-email-prabhakar.csengg@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Prabhakar Lad <prabhakar.csengg@gmail.com>
Cc: Sekhar Nori <nsekhar@ti.com>, Grygorii Strashko <grygorii.strashko@ti.com>, LKML <linux-kernel@vger.kernel.org>, DLOS <davinci-linux-open-source@linux.davincidsp.com>, LAK <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 21, 2013 at 7:15 PM, Prabhakar Lad
<prabhakar.csengg@gmail.com> wrote:

> From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
>
> This patch series does the following
> 1> Ports the driver to use irqdomain.
> 2> Adds dt binding support for gpio-davinci.
> 3> Adds DA850 dt support goio.
>
> Changes for v6:
> 1: GPIO driver now migrated to irq domain legacy.
> 2: Fixed review comments pointed by Grygorii.
> 3: Included Ack's.

This series is looking nice, I assume that Sekhar will take this through
the DaVinci tree once he's happy with it. I think I've ACKed all relevant
patches, else tell me.

Yours,
Linus Walleij
