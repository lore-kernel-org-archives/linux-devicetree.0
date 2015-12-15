From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 2/2] arm: pxa27x: support for ICP DAS LP-8x4x w/ DT
Date: Tue, 15 Dec 2015 17:32:15 +0100
Message-ID: <7496839.vMjVcqPe8Q@wuerfel>
References: <1449700088-28076-3-git-send-email-ynvich@gmail.com> <1450196875-6739-1-git-send-email-ynvich@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450196875-6739-1-git-send-email-ynvich@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Ianovich <ynvich@gmail.com>
Cc: linux-kernel@vger.kernel.org, Daniel Mack <zonque@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Thierry Reding <treding@nvidia.com>, Jonathan Cameron <jic23@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Arnaud Ebalard <arno@natisbad.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 15 December 2015 19:27:50 Sergei Ianovich wrote:
>  .../devicetree/bindings/vendor-prefixes.txt        |   1 +
>  arch/arm/boot/dts/Makefile                         |   3 +
>  arch/arm/boot/dts/pxa27x-lp8x4x-i105.dts           |  50 ++++
>  arch/arm/boot/dts/pxa27x-lp8x4x.dts                | 259 +++++++++++++++++++++
>  arch/arm/configs/lp8x4x_defconfig                  | 176 ++++++++++++++
> 

I had not noticed earlier that you are adding a new defconfig file. PXA is
already the platform with the most defconfig files, and I'd rather like
to see that reduced than increased.

Is there a chance you could merge this one with some of the existing files
into one configuration that handles them all?

	Arnd
