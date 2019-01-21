From: Peter Robinson <pbrobinson@gmail.com>
Subject: Re: [PATCH 1/6] ARM: dts: bcm283x: Fix DTC warning for memory node
Date: Mon, 21 Jan 2019 04:59:34 +0000
Message-ID: <CALeDE9PAog8B_+19XRRxhgHZ2Jk=9PEn2fV9xHTo+5rpQ6L2kQ@mail.gmail.com>
References: <1547297008-2740-1-git-send-email-stefan.wahren@i2se.com>
 <1547297008-2740-2-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1547297008-2740-2-git-send-email-stefan.wahren@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Gottfried Haider <gottfried.haider@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>, devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>, Phil Elwell <phil@raspberrypi.org>, Eric Anholt <eric@anholt.net>, Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, Jan 12, 2019 at 12:44 PM Stefan Wahren <stefan.wahren@i2se.com> wrote:
>
> Compiling the bcm283x DTS with W=1 leads to the following warning:
>
> Warning (unit_address_vs_reg): /memory: node has a reg or ranges property,
> but no unit name
>
> Fix this by adding the unit address.
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Tested-by: Peter Robinson <pbrobinson@gmail.com>

Tested building RPi bcm283[67] dtb with W=1

> ---
>  arch/arm/boot/dts/bcm2835-rpi.dtsi         | 2 +-
>  arch/arm/boot/dts/bcm2836-rpi-2-b.dts      | 2 +-
>  arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dts | 2 +-
>  arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts | 2 +-
>  arch/arm/boot/dts/bcm2837-rpi-3-b.dts      | 2 +-
>  arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi     | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm2835-rpi.dtsi
> index c6e2b23..e490f2a 100644
> --- a/arch/arm/boot/dts/bcm2835-rpi.dtsi
> +++ b/arch/arm/boot/dts/bcm2835-rpi.dtsi
> @@ -1,7 +1,7 @@
>  #include <dt-bindings/power/raspberrypi-power.h>
>
>  / {
> -       memory {
> +       memory@0 {
>                 device_type = "memory";
>                 reg = <0 0x10000000>;
>         };
> diff --git a/arch/arm/boot/dts/bcm2836-rpi-2-b.dts b/arch/arm/boot/dts/bcm2836-rpi-2-b.dts
> index ac4408b..871fc4a 100644
> --- a/arch/arm/boot/dts/bcm2836-rpi-2-b.dts
> +++ b/arch/arm/boot/dts/bcm2836-rpi-2-b.dts
> @@ -9,7 +9,7 @@
>         compatible = "raspberrypi,2-model-b", "brcm,bcm2836";
>         model = "Raspberry Pi 2 Model B";
>
> -       memory {
> +       memory@0 {
>                 reg = <0 0x40000000>;
>         };
>
> diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dts b/arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dts
> index e9fadd3..7f4437a 100644
> --- a/arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dts
> +++ b/arch/arm/boot/dts/bcm2837-rpi-3-a-plus.dts
> @@ -13,7 +13,7 @@
>                 stdout-path = "serial1:115200n8";
>         };
>
> -       memory {
> +       memory@0 {
>                 reg = <0 0x20000000>;
>         };
>
> diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts b/arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts
> index 42bb090..7d65013 100644
> --- a/arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts
> +++ b/arch/arm/boot/dts/bcm2837-rpi-3-b-plus.dts
> @@ -14,7 +14,7 @@
>                 stdout-path = "serial1:115200n8";
>         };
>
> -       memory {
> +       memory@0 {
>                 reg = <0 0x40000000>;
>         };
>
> diff --git a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
> index 0c155dd..9abb9c5 100644
> --- a/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
> +++ b/arch/arm/boot/dts/bcm2837-rpi-3-b.dts
> @@ -14,7 +14,7 @@
>                 stdout-path = "serial1:115200n8";
>         };
>
> -       memory {
> +       memory@0 {
>                 reg = <0 0x40000000>;
>         };
>
> diff --git a/arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi b/arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi
> index 4a89a18..81399b2 100644
> --- a/arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi
> +++ b/arch/arm/boot/dts/bcm2837-rpi-cm3.dtsi
> @@ -4,7 +4,7 @@
>  #include "bcm2836-rpi.dtsi"
>
>  / {
> -       memory {
> +       memory@0 {
>                 reg = <0 0x40000000>;
>         };
>
> --
> 2.7.4
>
