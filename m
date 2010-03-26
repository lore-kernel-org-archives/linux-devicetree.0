From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: RFC: ARM Boot standard for passing device tree blob
Date: Fri, 26 Mar 2010 13:37:45 +0000
Message-ID: <1269610665.807.51.camel@e102109-lin.cambridge.arm.com>
References: <fa686aa41003240811l6f40c8cfs6fdad496facdc089@mail.gmail.com>
	<20100325210409.GH24984@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20100325210409.GH24984@n2100.arm.linux.org.uk>
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
Cc: devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, Grant Likely <grant.likely@secretlab.ca>, Rafal Jaworowski <raj@semihalf.com>, Philippe Robin <Philippe.Robin@arm.com>, David Rusling <David.Rusling@arm.com>, Jeremy Kerr <jeremy.kerr@canonical.com>, Dave P Martin <Dave.Martin@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, 2010-03-25 at 21:04 +0000, Russell King - ARM Linux wrote:
> On Wed, Mar 24, 2010 at 09:11:56AM -0600, Grant Likely wrote:
> > ===Required System State===
[...]
> > *IRQs disabled
> > *MMU off
> > *Instruction cache either on or off
> > *Data cache turned off
> 
> Would recommend saying "Data cache(s) turned off" so that L2 cache is
> included.

There are platforms where the L2 cache is turned on by the boot monitor
(secure monitor) and Linux has no control over it (I think OMAP).

-- 
Catalin
