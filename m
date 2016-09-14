From: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 6/6] regulator: core: Prevent falling too fast
Date: Thu, 15 Sep 2016 05:35:01 +0800
Message-ID: <201609150519.RDMLD9EM%fengguang.wu@intel.com>
References: <1473871930-99603-6-git-send-email-mka@chromium.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="IS0zKkzwUGydFO0o"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1473871930-99603-6-git-send-email-mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kbuild-all-JC7UmRfGjtg@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matthias Kaehlcke <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Douglas,

[auto build test WARNING on regulator/for-next]
[also build test WARNING on v4.8-rc6 next-20160914]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
[Suggest to use git(>=2.9.0) format-patch --base=<commit> (or --base=auto for convenience) to record what (public, well-known) commit your patch series was built on]
[Check https://git-scm.com/docs/git-format-patch for more information]

url:    https://github.com/0day-ci/linux/commits/Matthias-Kaehlcke/regulator-core-Use-local-ops-variable-in-_regulator_do_set_voltage/20160915-005730
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
reproduce: make htmldocs

All warnings (new ones prefixed by >>):

>> include/linux/regulator/machine.h:170: warning: No description found for parameter 'slowest_decay_rate'
>> include/linux/regulator/machine.h:170: warning: No description found for parameter 'safe_fall_percent'

vim +/slowest_decay_rate +170 include/linux/regulator/machine.h

00c877c69 Laxman Dewangan      2013-09-18  154  	unsigned int enable_time;
31f8038f4 Matthias Kaehlcke    2016-09-14  155  	unsigned int settle_time_up;
31f8038f4 Matthias Kaehlcke    2016-09-14  156  	unsigned int settle_time_down;
171385d28 Douglas Anderson     2016-09-14  157  	unsigned int slowest_decay_rate;
171385d28 Douglas Anderson     2016-09-14  158  	unsigned int safe_fall_percent;
6f0b2c696 Yadwinder Singh Brar 2012-06-11  159  
670666b9e Laxman Dewangan      2016-03-02  160  	unsigned int active_discharge;
670666b9e Laxman Dewangan      2016-03-02  161  
2e7e65ce5 Wolfram Sang         2009-09-18  162  	/* constraint flags */
4c1184e85 Liam Girdwood        2008-04-30  163  	unsigned always_on:1;	/* regulator never off when system is on */
4c1184e85 Liam Girdwood        2008-04-30  164  	unsigned boot_on:1;	/* bootloader/firmware enabled regulator */
2e7e65ce5 Wolfram Sang         2009-09-18  165  	unsigned apply_uV:1;	/* apply uV constraint if min == max */
1653ccf4c Yadwinder Singh Brar 2013-06-29  166  	unsigned ramp_disable:1; /* disable ramp delay */
57f66b788 Stephen Boyd         2015-06-11  167  	unsigned soft_start:1;	/* ramp voltage slowly */
23c779b9f Stephen Boyd         2015-06-11  168  	unsigned pull_down:1;	/* pull down resistor when regulator off */
3a003baee Stephen Boyd         2015-07-17  169  	unsigned over_current_protection:1; /* auto disable on over current */
4c1184e85 Liam Girdwood        2008-04-30 @170  };
4c1184e85 Liam Girdwood        2008-04-30  171  
a5766f11c Liam Girdwood        2008-10-10  172  /**
a5766f11c Liam Girdwood        2008-10-10  173   * struct regulator_consumer_supply - supply -> device mapping
a5766f11c Liam Girdwood        2008-10-10  174   *
15c08f664 Axel Lin             2012-03-29  175   * This maps a supply name to a device. Use of dev_name allows support for
15c08f664 Axel Lin             2012-03-29  176   * buses which make struct device available late such as I2C.
c8e7e4640 Mark Brown           2008-12-31  177   *
40f9244f4 Mark Brown           2009-06-17  178   * @dev_name: Result of dev_name() for the consumer.

:::::: The code at line 170 was first introduced by commit
:::::: 4c1184e85cb381121a5273ea20ad31ca3faa0a4f regulator: machine driver interface

:::::: TO: Liam Girdwood <lg-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
:::::: CC: Liam Girdwood <lg-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--IS0zKkzwUGydFO0o
Content-Type: application/octet-stream
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--IS0zKkzwUGydFO0o--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
