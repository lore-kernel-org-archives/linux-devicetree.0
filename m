From: "Will Deacon" <will.deacon@arm.com>
Subject: RE: [RFC PATCH] ARM: pmu: add OF match support
Date: Wed, 9 Feb 2011 09:51:27 -0000
Message-ID: <25415.8251257197$1297245149@news.gmane.org>
References: <1297223617-19173-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1297223617-19173-1-git-send-email-robherring2@gmail.com>
Content-Language: en-gb
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: 'Rob Herring' <robherring2@gmail.com>, grant.likely@secretlab.ca
Cc: devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

> Add OF match table to enable OF style driver binding. The dts entry is like
> this:
> 
> pmu {
> 	compatible = "arm,pmu";
> 	interrupts = <100 101>;
> };
> 
> The use of pdev->id as an index breaks with OF device binding. Change to use
> a counter instead. If more than 1 pmu device is ever really supported, a
> better solution to match users with particular pmu is probably needed.

We will want to support multiple PMU devices in the near future but
this is currently blocked on userspace issues. One such device would
be the event counters on the PL310, which could be used to complement
the CPU PMU on the Cortex-A9.

I don't like the idea of a counter as it forces platforms to register
their devices in a specific order. Is it possible to separate different
types of PMU in the device tree and then have pmu.c work out what to do
with them?

Will
