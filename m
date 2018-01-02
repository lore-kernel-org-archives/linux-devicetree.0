From: Mathieu Malaterre <malat@debian.org>
Subject: Re: [PATCH v5 15/15] MIPS: ingenic: Initial GCW Zero support
Date: Tue, 2 Jan 2018 18:04:12 +0100
Message-ID: <CA+7wUsw0+dsvmY3wCq=VcfRsovhPPLEJjyEwV5pYUWLcC3i2dA@mail.gmail.com>
References: <20180102150848.11314-1-paul@crapouillou.net> <20180102150848.11314-15-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20180102150848.11314-15-paul@crapouillou.net>
Sender: linux-clk-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Ralf Baechle <ralf@linux-mips.org>, Maarten ter Huurne <maarten@treewalker.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 2, 2018 at 4:08 PM, Paul Cercueil <paul@crapouillou.net> wrote:
> The GCW Zero (http://www.gcw-zero.com) is a retro-gaming focused
> handheld game console, successfully kickstarted in ~2012, running Linux.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  arch/mips/boot/dts/ingenic/Makefile |  1 +
>  arch/mips/boot/dts/ingenic/gcw0.dts | 61 +++++++++++++++++++++++++++++++++++++
>  arch/mips/configs/gcw0_defconfig    | 27 ++++++++++++++++
>  arch/mips/jz4740/Kconfig            |  4 +++
>  arch/mips/jz4740/boards.c           |  1 +
>  5 files changed, 94 insertions(+)
>  create mode 100644 arch/mips/boot/dts/ingenic/gcw0.dts
>  create mode 100644 arch/mips/configs/gcw0_defconfig
>
>  v2: No change
>  v3: No change
>  v4: No change
>  v5: Use SPDX license identifier
>      Drop custom CROSS_COMPILE from defconfig

Thanks for removing CROSS_COMPILE.

Acked-by: Mathieu Malaterre <malat@debian.org>
