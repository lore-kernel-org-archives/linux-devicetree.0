From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH] ARM: kernel: DT cpu map validity check helper function
Date: Fri, 11 Jan 2013 17:20:12 +0000
Message-ID: <20130111172012.GG30538@e102568-lin.cambridge.arm.com>
References: <1357921058-11322-1-git-send-email-lorenzo.pieralisi@arm.com>
 <20130111163057.GE23505@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20130111163057.GE23505@n2100.arm.linux.org.uk>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Mark Rutland <Mark.Rutland@arm.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Pawel Moll <Pawel.Moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Tony Lindgren <tony@atomide.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Magnus Damm <magnus.damm@gmail.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, David Brown <davidb@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Hiroshi Doyu <hdoyu@nvidia.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 11, 2013 at 04:30:57PM +0000, Russell King - ARM Linux wrote:
> On Fri, Jan 11, 2013 at 04:17:38PM +0000, Lorenzo Pieralisi wrote:
> > This patch implements a helper function that platforms can call to check
> > whether DT based cpu map initialization and cores count were completed
> > successfully.
> 
> Umm, are you sure this works?  Two problems here:
> - the kernel boot marks the booting CPU (in our case, CPU0) as present,
>   possible and online before arch code gets called.  smp_init_cpus()
>   will be called with the maps already initialized per that.

Gah, my bad, you are definitely right.

> - this really needs to be paired with a patch showing how you intend it
>   to be used; merely adding the helper without any sign of it being used
>   means it's just bloat which may not end up being used.

Ok, that's a fair point, I will ask to get it merged with an implementation
that relies on it, showing its usage.

Thanks for the review,
Lorenzo
