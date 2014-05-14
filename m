From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v4 1/8] cpufreq: cpufreq-cpu0: allow use of optional boost
 mode frequencies
Date: Wed, 14 May 2014 11:50:42 +0530
Message-ID: <CAKohpomdjDDBjuPcAsaCcavvVgcX5977gDWyjeqmULadq_Pw8w@mail.gmail.com>
References: <1400029876-5830-1-git-send-email-thomas.ab@samsung.com>
	<1400029876-5830-2-git-send-email-thomas.ab@samsung.com>
	<CAKohpo=-duhJ-4iaqBG+eUCkoV_qwAu93FgUxmYS5erNTpLoMA@mail.gmail.com>
	<20140514081739.0b66587e@amdc2363>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <20140514081739.0b66587e@amdc2363>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Lukasz Majewski <l.majewski@samsung.com>
Cc: Thomas P Abraham <thomas.ab@samsung.com>, Thomas Abraham <ta.omasab@gmail.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mike Turquette <mturquette@linaro.org>, Shawn Guo <shawn.guo@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
List-Id: devicetree@vger.kernel.org

On 14 May 2014 11:47, Lukasz Majewski <l.majewski@samsung.com> wrote:
> I think that you can rely solely on the CPU_FREQ_BOOST_SW flag if the
> original author of cpufreq-cpu0.c don't mind.

We don't have to. struct cpufreq_driver: boost_supported is always available.
Just update it without any ugly #ifdefs ..
