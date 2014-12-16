From: Eddie Huang <eddie.huang@mediatek.com>
Subject: Re: [PATCH 3/4] arm64: dts: Add mediatek MT8173 SoC and evaluation
 board dts and Makefile
Date: Tue, 16 Dec 2014 16:46:55 +0800
Message-ID: <1418719615.8392.17.camel@mtksdaap41>
References: <1418208602-35584-1-git-send-email-eddie.huang@mediatek.com>
 <1418208602-35584-4-git-send-email-eddie.huang@mediatek.com>
 <20141211180245.GE28150@leverpostej> <1418371705.423.31.camel@mtksdaap41>
 <20141215125932.GF462@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20141215125932.GF462@leverpostej>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, louis.yu@mediatek.com, Catalin Marinas <Catalin.Marinas@arm.com>, Olof Johansson <olof@lixom.net>, Will Deacon <Will.Deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Robert Richter <rrichter@cavium.com>, "srv_heupstream@mediatek.com" <srv_heupstream@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Joe.C" <yingjoe.chen@mediatek.com>, Thomas Gleixner <tglx@linutronix.de>, Mark Brown <broonie@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "yh.chen@mediatek.com" <yh.chen@mediatek.com>
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, 2014-12-15 at 12:59 +0000, Mark Rutland wrote:
> On Fri, Dec 12, 2014 at 08:08:25AM +0000, Eddie Huang wrote:
> > Hi Mark,
> > 
> > On Thu, 2014-12-11 at 18:02 +0000, Mark Rutland wrote:
> > > Hi,
> > > 
> > > On Wed, Dec 10, 2014 at 10:50:01AM +0000, Eddie Huang wrote:
> > > > Add device tree support for MT8173 SoC and evalutaion board based on it.
> > > > 
> > 
> > > > +
> > > > +	psci {
> > > > +		compatible = "arm,psci-0.2";
> > > > +		method = "smc";
> > > > +	};
> > > 
> > > What are you using as your PSCI 0.2 implementation?
> > > 
> > > Is it fully compliant? (e.g. are the reset and power off functions
> > > implemented, may CPU0 be hotplugged)?
> > > 
> > > Given only portions of the GIC seem to be described below, what
> > > exception level is your kernel entered at? Per the spec it should be
> > > EL2, but given the brokenness below with the GIC I'm suspicious.
> > > 
> > 
> > Currently we only implement CPU boot, no power off, no CPU0 hotplug
> > either. And enter kernel at EL2. Actually, we run ATF in EL3, then
> > switch to EL2 to run lk and kernel.
> 
> Ok. In the absence of CPU_OFF, this is not yet a conforming PSCI 0.2
> implementation, so I'm wary of marking this as PSCI 0.2 until that is
> the case. Any attempt to power of CPUs will hit a BUG() in cpu_die(),
> and we don't want that.

We are still developing PSCI related functions, CPU_ON, CPU_OFF,
CPU_SUSPEND are ready, others are going. PSCI 0.2 is our target although
lacks some implements

> 
> Is CPU0 hotplug planned?

No

> 
> If not, does your PSCI implementation report CPU0 as
> non-hotpluggable via MIGRATE_INFO_TYPE reporting a UP not migratable
> trusted OS (and MIGRATE_INFO_UP_CPU reporting CPU0 as the resident CPU)?
> 
Will check whether add this

> Are SYSTEM_OFF and SYSTEM_RESET available?

No yet

> 
> Thanks,
> Mark.

Since we miss some PSCI-0.2 implements, I don't know whether I should
remove PSCI stuff in this patch.
