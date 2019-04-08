From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] arm64: dts: qcom: Add Lenovo Miix 630
Date: Mon, 8 Apr 2019 12:03:49 +0100
Message-ID: <20190408110348.GF6139@lakrids.cambridge.arm.com>
References: <20190326185525.20781-1-jeffrey.l.hugo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190326185525.20781-1-jeffrey.l.hugo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: bjorn.andersson@linaro.org, andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, lee.jones@linaro.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 26, 2019 at 11:55:25AM -0700, Jeffrey Hugo wrote:
> This adds the initial DT for the Lenovo Miix 630 laptop.  Supported
> functionality includes USB (host), microSD-card, keyboard, and trackpad.

I was under the impression that the Miix 630 came with Windows, and the
firmware therefore provided (as least a simulacrum of) ACPI. Why do we
need a DT?

[...]

> +++ b/arch/arm64/boot/dts/qcom/msm8998-cls.dtsi
> @@ -0,0 +1,278 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (c) 2019, Jeffrey Hugo. All rights reserved. */
> +
> +/*
> + * Common include for MSM8998 clamshell (cls) devices, ie the Lenovo Miix 630,
> + * Asus NovaGo TP370QL, and HP Envy x2.  All three devices are basically the
> + * same, with differences in peripherals.
> + */

I think it would be better to consistently use "clamshell" (e.g. rename
this to msm8998-clamshell.dtsi), and mention the "cls" terminology in
the comment if that's necessary.

[...]

> +	keyboard@3a {
> +		/* QTEC0001 is the ACPI HID, which could be used for quirks */
> +		compatible = "QTEC0001", "hid-over-i2c";

Please give this a real compatible string rather than forcing the ACPI
HID in.

Thanks,
Mark.
