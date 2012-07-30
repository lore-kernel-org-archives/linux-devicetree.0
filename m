From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 3/3] cpufreq: Add a generic cpufreq-cpu0 driver
Date: Mon, 30 Jul 2012 17:24:42 +0800
Message-ID: <20120730092440.GG31509@S2101-09.ap.freescale.net>
References: <1342713281-31114-1-git-send-email-shawn.guo@linaro.org>
 <1342713281-31114-4-git-send-email-shawn.guo@linaro.org>
 <20120727063334.GC3347@b20223-02.ap.freescale.net>
 <20120730081750.GC31509@S2101-09.ap.freescale.net>
 <20120730085040.GG3347@b20223-02.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120730085040.GG3347@b20223-02.ap.freescale.net>
Sender: cpufreq-owner@vger.kernel.org
To: Richard Zhao <richard.zhao@freescale.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Kevin Hilman <khilman@ti.com>, Nishanth Menon <nm@ti.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Mike Turquette <mturquette@linaro.org>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, cpufreq@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 30, 2012 at 04:50:41PM +0800, Richard Zhao wrote:
> I think the real problem here is OPP only provide exact voltage but
> regulator api needs a range.
> 
Maybe OPP will get improved on that when the real use cases occur.

> IIRC, cpufreq driver init is called every time a new cpu get online.
> So things that only needs to be done once can be put in module init.
> 
Ah, right.  Something should be moved to module init then.

-- 
Regards,
Shawn

