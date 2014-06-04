From: Vinayak Kale <vkale@apm.com>
Subject: Re: [PATCH] arm64: dts: Add more serial port nodes in APM X-Gene
 device tree
Date: Wed, 4 Jun 2014 15:35:54 +0530
Message-ID: <CAPrCYkcJr5ODY3Sjcq5D_Db-cM3SAXYjUK2H9FGePrO_q0wMEw@mail.gmail.com>
References: <1395836346-9350-1-git-send-email-vkale@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1395836346-9350-1-git-send-email-vkale@apm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org
Cc: Catalin Marinas <Catalin.Marinas@arm.com>, patches <patches@apm.com>, Vinayak Kale <vkale@apm.com>, Will Deacon <will.deacon@arm.com>, "jcm@redhat.com" <jcm@redhat.com>
List-Id: devicetree@vger.kernel.org

Hi Catalin / Will,

Can you please merge this one?

Thanks
-Vinayak

On Wed, Mar 26, 2014 at 5:49 PM, Vinayak Kale <vkale@apm.com> wrote:
> APM X-Gene Storm SoC supports 4 serial ports. This patch adds device nodes
> for serial ports 1 to 3 (a device node for serial port 0 is already present
> in the dts file).
> This patch also sets the compatible property of serial nodes to "ns16550a".
>
> Signed-off-by: Vinayak Kale <vkale@apm.com>
> ---
>  arch/arm64/boot/dts/apm-mustang.dts |  4 ++++
>  arch/arm64/boot/dts/apm-storm.dtsi  | 36 +++++++++++++++++++++++++++++++++++-
>  2 files changed, 39 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/apm-mustang.dts b/arch/arm64/boot/dts/apm-mustang.dts
> index 1247ca1..6541962 100644
> --- a/arch/arm64/boot/dts/apm-mustang.dts
> +++ b/arch/arm64/boot/dts/apm-mustang.dts
> @@ -24,3 +24,7 @@
>                 reg = < 0x1 0x00000000 0x0 0x80000000 >; /* Updated by bootloader */
>         };
>  };
> +
> +&serial0 {
> +       status = "ok";
> +};
> diff --git a/arch/arm64/boot/dts/apm-storm.dtsi b/arch/arm64/boot/dts/apm-storm.dtsi
> index d37d736..2277b5c 100644
> --- a/arch/arm64/boot/dts/apm-storm.dtsi
> +++ b/arch/arm64/boot/dts/apm-storm.dtsi
> @@ -179,13 +179,47 @@
>                 };
>
>                 serial0: serial@1c020000 {
> +                       status = "disabled";
>                         device_type = "serial";
> -                       compatible = "ns16550";
> +                       compatible = "ns16550a";
>                         reg = <0 0x1c020000 0x0 0x1000>;
>                         reg-shift = <2>;
>                         clock-frequency = <10000000>; /* Updated by bootloader */
>                         interrupt-parent = <&gic>;
>                         interrupts = <0x0 0x4c 0x4>;
>                 };
> +
> +               serial1: serial@1c021000 {
> +                       status = "disabled";
> +                       device_type = "serial";
> +                       compatible = "ns16550a";
> +                       reg = <0 0x1c021000 0x0 0x1000>;
> +                       reg-shift = <2>;
> +                       clock-frequency = <10000000>; /* Updated by bootloader */
> +                       interrupt-parent = <&gic>;
> +                       interrupts = <0x0 0x4d 0x4>;
> +               };
> +
> +               serial2: serial@1c022000 {
> +                       status = "disabled";
> +                       device_type = "serial";
> +                       compatible = "ns16550a";
> +                       reg = <0 0x1c022000 0x0 0x1000>;
> +                       reg-shift = <2>;
> +                       clock-frequency = <10000000>; /* Updated by bootloader */
> +                       interrupt-parent = <&gic>;
> +                       interrupts = <0x0 0x4e 0x4>;
> +               };
> +
> +               serial3: serial@1c023000 {
> +                       status = "disabled";
> +                       device_type = "serial";
> +                       compatible = "ns16550a";
> +                       reg = <0 0x1c023000 0x0 0x1000>;
> +                       reg-shift = <2>;
> +                       clock-frequency = <10000000>; /* Updated by bootloader */
> +                       interrupt-parent = <&gic>;
> +                       interrupts = <0x0 0x4f 0x4>;
> +               };
>         };
>  };
> --
> 1.8.2.1
>
