From: Caesar Wang <wxt@rock-chips.com>
Subject: Re: [PATCH v14 2/3] power-domain: rockchip: add power domain driver
Date: Mon, 29 Jun 2015 16:16:36 +0800
Message-ID: <5590FEE4.3030709@rock-chips.com>
References: <1429862868-14218-1-git-send-email-wxt@rock-chips.com> <1429862868-14218-3-git-send-email-wxt@rock-chips.com> <CAPDyKFrBzZjOVZzq9unQQwm2BSA0kzeT7EE8_kSpH_udMKjo6A@mail.gmail.com> <557CF1D6.4090506@163.com> <CAPDyKFqa9cQin2HUFuLO_-sSkeASSr08b-3DZ5xGbYHQBPxKag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAPDyKFqa9cQin2HUFuLO_-sSkeASSr08b-3DZ5xGbYHQBPxKag@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Doug Anderson <dianders@chromium.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Grant Likely <grant.likely@linaro.org>, Caesar Wang <wxt@rock-chips.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kevin Hilman <khilman@linaro.org>, =?UTF-8?B?UGF3ZcWCIE1vbGw=?= <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "jinkun.hong" <jinkun.hong@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Randy Dunlap <rdunlap@in>
List-Id: devicetree@vger.kernel.org

Hi Uffe,

=E5=9C=A8 2015=E5=B9=B406=E6=9C=8825=E6=97=A5 23:33, Ulf Hansson =E5=86=
=99=E9=81=93:
> [...]
>
>>>> +#include <linux/clk-provider.h>
>>> clk-provider.h, why?
>>
>> The following is needed.
>>
>> _clk_get_name(clk)
> I see, you need it for for the dev_dbg().
>
> I think you shall use "%pC" as the formatting string for the dev_dbg(=
)
> message, since that will take care of printing the clock name for you=
=2E

Yes, the "%pC" can do the similar thing.
Done, fixed in next patch.

> [...]
>
>>>> +static int rockchip_pd_power(struct rockchip_pm_domain *pd, bool
>>>> power_on)
>>>> +{
>>>> +       int i;
>>>> +
>>>> +       mutex_lock(&pd->pmu->mutex);
>>> I don't quite understand why you need a lock, what are you protecti=
ng and
>>> why?
>>
>> Says:
>> [ 3551.678762] mali ffa30000.gpu: starting device in power domain 'p=
d_gpu'
>> [ 3551.899180] mali ffa30000.gpu: stopping device in power domain 'p=
d_gpu'
>> [ 3551.905958] mali ffa30000.gpu: starting device in power domain 'p=
d_gpu'
>> [ 3551.912832] mali ffa30000.gpu: stopping device in power domain 'p=
d_gpu'
>> [ 3551.919730] rockchip_pd_power:139: mutex_lock
>> [ 3551.924130] rockchip_pd_power:167,mutex_unlock
>> [ 3563.827295] rockchip_pd_power:139: mutex_lock
>> [ 3563.831753] rockchip_pd_power:167,mutex_unlock
>> [ 3563.836216] mali ffa30000.gpu: starting device in power domain 'p=
d_gpu'
>> [ 3564.058989] mali ffa30000.gpu: stopping device in power domain 'p=
d_gpu'
>> [ 3564.065659] mali ffa30000.gpu: starting device in power domain 'p=
d_gpu'
>> [ 3564.072354] mali ffa30000.gpu: stopping device in power domain 'p=
d_gpu'
>> [ 3564.079047] rockchip_pd_power:139: mutex_lock
>> [ 3564.083426] rockchip_pd_power:167,mutex_unlock
>> [ 3611.665726] rockchip_pd_power:139: mutex_lock
>> [ 3611.670206] rockchip_pd_power:167,mutex_unlock
>> [ 3611.674692] mali ffa30000.gpu: starting device in power domain 'p=
d_gpu'
>> [ 3611.899160] mali ffa30000.gpu: stopping device in power domain 'p=
d_gpu'
>> [ 3611.905938] mali ffa30000.gpu: starting device in power domain 'p=
d_gpu'
>> [ 3611.912818] mali ffa30000.gpu: stopping device in power domain 'p=
d_gpu'
>> [ 3611.919689] rockchip_pd_power:139: mutex_lock
>> [ 3611.924090] rockchip_pd_power:167,mutex_unlock
>> [ 3623.848296] rockchip_pd_power:139: mutex_lock
>> [ 3623.852752] rockchip_pd_power:167,mutex_unlock
>>
>>
>>
>>
>>>> +
>>>> +       if (rockchip_pmu_domain_is_on(pd) !=3D power_on) {
>>>> +               for (i =3D 0; i < pd->num_clks; i++)
>>>> +                       clk_enable(pd->clks[i]);
>>>> +
>>>> +               if (!power_on) {
>>>> +                       /* FIXME: add code to save AXI_QOS */
>>>> +
>>>> +                       /* if powering down, idle request to NIU f=
irst */
>>>> +                       rockchip_pmu_set_idle_request(pd, true);
>>>> +               }
>>>> +
>>>> +               rockchip_do_pmu_set_power_domain(pd, power_on);
>>>> +
>>>> +               if (power_on) {
>>>> +                       /* if powering up, leave idle mode */
>>>> +                       rockchip_pmu_set_idle_request(pd, false);
>>>> +
>>>> +                       /* FIXME: add code to restore AXI_QOS */
>>>> +               }
>>>> +
>>>> +               for (i =3D pd->num_clks - 1; i >=3D 0; i--)
>>>> +                       clk_disable(pd->clks[i]);
>>>> +       }
>>>> +
>>>> +       mutex_unlock(&pd->pmu->mutex);
>>>> +       return 0;
>>>> +}
>>>> +
>>>> +static int rockchip_pd_power_on(struct generic_pm_domain *domain)
>>>> +{
>>>> +       struct rockchip_pm_domain *pd =3D to_rockchip_pd(domain);
>>>> +
>>>> +       return rockchip_pd_power(pd, true);
>>>> +}
>>>> +
>>>> +static int rockchip_pd_power_off(struct generic_pm_domain *domain=
)
>>>> +{
>>>> +       struct rockchip_pm_domain *pd =3D to_rockchip_pd(domain);
>>>> +
>>>> +       return rockchip_pd_power(pd, false);
>>>> +}
>>>> +
>>>> +static int rockchip_pd_attach_dev(struct generic_pm_domain *genpd=
,
>>>> +                                 struct device *dev)
>>>> +{
>>>> +       struct clk *clk;
>>>> +       int i;
>>>> +       int error;
>>>> +
>>>> +       dev_dbg(dev, "attaching to power domain '%s'\n", genpd->na=
me);
>>>> +
>>>> +       error =3D pm_clk_create(dev);
>>>> +       if (error) {
>>>> +               dev_err(dev, "pm_clk_create failed %d\n", error);
>>>> +               return error;
>>>> +       }
>>>> +
>>>> +       i =3D 0;
>>>> +       while ((clk =3D of_clk_get(dev->of_node, i++)) && !IS_ERR(=
clk)) {
>>> This loop adds all available device clocks to the PM clock list. I
>>> wonder if this could be considered as a common thing and if so, we
>>> might want to extend the pm_clk API with this.
>>
>> There are several reasons as follows:
>>
>>      Firstly, the clocks need be turned off to save power when
>>      the system enter the suspend state. So we need to enumerate the=
 clocks
>>      in the dts. In order to power domain can turn on and off.
>>
>>      Secondly, the reset-circuit should reset be synchronous on rk32=
88, then
>> sync revoked.
>>      So we need to enable clocks of all devices.
> I think you misinterpreted my previous answer. Instead of fetching al=
l
> clocks for a device and manually create the pm_clk list as you do
> here, I was suggesting to make this a part of the pm clk API.
>
> I would happily support such an API, but I can't tell what the other
> maintainers think.

Sorry, this is my misunderstanding.

Here, I agree your point. I will glad to use it if you support such an =
API.
I will send patch v16 with it if you have the implementation code.

>>>> +               dev_dbg(dev, "adding clock '%s' to list of PM cloc=
ks\n",
>>>> +                       __clk_get_name(clk));
>>>> +               error =3D pm_clk_add_clk(dev, clk);
>>>> +               clk_put(clk);
>>>> +               if (error) {
>>>> +                       dev_err(dev, "pm_clk_add_clk failed %d\n",
>>>> error);
>>>> +                       pm_clk_destroy(dev);
>>>> +                       return error;
>>>> +               }
>>>> +       }
>>>> +
>>>> +       return 0;
>>>> +}
>>>> +
> [...]
>
>>>> +
>>>> +static int rockchip_pm_add_one_domain(struct rockchip_pmu *pmu,
>>>> +                                     struct device_node *node)
>>>> +{
>>>> +       const struct rockchip_domain_info *pd_info;
>>>> +       struct rockchip_pm_domain *pd;
>>>> +       struct clk *clk;
>>>> +       int clk_cnt;
>>>> +       int i;
>>>> +       u32 id;
>>>> +       int error;
>>>> +
>>>> +       error =3D of_property_read_u32(node, "reg", &id);
>>>> +       if (error) {
>>>> +               dev_err(pmu->dev,
>>>> +                       "%s: failed to retrieve domain id (reg): %=
d\n",
>>>> +                       node->name, error);
>>>> +               return -EINVAL;
>>>> +       }
>>>> +
>>>> +       if (id >=3D pmu->info->num_domains) {
>>>> +               dev_err(pmu->dev, "%s: invalid domain id %d\n",
>>>> +                       node->name, id);
>>>> +               return -EINVAL;
>>>> +       }
>>>> +
>>>> +       pd_info =3D &pmu->info->domain_info[id];
>>>> +       if (!pd_info) {
>>>> +               dev_err(pmu->dev, "%s: undefined domain id %d\n",
>>>> +                       node->name, id);
>>>> +               return -EINVAL;
>>>> +       }
>>>> +
>>>> +       clk_cnt =3D of_count_phandle_with_args(node, "clocks",
>>>> "#clock-cells");
>>>> +       pd =3D devm_kzalloc(pmu->dev,
>>>> +                         sizeof(*pd) + clk_cnt * sizeof(pd->clks[=
0]),
>>>> +                         GFP_KERNEL);
>>>> +       if (!pd)
>>>> +               return -ENOMEM;
>>>> +
>>>> +       pd->info =3D pd_info;
>>>> +       pd->pmu =3D pmu;
>>>> +
>>>> +       for (i =3D 0; i < clk_cnt; i++) {
>>> This loop is similar to the one when creates the PM clock list in t=
he
>>> rockchip_pd_attach_dev().
>>>
>>> What's the reason you don't want to use pm clk for these clocks?
>>>
>> Ditto.
> I don't follow. Can't you do the exact same thing via the pm clk API,
> can you please elaborate!?
>

Although I'm glad to use the pm clk API, something to prevent that.

As perivous versions told about:

At the moment, all the device clocks being listed in the power-domains=20
itself,
I know someone wish was to get the clocks by reading the clocks from th=
e=20
device nodes,

I think reading the clocks from the devices if we via the pm clk API.
I concerned that we can't ensure the consumption enough good during the=
=20
suspend state.

Meanwhile, as the pervious patch v7 said:

     the clocks need be turned off to save power when the system enter=20
the suspend state.
So we need to enumerate the clocks in the dts. In order to power domain=
=20
can turn on and off.

     the reset-circuit should reset be synchronous on rk3288, then sync=
=20
revoked.
So we need to enable clocks of all devices.

>>>> +               clk =3D of_clk_get(node, i);
>>>> +               if (IS_ERR(clk)) {
>>>> +                       error =3D PTR_ERR(clk);
>>>> +                       dev_err(pmu->dev,
>>>> +                               "%s: failed to get clk %s (index %=
d):
>>>> %d\n",
>>>> +                               node->name, __clk_get_name(clk), i=
,
>>>> error);
>>>> +                       goto err_out;
>>>> +               }
>>>> +
>>>> +               error =3D clk_prepare(clk);
>>>> +               if (error) {
>>>> +                       dev_err(pmu->dev,
>>>> +                               "%s: failed to prepare clk %s (ind=
ex %d):
>>>> %d\n",
>>>> +                               node->name, __clk_get_name(clk), i=
,
>>>> error);
>>>> +                       clk_put(clk);
>>>> +                       goto err_out;
>>>> +               }
>>>> +
>>>> +               pd->clks[pd->num_clks++] =3D clk;
>>>> +
>>>> +               dev_dbg(pmu->dev, "added clock '%s' to domain '%s'=
\n",
>>>> +                       __clk_get_name(clk), node->name);
>>>> +       }
>>>> +
>>>> +       error =3D rockchip_pd_power(pd, true);
>>>> +       if (error) {
>>>> +               dev_err(pmu->dev,
>>>> +                       "failed to power on domain '%s': %d\n",
>>>> +                       node->name, error);
>>>> +               goto err_out;
>>>> +       }
>>>> +
>>>> +       pd->genpd.name =3D node->name;
>>>> +       pd->genpd.power_off =3D rockchip_pd_power_off;
>>>> +       pd->genpd.power_on =3D rockchip_pd_power_on;
>>>> +       pd->genpd.attach_dev =3D rockchip_pd_attach_dev;
>>>> +       pd->genpd.detach_dev =3D rockchip_pd_detach_dev;
>>>> +       pd->genpd.dev_ops.start =3D rockchip_pd_start_dev;
>>>> +       pd->genpd.dev_ops.stop =3D rockchip_pd_stop_dev;
>>> Instead of assigning the ->stop|start() callbacks, which do
>>> pm_clk_suspend|resume(), just set the genpd->flags to
>>> GENPD_FLAG_PM_CLK, and genpd will fix this for you.
>>>
>> Ditto.
> Again, I don't follow. Here is what goes on:
>
> rockchip_pd_start_dev() calls pm_clk_resume() and
> rockchip_pd_stop_dev() calls pm_clk_suspend().
> Instead of assigning the below callbacks...
>
> pd->genpd.dev_ops.start =3D rockchip_pd_start_dev;
> pd->genpd.dev_ops.stop =3D rockchip_pd_stop_dev;
>
> ... just use GENPD_FLAG_PM_CLK and let genpd deal with the calls to
> pm_clk_suspend|resume().

Yes, you are right.
Done, fixed in next patch v16.

Thanks!

Caesar
>>
>>>> +       pm_genpd_init(&pd->genpd, NULL, false);
>>>> +
>>>> +       pmu->genpd_data.domains[id] =3D &pd->genpd;
>>>> +       return 0;
>>>> +
>>>> +err_out:
>>>> +       while (--i >=3D 0) {
>>>> +               clk_unprepare(pd->clks[i]);
>>>> +               clk_put(pd->clks[i]);
>>>> +       }
>>>> +       return error;
>>>> +}
>>>> +
> [...]
>
> Kind regards
> Uffe
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
