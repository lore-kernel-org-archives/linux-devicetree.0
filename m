From: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH RFC 2/9] OPP: Export a number of helpers to prevent code duplication
Date: Mon, 8 Jul 2019 11:28:36 +0800
Message-ID: <CAJMQK-gcBC=ZyscuHzOe4t6xQzviTYo9W9_DSsppoaTZuiEOcw@mail.gmail.com>
References: <20190328152822.532-1-sibis@codeaurora.org> <20190328152822.532-3-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190328152822.532-3-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sibi Sankar <sibis@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, andy.gross@linaro.org, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, georgi.djakov@linaro.org, bjorn.andersson@linaro.org, david.brown@linaro.org, Mark Rutland <mark.rutland@arm.com>, lkml <linux-kernel@vger.kernel.org>, linux-arm-msm-owner@vger.kernel.org, devicetree@vger.kernel.org, rnayak@codeaurora.org, Chanwoo Choi <cw00.choi@samsung.com>, linux-pm@vger.kernel.org, evgreen@chromium.org, daidavid1@codeaurora.org, dianders@chromium.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 28, 2019 at 3:28 PM Sibi Sankar <sibis@codeaurora.org> wrote:

> +
> +/* The caller must call dev_pm_opp_put() after the OPP is used */
> +struct dev_pm_opp *dev_pm_opp_find_opp_of_np(struct opp_table *opp_table,
> +                                            struct device_node *opp_np)
> +{
> +       return _find_opp_of_np(opp_table, opp_np);
> +}
Hi Sibi,

Though this is not the latest version, we've seen following issue:

We would get lockdep warnings on this:
[   79.068957] Call trace:
[   79.071396]  _find_opp_of_np+0xa0/0xa8
[   79.075136]  dev_pm_opp_find_opp_of_np+0x24/0x30
[   79.079744]  devfreq_passive_event_handler+0x304/0x51c
[   79.084872]  devfreq_add_device+0x368/0x434
[   79.089046]  devm_devfreq_add_device+0x68/0xb0
[   79.093480]  mtk_cci_devfreq_probe+0x108/0x158
[   79.097915]  platform_drv_probe+0x80/0xb0
[   79.101915]  really_probe+0x1b4/0x28c
[   79.105568]  driver_probe_device+0x64/0xfc
[   79.109655]  __driver_attach+0x94/0xcc
[   79.113395]  bus_for_each_dev+0x84/0xcc
[   79.117221]  driver_attach+0x2c/0x38
[   79.120788]  bus_add_driver+0x120/0x1f4
[   79.124614]  driver_register+0x64/0xf8
[   79.128355]  __platform_driver_register+0x4c/0x58
[   79.133049]  mtk_cci_devfreq_init+0x1c/0x24
[   79.137224]  do_one_initcall+0x1c0/0x3e0
[   79.141138]  do_initcall_level+0x1f4/0x224
[   79.145225]  do_basic_setup+0x34/0x4c
[   79.148878]  kernel_init_freeable+0x10c/0x194
[   79.153225]  kernel_init+0x14/0x100
[   79.156705]  ret_from_fork+0x10/0x18
[   79.160270] irq event stamp: 238006
[   79.163750] hardirqs last  enabled at (238005):
[<ffffffa71fdea0a4>] _raw_spin_unlock_irqrestore+0x40/0x84
[   79.173391] hardirqs last disabled at (238006):
[<ffffffa71f480e78>] do_debug_exception+0x70/0x198
[   79.182337] softirqs last  enabled at (237998):
[<ffffffa71f48165c>] __do_softirq+0x45c/0x4a4
[   79.190850] softirqs last disabled at (237987):
[<ffffffa71f4bc0d4>] irq_exit+0xd8/0xf8
[   79.198842] ---[ end trace 0e66a55077a0abab ]---

In _find_opp_of_np()[1], there's
lockdep_assert_held(&opp_table_lock);

[1] https://elixir.bootlin.com/linux/latest/source/drivers/opp/of.c#L75

But in governor passive.c#cpufreq_passive_register(), it call
dev_pm_opp_find_opp_of_np() directly, so it wouldn't access
opp_table_lock lock.

Another similar place is in dev_pm_opp_of_add_table(), most devfreq
would call this to get opp table.
dev_pm_opp_of_add_table
 -->   _opp_add_static_v2
    -->    _of_opp_alloc_required_opps  // would goes here if opp
table contains "required-opps" property.
        -->    _find_opp_of_np
cpufreq-map governor needs devfreq to have "required-opps" property.
So it would also trigger above lockdep warning.


The question is: Is lockdep_assert_held(&opp_table_lock); needed in
above use cases? Since they don't need to modify device and opp lists.

Thanks
