From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v2 1/4] cpufreq-dt: add clock domain and intermediate
 frequency support
Date: Thu, 5 Mar 2015 09:28:38 +0530
Message-ID: <CAKohpo=zPsezGs8rqVzx3ChQkavs5z7eFMMETe12pc2mjm-8OA@mail.gmail.com>
References: <1425458956-20665-1-git-send-email-pi-cheng.chen@linaro.org>
	<1425458956-20665-2-git-send-email-pi-cheng.chen@linaro.org>
	<CAKohpomw6iDRRMxgmOORzZVeW4h2-LzKOsUcdpUnANcxiAYm+A@mail.gmail.com>
	<CALx668XCh46yMLajThuVzba9RRSxf+tEkNuMP9J7w-=vsZN8-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <CALx668XCh46yMLajThuVzba9RRSxf+tEkNuMP9J7w-=vsZN8-Q@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
To: Pi-Cheng Chen <pi-cheng.chen@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "Joe.C" <yingjoe.chen@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, Howard Chen <ibanezchen@gmail.com>, Ashwin Chaugule <ashwin.chaugule@linaro.org>, Mike Turquette <mturquette@linaro.org>, Chen Fan <fan.chen@mediatek.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.k>
List-Id: devicetree@vger.kernel.org

On 5 March 2015 at 09:02, Pi-Cheng Chen <pi-cheng.chen@linaro.org> wrote:
> In the case of Mediatek SoC, the intermediate frequency might not be one entry
> of OPP table. To elaborate, the source clock node of the CPUs/Cluster on
> Mediatek SoC is a mux. The mux has several PLLs as parents. When we are
> doing CPU frequency scaling, the mux should re-parent to another stable PLL,
> wait until the original parent PLL become stable, and then switch back to the
> original parent. In this case, we could but we might not want the intermediate
> frequency as part of OPP table. Therefore I save intermediate_freq instead of
> intermediate frequency index in the cpufreq_dt_platform_datat struct.

Hmm, I remember that discussion. Okay leave it as is.

> BTW, is this case that intermediate frequency is not necessarily be one entry
> of OPP table supported in the OPPv2 bindings?

Not yet, but will add a property for that.
