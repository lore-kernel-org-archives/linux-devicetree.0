From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PULL v2] ARM: DTS: Fix broken GICv2 register maps
Date: Tue, 7 Feb 2017 15:07:34 +0100
Message-ID: <CAK8P3a24sZHmEUFrqXO1khSTtGgsqO73f37RXaiqMjj_f=Nypg@mail.gmail.com>
References: <1485766389-30811-1-git-send-email-marc.zyngier@arm.com>
 <20170131050648.GB16560@localhost> <86zii77eib.fsf@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <86zii77eib.fsf@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <antoine.tenart@free-electrons.com>, Russell King <linux@armlinux.org.uk>, Beno??t Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio
List-Id: devicetree@vger.kernel.org

On Tue, Jan 31, 2017 at 10:41 AM, Marc Zyngier <marc.zyngier@arm.com> wrote:
> On Tue, Jan 31 2017 at 05:06:48 AM, Olof Johansson <olof@lixom.net> wrote:
>
>> Care to respin? Or I can just pick over the patches, as long as you
>> don't need them as a stable base somewhere else.
>
> If that works for you, please cherry pick the patches. I don't need them
> to be based on anything in particular.
>

Applied both to next/dt now, thanks for the cleanup!

     Arnd
