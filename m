From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 13/17] dt-bindings/interrupt-controller: update Marvell
 ICU bindings
Date: Sat, 28 Apr 2018 12:50:31 +0200
Message-ID: <20180428125031.6f46c448@windsurf>
References: <20180421135537.24716-1-miquel.raynal@bootlin.com>
 <20180421135537.24716-14-miquel.raynal@bootlin.com>
 <20180427204723.hz2ef5f7fhaid3aj@rob-hp-laptop>
 <20180428124204.3f305405@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180428124204.3f305405@xps13>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Gregory Clement <gregory.clement@bootlin.com>, Haim Boot <hayim@marvell.com>, Will Deacon <will.deacon@arm.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Antoine Tenart <antoine.tenart@bootlin.com>, devicetree@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Hanna Hawa <hannah@marvell.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hello,

On Sat, 28 Apr 2018 12:42:04 +0200, Miquel Raynal wrote:

> On Fri, 27 Apr 2018 15:47:23 -0500, Rob Herring <robh@kernel.org> wrote:
> 
> > On Sat, Apr 21, 2018 at 03:55:33PM +0200, Miquel Raynal wrote:  
> > > Change the documentation to reflect the new bindings used for Marvell
> > > ICU. This involves describing each interrupt group as a subnode of the
> > > ICU node. Each of them having their own compatible.    
> > 
> > Why?
> > 
> > This breaks compatibility.  
> 
> It does indeed.

Well, yes and no: your driver supports both the old and new binding, so
the compatibility is not broken. So, yes the binding is changed in an
incompatible way, but the driver continues to support the old binding.

Perhaps the binding documentation should continue to document the
legacy binding, mark it as still supported but deprecated.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
