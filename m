From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Subject: L2x0 OF properties do not include interrupt #
Date: Wed, 10 Aug 2011 16:09:56 +0200
Message-ID: <201108101609.56995.arnd@arndb.de>
References: <000201cc575b$c1229010$4367b030$@rutland@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <000201cc575b$c1229010$4367b030$@rutland@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux@arm.linux.org.uk, Will Deacon <Will.Deacon@arm.com>, devicetree-discuss@lists.ozlabs.org, 'Barry Song' <21cnbao@gmail.com>, linux-kernel@vger.kernel.org, workgroup.linux@csr.com, 'Grant Likely' <grant.likely@secretlab.ca>, weizeng.he@csr.com, 'Olof Johansson' <olof@lixom.net>, tglx@linutronix.de, 'Rob Herring' <rob.herring@calxeda.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wednesday 10 August 2011, Mark Rutland wrote:

> I realise I'm a bit late to the party here, but I'd like to propose adding an
> optional interrupt parameter to the binding. I'm not aware of any
> implementations which use separate interrupts, but given the binding
> seems to be generic across L2CC implementations (and is not limited simply to
> the L2x0), having a list rather than a single interrupt may be appropriate for
> someone.

Sounds good, thanks for pointing this out.

How many possible interrupt sources are there? If there is only a small number
of those (e.g. at most 4), we might just list all of them and register
them from the driver even if they are all the same.

> This would boil down to (for the moment) a Documentation change along the lines of:
> 
> > diff --git a/Documentation/devicetree/bindings/arm/l2cc.txt b/Documentation/devicetree/bindings/arm/l2cc.txt
> > index f50e021..d4b387b 100644
> > --- a/Documentation/devicetree/bindings/arm/l2cc.txt
> > +++ b/Documentation/devicetree/bindings/arm/l2cc.txt
> > @@ -28,6 +28,7 @@ Optional properties:
> >  - arm,filter-ranges : <start length> Starting address and length of window to
> >    filter. Addresses in the filter window are directed to the M1 port. Other
> >    addresses will go to the M0 port.
> > +- interrupt : A combined interrupt.
> >  
> >  Example:
> >  
> > @@ -39,4 +40,5 @@ L2: cache-controller {
> >          arm,filter-latency = <0x80000000 0x8000000>;
> >          cache-unified;
> >          cache-level = <2>;
> > +        interrupt = <45>;
> >  };
> 
> Any thoughts?

Do we also need to document an interrupt-parent property, or is that implied?

	Arnd
