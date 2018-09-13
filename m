From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] ARM: dts: brcm: Fix SPI bus warnings
Date: Thu, 13 Sep 2018 15:20:20 -0700
Message-ID: <78e6100f-1932-108a-b3ec-7bb37765583b@gmail.com>
References: <20180913181245.25484-6-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180913181245.25484-6-robh@kernel.org>
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
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Jon Mason <jonmason@broadcom.com>, Ray Jui <rjui@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Scott Branden <sbranden@broadcom.com>
List-Id: devicetree@vger.kernel.org



On 09/13/18 11:12, Rob Herring wrote:
> dtc has new checks for SPI buses. Fix the warnings in node names.
> 
> arch/arm/boot/dts/bcm53340-ubnt-unifi-switch8.dtb: Warning (spi_bus_bridge): /axi@18000000/qspi@27200: node name for SPI buses should be 'spi'
> arch/arm/boot/dts/bcm958525er.dtb: Warning (spi_bus_bridge): /axi/qspi@27200: node name for SPI buses should be 'spi'
> arch/arm/boot/dts/bcm958525xmc.dtb: Warning (spi_bus_bridge): /axi/qspi@27200: node name for SPI buses should be 'spi'
> arch/arm/boot/dts/bcm958622hr.dtb: Warning (spi_bus_bridge): /axi/qspi@27200: node name for SPI buses should be 'spi'
> arch/arm/boot/dts/bcm958625hr.dtb: Warning (spi_bus_bridge): /axi/qspi@27200: node name for SPI buses should be 'spi'
> arch/arm/boot/dts/bcm988312hr.dtb: Warning (spi_bus_bridge): /axi/qspi@27200: node name for SPI buses should be 'spi'
> 
> Cc: Ray Jui <rjui@broadcom.com>
> Cc: Scott Branden <sbranden@broadcom.com>
> Cc: Jon Mason <jonmason@broadcom.com>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Applied to devicetree/next, thanks Rob!

NB: s/brcm/bcm/ to be somewhat consistent with file names and past
submissions.
-- 
Florian
