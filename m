From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] ARM: dts: vexpress: Replace '_' with '-' in node names
Date: Wed, 9 May 2018 16:14:11 -0500
Message-ID: <CAL_Jsq+VNuvbxgFTFVouJF-_yMS90u0fd8jaXnYtKwogOP5rww@mail.gmail.com>
References: <1525884482-19855-1-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1525884482-19855-1-git-send-email-sudeep.holla@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sudeep Holla <sudeep.holla@arm.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 9, 2018 at 11:48 AM, Sudeep Holla <sudeep.holla@arm.com> wrote:
> The latest DTC throws warnings for character '_' in the node names.
>
> Warning (node_name_chars_strict): /sysreg@10000/sys_led: Character '_' not recommended in node name
> Warning (node_name_chars_strict): /sysreg@10000/sys_mci: Character '_' not recommended in node name
> Warning (node_name_chars_strict): /sysreg@10000/sys_flash: Character '_' not recommended in node name
>
> The general recommendation is to use character '-' for all the node names.
> This patch fixes the warnings following the recommendation.
>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  arch/arm/boot/dts/vexpress-v2m-rs1.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi b/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
> index 7b8ff5b3b912..58e73131ecef 100644
> --- a/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
> +++ b/arch/arm/boot/dts/vexpress-v2m-rs1.dtsi
> @@ -77,19 +77,19 @@
>                                         compatible = "arm,vexpress-sysreg";
>                                         reg = <0x010000 0x1000>;
>
> -                                       v2m_led_gpios: sys_led {
> +                                       v2m_led_gpios: sys-led {

Except this is a gpio-controller so it should have 'gpio' for its node
name. (I have a dtc check written for that, but there are too many
false positives.)

But then you have 3 of them and no addressing, so you need to add reg
property (with the register's offset and size) and unit-address.

I'm surprised Linus W accepted these a GPIO when they are not really
general purpose, but then lots of things slip in.

Rob
