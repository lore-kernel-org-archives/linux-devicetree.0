From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH v3 2/3] PM / OPP: Initialize OPP table from device tree
Date: Wed, 5 Sep 2012 01:27:19 +0200
Message-ID: <201209050127.19919.rjw@sisk.pl>
References: <1344577046-14847-1-git-send-email-shawn.guo@linaro.org> <20120817005210.GD24242@S2101-09.ap.freescale.net> <502DA401.7040408@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <502DA401.7040408@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Shawn Guo <shawn.guo@linaro.org>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, Kevin Hilman <khilman@ti.com>, Nishanth Menon <nm@ti.com>, Shilimkar Santosh <santosh.shilimkar@ti.com>, Richard Zhao <richard.zhao@freescale.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Mike Turquette <mturquette@linaro.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

On Friday, August 17, 2012, Rob Herring wrote:
> On 08/16/2012 07:52 PM, Shawn Guo wrote:
> > On Thu, Aug 16, 2012 at 11:05:54PM +0200, Rafael J. Wysocki wrote:
> >> On Friday, August 10, 2012, Shawn Guo wrote:
> >>> With a lot of devices booting from device tree nowadays, it requires
> >>> that OPP table can be initialized from device tree.  The patch adds
> >>> a helper function of_init_opp_table together with a binding doc for
> >>> that purpose.
> >>>
> >>> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> >>
> >> I need an ACK from whoever maintains the DT bindings for that.
> >>
> > Rob, please?
> 
> Acked-by: Rob Herring <rob.herring@calxeda.com>

Applied to the linux-next branch of the linux-pm.git tree as v3.7 material.

Thanks,
Rafael

