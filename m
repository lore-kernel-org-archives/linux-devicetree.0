From: Jason Hui <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] arm/dt: add basic mx51 device tree support
Date: Mon, 7 Mar 2011 13:05:31 +0800
Message-ID: <AANLkTin-ZdzPxZaZuTmaUaRb4mO=DroJcu=WaAoo9t0L@mail.gmail.com>
References: <1298016730-22761-1-git-send-email-r64343@freescale.com>
	<1298016730-22761-2-git-send-email-r64343@freescale.com>
	<AANLkTi=v4X6XU9VUOVyr1MYZVsBeF494MBP3aeoZc4y6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <AANLkTi=v4X6XU9VUOVyr1MYZVsBeF494MBP3aeoZc4y6-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi, Shawn,

On Mon, Feb 28, 2011 at 2:48 PM, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On 18 February 2011 16:12, Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
>> Signed-off-by: Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>> ---
>> =A0arch/arm/mach-mx5/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A06 +++
>> =A0arch/arm/mach-mx5/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A01 +
>> =A0arch/arm/mach-mx5/board-dt.c =A0 =A0 =A0 =A0 =A0 =A0| =A0 64 ++++++++=
+++++++++++++++++++++++
>> =A0arch/arm/mach-mx5/clock-mx51-mx53.c =A0 =A0 | =A0 45 ++++++++++++++++=
+++++-
>> =A0arch/arm/plat-mxc/include/mach/common.h | =A0 =A01 +
>> =A05 files changed, 116 insertions(+), 1 deletions(-)
>>
> [...]
>> diff --git a/arch/arm/mach-mx5/clock-mx51-mx53.c b/arch/arm/mach-mx5/clo=
ck-mx51-mx53.c
>> index 0a19e75..b8a608e 100644
>> --- a/arch/arm/mach-mx5/clock-mx51-mx53.c
>> +++ b/arch/arm/mach-mx5/clock-mx51-mx53.c
>> @@ -15,13 +15,19 @@
>> =A0#include <linux/clk.h>
>> =A0#include <linux/io.h>
>> =A0#include <linux/clkdev.h>
>> -
>> +#include <linux/err.h>
>> =A0#include <asm/div64.h>
>>
>> =A0#include <mach/hardware.h>
>> =A0#include <mach/common.h>
>> =A0#include <mach/clock.h>
>>
>> +#ifdef CONFIG_OF
>> +#include <linux/of.h>
>> +#include <linux/of_address.h>
>> +#include <linux/of_clk.h>
>> +#endif /* CONFIG_OF */
>> +
>> =A0#include "crm_regs.h"
>>
>> =A0/* External clock values passed-in by the board code */
>> @@ -1432,3 +1438,40 @@ int __init mx53_clocks_init(unsigned long ckil, u=
nsigned long osc,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0MX53_INT_GPT);
>> =A0 =A0 =A0 =A0return 0;
>> =A0}
>> +
>> +#ifdef CONFIG_OF
>> +static struct clk* mx5_dt_clk_get(struct device_node *np,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 const char *output_id, void *data)
>> +{
>> + =A0 =A0 =A0 return data;
>> +}
>> +
>> +static __init void mx5_dt_scan_clks(void)
>> +{
>> + =A0 =A0 =A0 struct device_node *node;
>> + =A0 =A0 =A0 struct clk *clk;
>> + =A0 =A0 =A0 const char *id;
>> + =A0 =A0 =A0 int rc;
>> +
>> + =A0 =A0 =A0 for_each_compatible_node(node, NULL, "clock") {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 id =3D of_get_property(node, "clock-output=
s", NULL);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!id)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 clk =3D clk_get_sys(id, NULL);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (IS_ERR(clk))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 rc =3D of_clk_add_provider(node, mx5_dt_cl=
k_get, clk);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (rc) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(clk);
>
> In this particular implementation, kfree here may not be needed, as
> all the "clk" are currently created in the static way. =A0And I'm trying
> to change it to the dynamic way by scanning clock node from dt,
> creating and registering the "clk" correspondingly.

Yes, I will look into your dynamic way, but before the you real patch come =
up,
I will use the static one to do it currently.

>
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("error adding fixed=
 clk %s\n", node->name);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 }
>> +}
>> +
>> +void __init mx5_clk_dt_init(void)
>> +{
>> + =A0 =A0 =A0 mx5_dt_scan_clks();
>> +}
>> +#endif
>
> --
> Regards,
> Shawn
>
> _______________________________________________
> linaro-dev mailing list
> linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
> http://lists.linaro.org/mailman/listinfo/linaro-dev
>
