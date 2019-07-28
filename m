From: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH] riscv: dts: fu540-c000: drop "timebase-frequency"
Date: Sun, 28 Jul 2019 21:40:29 +0800
Message-ID: <CAEUhbmVHjy86js51u-VP=X8h4xg19kBjKkGRu+C2T2pUwQz6Qw@mail.gmail.com>
References: <alpine.DEB.2.21.9999.1907251429420.32766@viisi.sifive.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.21.9999.1907251429420.32766@viisi.sifive.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@sifive.com>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jul 26, 2019 at 5:31 AM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
>
> On FU540-based systems, the "timebase-frequency" (RTCCLK) is sourced
> from an external crystal located on the PCB.  Thus the
> timebase-frequency DT property should be defined by the board that
> uses the SoC, not the SoC itself.  Drop the superfluous
> timebase-frequency property from the SoC DT data.  (It's already
> present in the board DT data.)
>
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> ---
>  arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 1 -
>  1 file changed, 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
