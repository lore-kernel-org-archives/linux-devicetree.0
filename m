From: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH 2/3] riscv: select SiFive platform drivers with SOC_SIFIVE
Date: Wed, 19 Jun 2019 00:04:19 -0700 (PDT)
Message-ID: <mhng-e248d181-8676-4355-9825-d06049606d85@palmer-si-x1e>
References: <1560799790-20287-3-git-send-email-lollivier@baylibre.com>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560799790-20287-3-git-send-email-lollivier@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, lollivier@baylibre.com, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, khilman@baylibre.com
List-Id: devicetree@vger.kernel.org

On Mon, 17 Jun 2019 12:29:49 PDT (-0700), lollivier@baylibre.com wrote:
> On selection of SOC_SIFIVE select the corresponding platform drivers.
>
> Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
> ---
>  arch/riscv/Kconfig.socs | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 60dae1b5f276..536c0ef4aee8 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -2,6 +2,11 @@ menu "SoC selection"
>
>  config SOC_SIFIVE
>         bool "SiFive SoCs"
> +       select SERIAL_SIFIVE
> +       select SERIAL_SIFIVE_CONSOLE
> +       select CLK_SIFIVE
> +       select CLK_SIFIVE_FU540_PRCI
> +       select SIFIVE_PLIC
>         help
>           This enables support for SiFive SoC platform hardware.

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
