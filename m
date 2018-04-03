From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v5 04/13] ARM: dts: sun8i: Add CPUCFG device node for A83T dtsi
Date: Tue, 3 Apr 2018 14:45:26 +0800
Message-ID: <CAGb2v64kkm5qNNi-BD55nYUn9e=tfJZ8fKhJrs=mB=fMWrRBcA@mail.gmail.com>
References: <20180403061836.3926-1-mylene.josserand@bootlin.com> <20180403061836.3926-5-mylene.josserand@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180403061836.3926-5-mylene.josserand@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Myl=C3=A8ne_Josserand?= <mylene.josserand@bootlin.com>
Cc: Russell King <linux@armlinux.org.uk>, Maxime Ripard <maxime.ripard@bootlin.com>, Marc Zyngier <marc.zyngier@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>, LABBE Corentin <clabbe.montjoie@gmail.com>, quentin.schulz@bootlin.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 3, 2018 at 2:18 PM, Mylène Josserand
<mylene.josserand@bootlin.com> wrote:
> As we found in sun9i-a80, CPUCFG is a collection of registers that are
> mapped to the SoC's signals from each individual processor core and
> associated peripherals.
>
> These registers are used for SMP bringup and CPU hotplugging.
>
> Signed-off-by: Mylène Josserand <mylene.josserand@bootlin.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
