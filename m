From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 12/13] ARM: dts: rv1108: Pass the 'arm,cpu-registers-not-fw-configured' property
Date: Mon, 26 Nov 2018 10:29:02 +0100
Message-ID: <21161698.dmfua2PuA8@phil>
References: <20181125211907.9895-1-otavio@ossystems.com.br> <20181125211907.9895-12-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181125211907.9895-12-otavio@ossystems.com.br>
Sender: linux-kernel-owner@vger.kernel.org
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Am Sonntag, 25. November 2018, 22:19:06 CET schrieb Otavio Salvador:
> Since firmware does not initialize  any of the generic timer CPU
> registers pass the 'arm,cpu-registers-not-fw-configured' property as
> suggested in Documentation/devicetree/bindings/timer/arm,arch_timer.txt.
> 
> This also aligns with other Rockchip SoC dtsi files.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

applied for 4.21 after adapting the subject a bit.


Thanks
Heiko
