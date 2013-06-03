From: "Jon Medhurst (Tixy)" <tixy@linaro.org>
Subject: Re: [RFC PATCH 2/3] drivers: mfd: vexpress: add timeout API to
 vexpress config interface
Date: Mon, 03 Jun 2013 13:03:50 +0100
Message-ID: <1370261030.16073.5.camel@linaro1.home>
References: <1369399986-15649-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1369399986-15649-3-git-send-email-lorenzo.pieralisi@arm.com>
 <1370254532.3407.36.camel@linaro1.home>
 <20130603115219.GA22821@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130603115219.GA22821@e102568-lin.cambridge.arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Pawel Moll <Pawel.Moll@arm.com>, Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, Achin Gupta <Achin.Gupta@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2013-06-03 at 12:52 +0100, Lorenzo Pieralisi wrote:
> On Mon, Jun 03, 2013 at 11:15:32AM +0100, Jon Medhurst (Tixy) wrote:
> > On Fri, 2013-05-24 at 13:53 +0100, Lorenzo Pieralisi wrote:
> > > In case some transactions to the Serial Power Controller (SPC) are lost owing
> > > to multiple operations handled at once by the M3 controller the OS needs to
> > > rely on a configuration API that can time out so that failures do not result
> > > in an unusable system.
> > > 
> > > This patch adds a timeout API to the vexpress config programming interface,
> > > and refactors the existing read/write functions so that they can be reused
> > > seamlessly on top of the newly defined API.
> > 
> > Isn't one of the main purposes of the config interface to serialise
> > transactions to the config bus, so why would the SPC be handling
> > multiple transactions at once? And if we can in fact loose transactions
> > doesn't this mean we get random failures in the system? E.g. if this
> > happened at boot in vexpress_spc_populate_opps then cpufreq will fail.
> 
> It has more to do with firmware carrying out background operations like
> powering up a cluster when a DVFS is requested.

Would that make it drop transactions or just take a longer time to get
around to servicing them?


> I can prepare a v2 with timeout interface dropped and extensively test that
> one, I do not think we should add the required complexity that you describe
> below for something that should never happen.
> 
> > Also, I think the code implementing timeouts is broken, see below.
> 
> I will have a look asap and repost a v2 accordingly.

Thanks, I'll hold off any further review the current patches then.

-- 
Tixy
