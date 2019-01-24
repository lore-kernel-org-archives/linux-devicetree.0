From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [linux-sunxi] [PATCH v3 2/2] arm64: dts: allwinner: a64: Enable
 A64 timer workaround
Date: Thu, 24 Jan 2019 18:06:58 +0800
Message-ID: <CAGb2v65H_ZBMFY_c86acSxX96wFC=0_p_H2x+vzio4-ATayHHQ@mail.gmail.com>
References: <20190113021719.46457-1-samuel@sholland.org> <20190113021719.46457-3-samuel@sholland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190113021719.46457-3-samuel@sholland.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Samuel Holland <samuel@sholland.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <Mark.Rutland@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org

On Sun, Jan 13, 2019 at 10:17 AM Samuel Holland <samuel@sholland.org> wrote:
>
> As instability in the architectural timer has been observed on multiple
> devices using this SoC, inluding the Pine64 and the Orange Pi Win,
> enable the workaround in the SoC's device tree.
>
> Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Applied for 5.1.

ChenYu
