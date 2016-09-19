From: Fabien Lahoudere <fabien.lahoudere-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: imx5: Add clocks configuration
Date: Mon, 19 Sep 2016 09:33:16 +0200
Message-ID: <1b8d9b99-ef47-734e-a232-88fa8860304c@collabora.co.uk>
References: <1473934403-2726-1-git-send-email-fabien.lahoudere@collabora.co.uk>
 <1473961353.68713919@f429.i.mail.ru> <20160918002159.GD15478@tiger>
 <20160918002451.GE15478@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160918002451.GE15478@tiger>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kalle Kankare <kalle.kankare-qk6XLmcB7GT1KXRcyAk9cg@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 18/09/16 02:24, Shawn Guo wrote:
> On Sun, Sep 18, 2016 at 08:21:59AM +0800, Shawn Guo wrote:
>> On Thu, Sep 15, 2016 at 08:42:33PM +0300, Alexander Shiyan wrote:
>>>> Четверг, 15 сентября 2016, 13:13 +03:00 от Fabien Lahoudere <fabien.lahoudere-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>:
>>>>
>>>> From: Kalle Kankare < kalle.kankare-qk6XLmcB7GT1KXRcyAk9cg@public.gmane.org >
>>>>
>>>> Add clocks configuration for CSI, FIRI and IEEE1588.
>>>>
>>>> Signed-off-by: Fabien Lahoudere < fabien.lahoudere-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org >
>>>> ---
>>>>  drivers/clk/imx/clk-imx51-imx53.c      | 20 ++++++++++++++++++++
>>>>  include/dt-bindings/clock/imx5-clock.h | 15 ++++++++++++++-
>>>>  2 files changed, 34 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/clk/imx/clk-imx51-imx53.c b/drivers/clk/imx/clk-imx51-imx53.c
>>>> index 29d4c44..1e3c9ea 100644
>>>> --- a/drivers/clk/imx/clk-imx51-imx53.c
>>>> +++ b/drivers/clk/imx/clk-imx51-imx53.c
>>>> @@ -126,6 +126,7 @@ static const char *spdif0_com_sel[] = { "spdif0_podf", "ssi1_root_gate", };
>>>>  static const char *mx51_spdif1_com_sel[] = { "spdif1_podf", "ssi2_root_gate", };
>>>>  static const char *step_sels[] = { "lp_apm", };
>>>>  static const char *cpu_podf_sels[] = { "pll1_sw", "step_sel" };
>>>> +static const char *ieee1588_sels[] = { "pll3_sw", "pll4_sw", "dummy" /* usbphy2_clk */, "dummy" /* fec_phy_clk */ };
>>>>
>>>>  static struct clk *clk[IMX5_CLK_END];
>>>>  static struct clk_onecell_data clk_data;
>>>> @@ -543,6 +544,25 @@ static void __init mx53_clocks_init(struct device_node *np)
>>> ...
>>>
>>> 2 Shawn Guo: Since the change affects only on i.MX53 architecture,
>>> I would ask to change the subject to i.MX53 if it possible.
>>
>> Yes.  Actually, since clock driver is not moved to drivers/clk, we
>
> s/not/now
>
>> shouldn't prefix it with "ARM: " any longer.


Ok is "clk: imx53: Add clocks configuration" ok?

>
> Shawn
>

Thanks

Fabien
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
