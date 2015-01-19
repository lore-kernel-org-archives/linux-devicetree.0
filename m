From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 2/3] arm64: dts: Add APM X-Gene DMA device and DMA clock DTS nodes
Date: Mon, 19 Jan 2015 14:40:36 +0100
Message-ID: <2407238.x2YxDm0cd4@wuerfel>
References: <1421671269-19441-1-git-send-email-rsahu@apm.com> <1421671269-19441-3-git-send-email-rsahu@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1421671269-19441-3-git-send-email-rsahu@apm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rameshwar Prasad Sahu <rsahu@apm.com>
Cc: vinod.koul@intel.com, dan.j.williams@intel.com, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, ddutile@redhat.com, jcm@redhat.com, patches@apm.com, Loc Ho <lho@apm.com>
List-Id: devicetree@vger.kernel.org

On Monday 19 January 2015 18:11:08 Rameshwar Prasad Sahu wrote:
> diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
> index f1ad9c2..e20da23 100644
> --- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
> +++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
> @@ -103,6 +103,9 @@
>                 #size-cells = <2>;
>                 ranges;
> 
> +               /* DDR range is 42-bit addressing */
> +               dma-ranges = <0x40 0x0 0x40 0x0 0x1ff 0xffffffff>;
> +
> 

The comment above is misleading, and the value is wrong. I assume you
copied these from the AMD patch that introduced the respective property.

The value should be

	dma-ranges = <0x40 0x0 0x40 0x0 0x200 0>;

to say that any DMA to physical addresses from 0 to 0x3f.ffffffff
is disallowed and dma to physical addresses from 0x40.00000000
to 0x23f.ffffffff is allowed and gets translated using an
identity mapping.

I also see that on Mustang, all memory is outside of this range,
which is a bit suspicious, while your PCI memory space is
included.

It would be best to match the numbers up with your data sheet.

	Arnd
