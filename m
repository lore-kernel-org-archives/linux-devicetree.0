Return-Path: <SRS0=Eida=TI=verge.net.au=horms@kernel.org>
Date: Wed, 8 May 2019 12:08:18 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 0/5] Add TPU support for R-Car H3/M3-W/M3-N
Message-ID: <20190508100817.ap5i7djcoi2z5zbt@verge.net.au>
References: <1556155517-5054-1-git-send-email-cv-dong@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556155517-5054-1-git-send-email-cv-dong@jinso.co.jp>
To: Cao Van Dong <cv-dong@jinso.co.jp>
Cc: linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be, broonie@kernel.org, devicetree@vger.kernel.org, mark.rutland@arm.com, daniel.lezcano@linaro.org, tglx@linutronix.de, robh@kernel.org, yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp, na-hoan@jinso.co.jp
List-ID: <devicetree@vger.kernel.org>

On Thu, Apr 25, 2019 at 10:25:12AM +0900, Cao Van Dong wrote:
> This series adds tpu support for r8a7795/r8a7796/r8a77965 SoCs.
> Based on the renesas-drivers-2019-04-02-v5.1-rc3 tag of renesas-drivers tree.
> For test, after booting, I found the device was registered in the booting log.
> 
> Cao Van Dong (5):
>   clk: renesas: r8a779{5|6|65}: Add TPU clock
>   arm64: dts: renesas: r8a7795: Add TPU support
>   arm64: dts: renesas: r8a7796: Add TPU support
>   arm64: dts: renesas: r8a77965: Add TPU support
>   dt-bindings: pwm: renesas: tpu: Document R8A779{5|6|65} bindings

Thanks,

I have applied the dts patches for inclusion in v5.3 based on
a) Testing by Geert and yourself; and
b) A belief that the hardware is very similar on the SoCs covered
   by this patchset
