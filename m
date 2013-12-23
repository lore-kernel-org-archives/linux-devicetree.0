From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V7 0/8] ARM: OMAP3+: support cpufreq-cpu0 for device tree boot
Date: Mon, 23 Dec 2013 15:24:26 +0530
Message-ID: <CAOh2x==pT=ASrocV=dRKgFECyWbxN3pnzo9a4026szPGLXfbqg@mail.gmail.com>
References: <1381937948-27057-1-git-send-email-nm@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-omap-owner@vger.kernel.org>
In-Reply-To: <1381937948-27057-1-git-send-email-nm@ti.com>
Sender: linux-omap-owner@vger.kernel.org
To: Nishanth Menon <nm@ti.com>
Cc: =?ISO-8859-1?Q?Beno=EEt_Cousson?= <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org, Kevin Hilman <khilman@deeprootsystems.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-omap@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, sanjay.rawat@linaro.org, Amit Kucheria <amit.kucheria@linaro.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 16, 2013 at 9:09 PM, Nishanth Menon <nm@ti.com> wrote:
> PandaBoard-ES (OMAP4460): http://pastebin.com/qQCmA2ng

Hi Nishanth,

A colleague of mine (Sanjay), was trying mainline on panda board. And
wasn't able to get cpufreq-cpu0 working with it. Even your log also
reports its broken as it can't get any regulator information..

He is getting this:

cpufreq_cpu0: failed to get cpu0 regulator: -19
cpufreq_cpu0: failed to get cpu0 clock: -2
cpufreq-cpu0: probe of cpufreq-cpu0.0 failed with error -2

Can you please help him out?

--
viresh
