From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH 0/6] ARM: DTS: da850: eDMA new bindings and MMC/SPI DMA
 support
Date: Wed, 9 Dec 2015 09:19:15 +0200
Message-ID: <5667D5F3.80503@ti.com>
References: <1449237210-16381-1-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1449237210-16381-1-git-send-email-peter.ujfalusi@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: nsekhar@ti.com
Cc: khilman@deeprootsystems.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Sekhar,

On 12/04/2015 03:53 PM, Peter Ujfalusi wrote:
> Hi,
> =

> Switch to use the new eDMA bindings and enable DMA for MMC0, SPI1.
> Add node for MMC1.

Can you hold on this one for a bit since the eDMA bindings might change sti=
ll.

> =

> Regards,
> Peter
> ---
> Peter Ujfalusi (6):
>   ARM: DTS: da850: fix edma0 reg space
>   ARM: DTS: da850: Use the new DT bindings for the eDMA3
>   ARM: DTS: da850: Enable eDMA1
>   ARM: DTS: da850: Enable DMA use for MMC0
>   ARM: DTS: da850: Add node for mmc1
>   ARM: DTS: da850: Enable DMA for SPI1
> =

>  arch/arm/boot/dts/da850-enbw-cmc.dts |  9 ++++++
>  arch/arm/boot/dts/da850-evm.dts      |  9 ++++++
>  arch/arm/boot/dts/da850.dtsi         | 59 ++++++++++++++++++++++++++++++=
++----
>  3 files changed, 71 insertions(+), 6 deletions(-)
> =



-- =

P=E9ter
