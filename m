From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/6] ARM: meson: add meson8 machine definition
Date: Thu, 02 Oct 2014 11:24:54 +0200
Message-ID: <11073411.IcmTkIICYA@wuerfel>
References: <1412198986-26534-1-git-send-email-b.galvani@gmail.com> <1412198986-26534-2-git-send-email-b.galvani@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1412198986-26534-2-git-send-email-b.galvani@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Beniamino Galvani <b.galvani@gmail.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Victor Wan <victor.wan@amlogic.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Carlo Caione <carlo@caione.org>, Jerry Cao <jerry.cao@amlogic.com>
List-Id: devicetree@vger.kernel.org

On Wednesday 01 October 2014 23:29:41 Beniamino Galvani wrote:
> 
> +static const char * const m8_common_board_compat[] = {
> +       "amlogic,meson8",
> +       NULL,
> +};
> +
>  DT_MACHINE_START(AML8726_MX, "Amlogic Meson6 platform")
>         .dt_compat      = m6_common_board_compat,
>  MACHINE_END
>  
> +DT_MACHINE_START(MESON8, "Amlogic Meson8 platform")
> +       .dt_compat      = m8_common_board_compat,
> +MACHINE_END
> 

I'd just add the meson8 string to the m6_common_board_compat list and
rename it.

	Arnd
