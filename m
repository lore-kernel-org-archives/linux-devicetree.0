From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] ARM: DT: Add binding for GIC virtualization extentions
 (VGIC)
Date: Wed, 9 May 2012 20:47:06 +0000
Message-ID: <201205092047.06852.arnd@arndb.de>
References: <1336586277-28454-1-git-send-email-marc.zyngier@arm.com>
 <201205092027.50059.arnd@arndb.de>
 <37e096905f891fc6abdccf8977bd7447@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <37e096905f891fc6abdccf8977bd7447@localhost>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, david.vrabel@citrix.com, rob.herring@calxeda.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wednesday 09 May 2012, Marc Zyngier wrote:
> Ah, I see what you mean. But these registers and interrupt are actually
> only visible on the hypervizor side. The guest shouldn't see any of this.

Rihgt, that makes sense.

> I suppose we could have a "arm,has-virt-extensions" property in devices
> that implement the virtualization extensions (GIC, timers...).
> 
> What do you think?

Sounds good. I don't have a strong preference whether that should be a
property like you suggest or a separate "compatible" value, maybe Rob or
Grant can comment on what they prefer.

On the guest side, is it guaranteed that the virtual GIC looks like
a real GIC without those extensions? If the actual behavior depends on
the hypervisor, it might still make sense to add another flag in there
to tell that it's virtual, even if we don't require it for now.

	Arnd
