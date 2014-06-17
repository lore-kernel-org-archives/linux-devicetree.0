From: Rob Herring <robherring2@gmail.com>
Subject: Re: [PATCH RESEND 1/2] ARM: topology: Use a clock if possible to get
 the CPU frequency
Date: Tue, 17 Jun 2014 16:13:26 -0500
Message-ID: <CAL_Jsq+D2dprBfg8G_zYeZ9sk0pwWhVRd-1Uo513E0Jgg2igRg@mail.gmail.com>
References: <1403034980-19112-1-git-send-email-maxime.ripard@free-electrons.com>
 <1403034980-19112-2-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1403034980-19112-2-git-send-email-maxime.ripard@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nico@linaro.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 17, 2014 at 2:56 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> The Cortex-A7 and Cortex-A15 based SoCs need a clock-frequency property in the
> topology code.
>
> Allow to use a clock to provide the same information.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  arch/arm/kernel/topology.c | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm/kernel/topology.c b/arch/arm/kernel/topology.c
> index 9d853189028b..0bd044cbbcb2 100644
> --- a/arch/arm/kernel/topology.c
> +++ b/arch/arm/kernel/topology.c
> @@ -11,6 +11,7 @@
>   * for more details.
>   */
>
> +#include <linux/clk.h>
>  #include <linux/cpu.h>
>  #include <linux/cpumask.h>
>  #include <linux/export.h>
> @@ -100,8 +101,8 @@ static void __init parse_dt_topology(void)
>                                  GFP_NOWAIT);
>
>         for_each_possible_cpu(cpu) {
> -               const u32 *rate;
> -               int len;
> +               struct clk *clk;
> +               u32 rate = 0;
>
>                 /* too early to use cpu->of_node */
>                 cn = of_get_cpu_node(cpu, NULL);
> @@ -117,14 +118,23 @@ static void __init parse_dt_topology(void)
>                 if (cpu_eff->compatible == NULL)
>                         continue;
>
> -               rate = of_get_property(cn, "clock-frequency", &len);
> -               if (!rate || len != 4) {
> -                       pr_err("%s missing clock-frequency property\n",
> -                               cn->full_name);
> +               clk = of_clk_get(cn, 0);
> +               if (!IS_ERR(clk)) {
> +                       rate = clk_get_rate(clk);
> +               } else {
> +                       if (of_property_read_u32(cn, "clock-frequency", &rate)) {
> +                               pr_err("%s missing clocks or clock-frequency properties\n",
> +                                      cn->full_name);

This error check and message is redundant with the next error message.
You can remove this one and just call of_property_read_u32. rate will
remain untouched on error.
