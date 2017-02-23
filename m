From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/1] ARM: dts: BCM953012HR: Initial Checkin
Date: Thu, 23 Feb 2017 07:22:19 -0600
Message-ID: <CAL_JsqJGLEKvdCpb+U5sN2GU4hgfYdqMH3rfntNnKsBOdHfKLw@mail.gmail.com>
References: <1487798092-8631-1-git-send-email-steven.lin1@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1487798092-8631-1-git-send-email-steven.lin1@broadcom.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Steve Lin <steven.lin1@broadcom.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Russell King <linux@armlinux.org.uk>, Jon Mason <jon.mason@broadcom.com>, "bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 22, 2017 at 3:14 PM, Steve Lin <steven.lin1@broadcom.com> wrote:
> Initial version of DTS to support Broadcom BCM953012HR Northstar
> HR platform, similar to, but not the same as existing 953012K.
>
> Signed-off-by: Steve Lin <steven.lin1@broadcom.com>
> ---
>  arch/arm/boot/dts/Makefile        |   1 +
>  arch/arm/boot/dts/bcm953012hr.dts | 115 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 116 insertions(+)
>  create mode 100644 arch/arm/boot/dts/bcm953012hr.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 01d178a..c64ca3d 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -94,6 +94,7 @@ dtb-$(CONFIG_ARCH_BCM_5301X) += \
>         bcm94708.dtb \
>         bcm94709.dtb \
>         bcm953012er.dtb \
> +       bcm953012hr.dtb \
>         bcm953012k.dtb
>  dtb-$(CONFIG_ARCH_BCM_53573) += \
>         bcm47189-tenda-ac9.dtb
> diff --git a/arch/arm/boot/dts/bcm953012hr.dts b/arch/arm/boot/dts/bcm953012hr.dts
> new file mode 100644
> index 0000000..c332277
> --- /dev/null
> +++ b/arch/arm/boot/dts/bcm953012hr.dts
> @@ -0,0 +1,115 @@
> +/*
> + *  BSD LICENSE

Please use SDPX-License-Identifier tag instead.

> + *
> + *  Copyright(c) 2017 Broadcom
> + *
> + *  Redistribution and use in source and binary forms, with or without
> + *  modification, are permitted provided that the following conditions
> + *  are met:
> + *
> + *    * Redistributions of source code must retain the above copyright
> + *      notice, this list of conditions and the following disclaimer.
> + *    * Redistributions in binary form must reproduce the above copyright
> + *      notice, this list of conditions and the following disclaimer in
> + *      the documentation and/or other materials provided with the
> + *      distribution.
> + *    * Neither the name of Broadcom nor the names of its contributors
> + *      may be used to endorse or promote products derived from this
> + *      software without specific prior written permission.
> + *
> + *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> + *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> + *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
> + *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
> + *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
> + *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
> + *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
> + *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
> + *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
> + *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
> + *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> + */
> +
> +/dts-v1/;
> +
> +#include "bcm4708.dtsi"
> +
> +/ {
> +       model = "NorthStar HR (BCM953012HR)";
> +       compatible = "brcm,bcm953012hr", "brcm,brcm53012", "brcm,bcm4708";
> +
> +       aliases {
> +               serial0 = &uart0;
> +       };
> +
> +       chosen {
> +               stdout-path = "serial0:115200n8";
> +       };
> +
> +       memory {

memory@80000000

> +               reg = <0x80000000 0x10000000>;
> +       };
> +};
> +
> +&uart0 {
> +       status = "okay";
> +};
> +
> +&nand {
> +       nandcs@0 {
> +               compatible = "brcm,nandcs";
> +               reg = <0>;
> +               nand-on-flash-bbt;
> +
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +
> +               nand-ecc-strength = <4>;
> +               nand-ecc-step-size = <512>;
> +
> +               partition@0 {
> +                       label = "nboot";
> +                       reg = <0x00000000 0x00200000>;
> +                       read-only;
> +               };
> +               partition@200000 {
> +                       label = "nenv";
> +                       reg = <0x00200000 0x00400000>;
> +               };
> +               partition@600000 {
> +                       label = "nsystem";
> +                       reg = <0x00600000 0x00a00000>;
> +               };
> +               partition@1000000 {
> +                       label = "nrootfs";
> +                       reg = <0x01000000 0x07000000>;
> +               };
> +       };
> +};
> +
> +&spi_nor {
> +       status = "okay";
> +       spi-max-frequency = <62500000>;
> +       m25p,default-addr-width = <3>;
> +
> +       #address-cells = <1>;
> +       #size-cells = <1>;
> +
> +       partition@0 {
> +               label = "boot";
> +               reg = <0x00000000 0x000d0000>;
> +       };
> +       partition@d000 {
> +               label = "env";
> +               reg = <0x000d0000 0x00030000>;
> +       };
> +       partition@100000 {
> +               label = "system";
> +               reg = <0x00100000 0x00600000>;
> +       };
> +       partition@700000 {
> +               label = "rootfs";
> +               reg = <0x00700000 0x00900000>;
> +       };
> +};
> +
> --
> 2.1.0
>
