From: Roger Lu <roger.lu@mediatek.com>
Subject: Re: [PATCH 6/8] PM / OPP: Support adjusting OPP voltages at runtime
Date: Mon, 29 Jul 2019 11:39:15 +0800
Message-ID: <1564371555.18434.11.camel@mtksdaap41>
References: <1557997725-12178-1-git-send-email-andrew-sh.cheng@mediatek.com>
 <1557997725-12178-7-git-send-email-andrew-sh.cheng@mediatek.com>
 <20190520044704.unftq6q5vy73z5bo@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190520044704.unftq6q5vy73z5bo@vireshk-i7>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Viresh Kumar <viresh.kumar@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>, Andrew-sh Cheng =?UTF-8?Q?=28=E9=84=AD=E5=BC=8F=E5=8B=B3=29?= <andrew-sh.cheng@mediatek.com>, srv_heupstream <srv_heupstream@mediatek.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, yt.lee@mediatek.com, Chanwoo Choi <cw00.choi@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, Fan Chen =?UTF-8?Q?=28=E9=99=B3=E5=87=A1=29?= <fan.chen@mediatek.com>, "devicetree@vger.kernel.org" <devicetree>
List-Id: devicetree@vger.kernel.org

Dear Stephen Boyd,

This patch is derived from [1]. Please kindly shares the suggestion to
us. Thanks very much.

[1]: https://lore.kernel.org/patchwork/patch/599279/

Dear Viresh,

I followed _opp_set_availability() coding style to refine
dev_pm_opp_adjust_voltage() from this patch. Is this refinement suitable
for OPP core? Thanks a lot.

On Mon, 2019-05-20 at 12:47 +0800, Viresh Kumar wrote:
> On 16-05-19, 17:08, Andrew-sh.Cheng wrote:
> > From: Stephen Boyd <sboyd@codeaurora.org>
> > 
> > On some SoCs the Adaptive Voltage Scaling (AVS) technique is
> > employed to optimize the operating voltage of a device. At a
> > given frequency, the hardware monitors dynamic factors and either
> > makes a suggestion for how much to adjust a voltage for the
> > current frequency, or it automatically adjusts the voltage
> > without software intervention. Add an API to the OPP library for
> > the former case, so that AVS type devices can update the voltages
> > for an OPP when the hardware determines the voltage should
> > change. The assumption is that drivers like CPUfreq or devfreq
> > will register for the OPP notifiers and adjust the voltage
> > according to suggestions that AVS makes.
> > 
> > This patch is devired from [1] submitted by Stephen.
> > [1] https://lore.kernel.org/patchwork/patch/599279/
> > 
> > Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> > Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> > ---
> >  drivers/opp/core.c     | 78 ++++++++++++++++++++++++++++++++++++++++++++++++++
> >  include/linux/pm_opp.h | 11 +++++++
> >  2 files changed, 89 insertions(+)
> 
> This is an rcu implementation which got removed long back from OPP core. Please
> align this with the latest changes.
> 


/**
 * dev_pm_opp_adjust_voltage() - helper to change the voltage of an OPP
 * @dev:		device for which we do this operation
 * @freq:		OPP frequency to adjust voltage of
 * @u_volt:		new OPP voltage
 *
 * Return: -EINVAL for bad pointers, -ENOMEM if no memory available for
the
 * copy operation, returns 0 if no modifcation was done OR modification
was
 * successful.
 */
int dev_pm_opp_adjust_voltage(struct device *dev, unsigned long freq,
			      unsigned long u_volt)
{
	struct opp_table *opp_table;
	struct dev_pm_opp *tmp_opp, *opp = ERR_PTR(-ENODEV);
	int r = 0;

	/* Find the opp_table */
	opp_table = _find_opp_table(dev);
	if (IS_ERR(opp_table)) {
		r = PTR_ERR(opp_table);
		dev_warn(dev, "%s: Device OPP not found (%d)\n", __func__, r);
		return r;
	}

	mutex_lock(&opp_table->lock);

	/* Do we have the frequency? */
	list_for_each_entry(tmp_opp, &opp_table->opp_list, node) {
		if (tmp_opp->rate == freq) {
			opp = tmp_opp;
			break;
		}
	}

	if (IS_ERR(opp)) {
		r = PTR_ERR(opp);
		goto adjust_unlock;
	}

	/* Is update really needed? */
	if (opp->supplies->u_volt == u_volt)
		goto adjust_unlock;

	opp->supplies->u_volt = u_volt;

	dev_pm_opp_get(opp);
	mutex_unlock(&opp_table->lock);

	/* Notify the voltage change of the OPP */
	blocking_notifier_call_chain(&opp_table->head,
OPP_EVENT_ADJUST_VOLTAGE,
				     opp);

	dev_pm_opp_put(opp);
	goto adjust_put_table;

adjust_unlock:
	mutex_unlock(&opp_table->lock);
adjust_put_table:
	dev_pm_opp_put_opp_table(opp_table);
	return r;
}

Sincerely,
Roger Lu.
