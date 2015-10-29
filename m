From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] arm64: dts: Added syscon-reboot node for FSL's LS2085A SoC
Date: Thu, 29 Oct 2015 22:49:12 +0100
Message-ID: <3919319.0f6zV1T7g0@wuerfel>
References: <1446066584-3738-1-git-send-email-German.Rivera@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446066584-3738-1-git-send-email-German.Rivera@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: "J. German Rivera" <German.Rivera@freescale.com>, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bhupesh.sharma@freescale.com, leoli@freescale.com, stuart.yoder@freescale.com
List-Id: devicetree@vger.kernel.org

On Wednesday 28 October 2015 16:09:44 J. German Rivera wrote:
> +       rst_ccsr: rstccsr@1E60000 {
> +               compatible = "syscon";
> +               reg = <0x0 0x1E60000 0x0 0x10000>;
> +       };
> +
> 

What does 'rstccsr' stand for? Is this by chance a reset controller?

If so, we probably want a real driver for it rather than just a
syscon.

	Arnd
