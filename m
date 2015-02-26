From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH 1/1] ARM: at91sam9263/dt: Fixup sram1 device tree node
Date: Thu, 26 Feb 2015 14:33:38 +0800
Message-ID: <795C3E78-C488-4C3A-AEBB-0ADAB41A8676@jcrosoft.com>
References: <1424853304-32197-1-git-send-email-alexanders83@web.de>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1424853304-32197-1-git-send-email-alexanders83@web.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Alexander Stein <alexanders83@web.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Nicolas FERRE <nicolas.ferre@atmel.com>, Rob Herring <robh+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Andrew Victor <linux@maxim.org.za>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

ack
> On Feb 25, 2015, at 4:35 PM, Alexander Stein <alexanders83@web.de> wrote:
> 
> Commit ff04660e48b20 ("ARM: at91/dt: add SRAM nodes") used the same base
> address for sram0 and sram1 leading to the following warning:
> WARNING: CPU: 0 PID: 1 at fs/sysfs/dir.c:31 sysfs_warn_dup+0x50/0x70()
> sysfs: cannot create duplicate filename '/devices/platform/300000.sram'
> Fix the base address for sram1.
> 
> Signed-off-by: Alexander Stein <alexanders83@web.de>
> ---
> arch/arm/boot/dts/at91sam9263.dtsi | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/at91sam9263.dtsi b/arch/arm/boot/dts/at91sam9263.dtsi
> index cdb7d03..76bb849 100644
> --- a/arch/arm/boot/dts/at91sam9263.dtsi
> +++ b/arch/arm/boot/dts/at91sam9263.dtsi
> @@ -69,7 +69,7 @@
> 
> 	sram1: sram@00500000 {
> 		compatible = "mmio-sram";
> -		reg = <0x00300000 0x4000>;
> +		reg = <0x00500000 0x4000>;
> 	};
> 
> 	ahb {
> -- 
> 2.3.0
> 
