From: Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCH v5 2/2] mailbox: introduce ARM SMC based mailbox
Date: Fri, 30 Aug 2019 02:50:05 +0000
Message-ID: <AM0PR04MB4481944FA435E252C786B73888BD0@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <1567004515-3567-1-git-send-email-peng.fan@nxp.com>
 <1567004515-3567-3-git-send-email-peng.fan@nxp.com>
 <20190828140217.GC21614@e107155-lin>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190828140217.GC21614@e107155-lin>
Content-Language: en-US
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "andre.przywara@arm.com" <andre.przywara@arm.com>, "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> Subject: Re: [PATCH v5 2/2] mailbox: introduce ARM SMC based mailbox
> 
> On Wed, Aug 28, 2019 at 03:03:02AM +0000, Peng Fan wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > This mailbox driver implements a mailbox which signals transmitted
> > data via an ARM smc (secure monitor call) instruction. The mailbox
> > receiver is implemented in firmware and can synchronously return data
> > when it returns execution to the non-secure world again.
> > An asynchronous receive path is not implemented.
> > This allows the usage of a mailbox to trigger firmware actions on SoCs
> > which either don't have a separate management processor or on which
> > such a core is not available. A user of this mailbox could be the SCP
> > interface.
> >
> > Modified from Andre Przywara's v2 patch
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore
> > .kernel.org%2Fpatchwork%2Fpatch%2F812999%2F&amp;data=02%7C01%7
> Cpeng.fa
> >
> n%40nxp.com%7Ca1e96c6b782d43b2cfb208d72bc05898%7C686ea1d3bc2b
> 4c6fa92cd
> >
> 99c5c301635%7C0%7C0%7C637025977487779923&amp;sdata=rzC%2B4Y1c
> q9Y3tSDFR
> > %2Fsvf5ktk7INP2rwXN%2BXdWCVjNs%3D&amp;reserved=0
> >
> > Cc: Andre Przywara <andre.przywara@arm.com>
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/mailbox/Kconfig           |   7 ++
> >  drivers/mailbox/Makefile          |   2 +
> >  drivers/mailbox/arm-smc-mailbox.c | 215
> > ++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 224 insertions(+)
> >  create mode 100644 drivers/mailbox/arm-smc-mailbox.c
> >
> 
> [...]
> 
> > +static int arm_smc_mbox_probe(struct platform_device *pdev) {
> > +	struct device *dev = &pdev->dev;
> > +	struct mbox_controller *mbox;
> > +	struct arm_smc_chan_data *chan_data;
> > +	const char *method;
> > +	bool mem_trans = false;
> > +	int ret, i;
> > +	u32 val;
> > +
> > +	if (!of_property_read_u32(dev->of_node, "arm,num-chans", &val)) {
> > +		if (!val) {
> > +			dev_err(dev, "invalid arm,num-chans value %u\n", val);
> > +			return -EINVAL;
> > +		}
> > +	} else {
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (!of_property_read_string(dev->of_node, "transports", &method)) {
> > +		if (!strcmp("mem", method)) {
> > +			mem_trans = true;
> > +		} else if (!strcmp("reg", method)) {
> > +			mem_trans = false;
> > +		} else {
> > +			dev_warn(dev, "invalid \"transports\" property: %s\n",
> > +				 method);
> > +
> > +			return -EINVAL;
> > +		}
> > +	} else {
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (!of_property_read_string(dev->of_node, "method", &method)) {
> > +		if (!strcmp("hvc", method)) {
> > +			invoke_smc_mbox_fn = __invoke_fn_hvc;
> > +		} else if (!strcmp("smc", method)) {
> > +			invoke_smc_mbox_fn = __invoke_fn_smc;
> > +		} else {
> > +			dev_warn(dev, "invalid \"method\" property: %s\n",
> > +				 method);
> > +
> > +			return -EINVAL;
> > +		}
> > +	} else {
> > +		return -EINVAL;
> > +	}
> > +
> > +	mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
> > +	if (!mbox)
> > +		return -ENOMEM;
> > +
> > +	mbox->num_chans = val;
> > +	mbox->chans = devm_kcalloc(dev, mbox->num_chans,
> sizeof(*mbox->chans),
> > +				   GFP_KERNEL);
> > +	if (!mbox->chans)
> > +		return -ENOMEM;
> > +
> > +	chan_data = devm_kcalloc(dev, mbox->num_chans, sizeof(*chan_data),
> > +				 GFP_KERNEL);
> > +	if (!chan_data)
> > +		return -ENOMEM;
> > +
> > +	for (i = 0; i < mbox->num_chans; i++) {
> > +		u32 function_id;
> > +
> > +		ret = of_property_read_u32_index(dev->of_node,
> > +						 "arm,func-ids", i,
> > +						 &function_id);
> 
> I missed it in binding but I thought we agreed to make this "arm,func-ids"
> a required property and not optional ?

Not sure Jassi is fine with it being a required property, but I could convert
it to a required property in V6.

Thanks,
Peng.

> 
> --
> Regards,
> Sudeep
