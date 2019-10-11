From: Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH V4 00/10] ARM: Add minimal Raspberry Pi 4 support
Date: Fri, 11 Oct 2019 16:46:46 +0200
Message-ID: <11857a63-252a-00d3-d777-aed1c515ec47@gmx.net>
References: <1570375708-26965-1-git-send-email-wahrenst@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1570375708-26965-1-git-send-email-wahrenst@gmx.net>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-bluetooth@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Am 06.10.19 um 17:28 schrieb Stefan Wahren:
> This series adds minimal support for the new Raspberry Pi 4, so we are able
> to login via debug UART.
>
> Patch 1:     Bluetooth driver fix
> Patch 2-3:   Fix some DT schema warnings
> Patch 4-5:   Prepare DTS for the new SoC BMC2711
> Patch 6-9:   Add Raspberry Pi 4 DTS support
> Patch 10:    Update MAINTAINERS
>
> Unfortunately the Raspberry Pi Foundation didn't released a
> peripheral documentation for the new SoC yet. So we only have a preliminary
> datasheet [1] and reduced schematics [2].
>
> Known issues:
> Since Linux 5.3-rc1 DMA doesn't work properly on that platform.
> Nicolas Saenz Julienne investigates on that issue. As a temporary workaround
> i reverted the following patch to test this series:
>
> 79a98672 "dma-mapping: remove dma_max_pfn"
> 7559d612 "mmc: core: let the dma map ops handle bouncing"
>
> Changes in V4:
> - add Rob's Reviewed-by
> - enable ZONE_DMA for ARCH_BCM2835
> - fix spi reference in bcm2711.dtsi
> - fix bluetooth section in RPi 4 dts
> - drop "always-on" for armv8-timer
> - add necessary Bluetooth driver fix
> - add arm64 dts link
> - additional comments to the dts files as requested by Florian
>
Patches 2-10 applied so that we don't miss Linux 5.5
