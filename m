From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH 10/10] clk: mvebu: Add the peripheral clock driver for Armada 3700
Date: Fri, 08 Jul 2016 01:12:42 +0200
Message-ID: <87shvlujo5.fsf@free-electrons.com>
References: <1465565018-14172-1-git-send-email-gregory.clement@free-electrons.com>
	<1465565018-14172-11-git-send-email-gregory.clement@free-electrons.com>
	<20160630200007.GB1521@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160630200007.GB1521@codeaurora.org> (Stephen Boyd's message of
	"Thu, 30 Jun 2016 13:00:07 -0700")
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>, Romain Perier <romain.perier@free-electrons.com>, Omri Itach <omrii@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, Shadi Ammouri <shadi@marvell.com>
List-Id: devicetree@vger.kernel.org

Hi Stephen,
 
 On jeu., juin 30 2016, Stephen Boyd <sboyd@codeaurora.org> wrote:

>> +
>> +	spin_lock_init(&driver_data->lock);
>> +
>> +	for (i = 0; i < num_periph; i++) {
>> +		struct clk *clk = driver_data->clk_data.clks[i];
>> +
>> +		if (armada_3700_add_composite_clk(&data[i], parent_name, reg,
>> +						  &driver_data->lock, dev, clk))
>> +			dev_err(dev, "Can't register periph clock %s\n",
>> +			       data[i].name);
>> +	}
>> +
>> +	ret = of_clk_add_provider(np, of_clk_src_onecell_get,
>> +				  &driver_data->clk_data);
>> +	if (ret) {
>> +		for (i = 0; i < num_periph; i++)
>> +			clk_unregister(driver_data->clk_data.clks[i]);
>
> It would be nice if we had devm_* registration in composite
> clks
>

This comment is the only one I didn't take into account in the second
version I've just sent. I agree it would be nice and I am willing to add
it. However these last days I was very busy with the birth of my last
child: I managed to find time to write this second version in time to be
merged for 4.8 but not enough to add these new function. I will try to
send a patch for it next week.

Thanks for your review,

Gregory


-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
