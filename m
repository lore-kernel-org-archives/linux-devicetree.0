From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v5 01/13] ARM: move cputype definitions into another file
Date: Tue, 3 Apr 2018 14:52:45 +0800
Message-ID: <CAGb2v64GL=1UcYs1tFp-mS07vbHBao82SEhyzUrUHB++2-EKBg@mail.gmail.com>
References: <20180403061836.3926-1-mylene.josserand@bootlin.com> <20180403061836.3926-2-mylene.josserand@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180403061836.3926-2-mylene.josserand@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Myl=C3=A8ne_Josserand?= <mylene.josserand@bootlin.com>
Cc: Russell King <linux@armlinux.org.uk>, Maxime Ripard <maxime.ripard@bootlin.com>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>, LABBE Corentin <clabbe.montjoie@gmail.com>, quentin.schulz@bootlin.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 3, 2018 at 2:18 PM, Mylène Josserand
<mylene.josserand@bootlin.com> wrote:
> To add the support for SMP on sun8i-a83t, we will use some
> definitions in an assembly file so move definitions into
> another file to separate C functions and macro defintions.

Instead of moving the definitions, you could guard all the C
stuff in "#ifndef __ASSEMBLY__". AFAIK a few header files do that.

ChenYu

> Signed-off-by: Mylène Josserand <mylene.josserand@bootlin.com>
> ---
>  arch/arm/include/asm/cputype.h     | 94 +-----------------------------------
>  arch/arm/include/asm/cputype_def.h | 98 ++++++++++++++++++++++++++++++++++++++
