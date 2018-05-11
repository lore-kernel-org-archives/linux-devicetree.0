From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] ARM: dts: vexpress: use standard gpio bindings for
 sys_{led, mci, flash}
Date: Fri, 11 May 2018 07:10:27 -0500
Message-ID: <CAL_JsqKsGV8rrox2hSioASD+96ws9JLTo_DLw9nKwAgr5uZ_3g@mail.gmail.com>
References: <1525884482-19855-1-git-send-email-sudeep.holla@arm.com>
 <1526034208-9690-1-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1526034208-9690-1-git-send-email-sudeep.holla@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: devicetree@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 11, 2018 at 5:23 AM, Sudeep Holla <sudeep.holla@arm.com> wrote:
> Commit 2cff6dba57b7 ("ARM: dts: vexpress: fix node name unit-address presence warnings")
> removed the unit address as there was no associated reg property in
> these sysreg nodes.
>
> Also the latest DTC throws warnings for character '_' in the node names.
>
> Warning (node_name_chars_strict): /sysreg@10000/sys_led: Character '_' not recommended in node name
> Warning (node_name_chars_strict): /sysreg@10000/sys_mci: Character '_' not recommended in node name
> Warning (node_name_chars_strict): /sysreg@10000/sys_flash: Character '_' not recommended in node name
>
> The correct way to fix this as well as the original unit-address presence
> warnings is to use the standard gpio controller binding and specify the
> reg properties as per the hardware as it was before.
>
> However note that Vexpress sysreg MFD driver will still continue to use
> the hardcoded values for compatibility reasons.
>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  arch/arm/boot/dts/vexpress-v2m-rs1.dtsi | 11 ++++++++---
>  arch/arm/boot/dts/vexpress-v2m.dtsi     | 11 ++++++++---
>  2 files changed, 16 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi b/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
> index 7b8ff5b3b912..a8586a0b957d 100644
> --- a/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
> +++ b/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
> @@ -76,21 +76,26 @@
>                                 v2m_sysreg: sysreg@10000 {
>                                         compatible = "arm,vexpress-sysreg";
>                                         reg = <0x010000 0x1000>;
> +                                       #address-cells = <1>;
> +                                       #size-cells = <1>;

You need a ranges here and below to translate from 0-0x10000 range.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

>
> -                                       v2m_led_gpios: sys_led {
> +                                       v2m_led_gpios: gpio@8 {
>                                                 compatible = "arm,vexpress-sysreg,sys_led";
> +                                               reg = <0x008 4>;
>                                                 gpio-controller;
>                                                 #gpio-cells = <2>;
>                                         };
>
> -                                       v2m_mmc_gpios: sys_mci {
> +                                       v2m_mmc_gpios: gpio@48 {
>                                                 compatible = "arm,vexpress-sysreg,sys_mci";
> +                                               reg = <0x048 4>;
>                                                 gpio-controller;
>                                                 #gpio-cells = <2>;
>                                         };
>
> -                                       v2m_flash_gpios: sys_flash {
> +                                       v2m_flash_gpios: gpio@4c {
>                                                 compatible = "arm,vexpress-sysreg,sys_flash";
> +                                               reg = <0x04c 4>;
>                                                 gpio-controller;
>                                                 #gpio-cells = <2>;
>                                         };
> diff --git a/arch/arm/boot/dts/vexpress-v2m.dtsi b/arch/arm/boot/dts/vexpress-v2m.dtsi
> index 9cd5e146abd5..37ecccebd937 100644
> --- a/arch/arm/boot/dts/vexpress-v2m.dtsi
> +++ b/arch/arm/boot/dts/vexpress-v2m.dtsi
> @@ -76,21 +76,26 @@
>                                 v2m_sysreg: sysreg@0 {
>                                         compatible = "arm,vexpress-sysreg";
>                                         reg = <0x00000 0x1000>;
> +                                       #address-cells = <1>;
> +                                       #size-cells = <1>;
>
> -                                       v2m_led_gpios: sys_led {
> +                                       v2m_led_gpios: gpio@8 {
>                                                 compatible = "arm,vexpress-sysreg,sys_led";
> +                                               reg = <0x008 4>;
>                                                 gpio-controller;
>                                                 #gpio-cells = <2>;
>                                         };
>
> -                                       v2m_mmc_gpios: sys_mci {
> +                                       v2m_mmc_gpios: gpio@48 {
>                                                 compatible = "arm,vexpress-sysreg,sys_mci";
> +                                               reg = <0x048 4>;
>                                                 gpio-controller;
>                                                 #gpio-cells = <2>;
>                                         };
>
> -                                       v2m_flash_gpios: sys_flash {
> +                                       v2m_flash_gpios: gpio@4c {
>                                                 compatible = "arm,vexpress-sysreg,sys_flash";
> +                                               reg = <0x04c 4>;
>                                                 gpio-controller;
>                                                 #gpio-cells = <2>;
>                                         };
> --
> 2.7.4
>
