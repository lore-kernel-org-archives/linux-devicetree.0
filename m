From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: clk: add documentation for the SiFive PRCI
 driver
Date: Tue, 06 Nov 2018 09:33:32 -0800
Message-ID: <154152561238.88331.13239370518226908068@swboyd.mtv.corp.google.com>
References: <20181020135024.28573-1-paul.walmsley@sifive.com>
 <20181020135024.28573-3-paul.walmsley@sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181020135024.28573-3-paul.walmsley@sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@sifive.com>, Megan Wachs <megan@sifive.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Paul Walmsley <paul@pwsan.com>
List-Id: devicetree@vger.kernel.org

Quoting Paul Walmsley (2018-10-20 06:50:23)
> diff --git a/Documentation/devicetree/bindings/clock/sifive/fu540-prci.tx=
t b/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
> new file mode 100644
> index 000000000000..d7c1e83fa5ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
> @@ -0,0 +1,43 @@
> +SiFive FU540 PRCI bindings
> +
> +On the FU540 family of SoCs, most system-wide clock and reset integration
> +is via the PRCI IP block.
> +
> +Required properties:
> +- compatible: Should be "sifive,<chip>-prci<version>".  As of the time t=
his
> +              file was written, only one value is supported:

I don't think we need the "As of the time" sentence. It will become out
of date almost immediately so why not just say "The list of supported
values is:"?

> +             "sifive,fu540-c000-prci0"
> +- reg: Should describe the PRCI's register target physical address region
> +- clocks: Should point to the hfclk device tree node and the rtcclk
> +          device tree node.  The RTC clock here is not a time-of-day clo=
ck,
> +         but is instead a high-stability clock source for system timers
> +         and cycle counters.
> +- #clock-cells: Should be <1>
