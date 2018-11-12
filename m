From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH V2] arm64: dts: sdm630 SoC and Sony Pioneer (Xperia XA2) support
Date: Mon, 12 Nov 2018 16:34:50 +0100
Message-ID: <61693687.BtxviolxTZ@phil>
References: <20180812142317.19991-1-ctatlor97@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180812142317.19991-1-ctatlor97@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Craig Tatlor <ctatlor97@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Craig,

Am Sonntag, 12. August 2018, 16:23:12 CET schrieb Craig Tatlor:
> Initial device tree support for Qualcomm SDM630 SoC and
> Sony Pioneer (Xperia XA2).
> 
> SDM630 is based off of the SDM660 soc and all SDM660 specific drivers are
> compatible with it. SDM660 is also based off of MSM8998 so it uses some
> of its drivers aswell.
> 
> The device tree is based on the CAF 4.4 kernel tree.
> 
> The device can be booted into the initrd with a shell over UART.
> 
> Signed-off-by: Craig Tatlor <ctatlor97@gmail.com>

With I think core drivers like clk, pinctrl merged in 4.20, do you
plan on respinning the devicetree support or in general continue
working on sdm630/sdm660?

Or do you have some git tree available somewhere, were I can follow
along? I do have interest in supporting a sdm630 phone of my own
but still don't want to duplicate work :-)


Thanks
Heiko
