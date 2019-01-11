From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: build virtex dtb
Date: Fri, 11 Jan 2019 22:37:53 +1100
Message-ID: <87y37re86m.fsf@concordia.ellerman.id.au>
References: <1546951970-29079-1-git-send-email-clabbe@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1546951970-29079-1-git-send-email-clabbe@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: benh@kernel.crashing.org, mark.rutland@arm.com, paulus@samba.org, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Corentin Labbe <clabbe@baylibre.com>
List-Id: devicetree@vger.kernel.org

Corentin Labbe <clabbe@baylibre.com> writes:

> I wanted to test the virtex440-ml507 qemu machine and found that the dtb
> for it was not builded.
> All powerpc DTB are only built when CONFIG_OF_ALL_DTBS is set which depend on
> COMPILE_TEST.
>
> This patchs adds build of virtex dtbs depending on
> CONFIG_XILINX_VIRTEX440_GENERIC_BOARD option.
>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  arch/powerpc/boot/dts/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/powerpc/boot/dts/Makefile b/arch/powerpc/boot/dts/Makefile
> index fb335d05aae8..cae14fca682e 100644
> --- a/arch/powerpc/boot/dts/Makefile
> +++ b/arch/powerpc/boot/dts/Makefile
> @@ -4,3 +4,5 @@ subdir-y += fsl
>  
>  dtstree		:= $(srctree)/$(src)
>  dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(dtstree)/%.dts,%.dtb, $(wildcard $(dtstree)/*.dts))
> +dtb-$(CONFIG_XILINX_VIRTEX440_GENERIC_BOARD) += virtex440-ml507.dtb
> +dtb-$(CONFIG_XILINX_VIRTEX440_GENERIC_BOARD) += virtex440-ml510.dtb

I'll squash these onto one line, eg:

dtb-$(CONFIG_XILINX_VIRTEX440_GENERIC_BOARD) += virtex440-ml507.dtb virtex440-ml510.dtb


cheers
