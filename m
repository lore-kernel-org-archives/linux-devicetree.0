From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v4 0/5] cpufreq: Add imx-cpufreq-dt driver for speed
 grading
Date: Mon, 20 May 2019 15:43:51 +0530
Message-ID: <20190520101351.huda4rmpdzaegnj7@vireshk-i7>
References: <cover.1557742902.git.leonard.crestez@nxp.com>
 <20190514071322.avosfk4fzz2hzzx6@vireshk-i7>
 <20190520071417.GU15856@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190520071417.GU15856@dragon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, Abel Vesa <abel.vesa@nxp.com>, Anson Huang <anson.huang@nxp.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Jacky Bai <ping.bai@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Leonard Crestez <leonard.crestez@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On 20-05-19, 15:14, Shawn Guo wrote:
> On Tue, May 14, 2019 at 12:43:22PM +0530, Viresh Kumar wrote:
> > On 13-05-19, 11:01, Leonard Crestez wrote:
> > > Right now in upstream imx8m cpufreq support just lists a common subset
> > > of OPPs because the higher ones should only be attempted after checking
> > > speed grading in fuses.
> > > 
> > > Driver reads from nvmem and calls dev_pm_opp_set_supported_hw before
> > > registering cpufreq-dt.
> > 
> > Who will apply patches 3-5 ?
> 
> Me.  Will apply them after the first two get applied.

Applied just now.

-- 
viresh
