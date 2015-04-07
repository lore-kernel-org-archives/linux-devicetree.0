From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: irqchip heirarchy DT "break" series awareness?
Date: Tue, 7 Apr 2015 14:37:04 +0100
Message-ID: <20150407133703.GF4394@leverpostej>
References: <20150406144647.GC7873@io.lakedaemon.net>
 <20150407115922.5d4c6233@free-electrons.com>
 <5523AFAF.6040000@arm.com>
 <20150407130638.GE7873@io.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20150407130638.GE7873@io.lakedaemon.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jason Cooper <jason@lakedaemon.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <Marc.Zyngier@arm.com>, "arm@kernel.org" <arm@kernel.org>, Olof Johansson <olof@lixom.net>, Thomas Gleixner <tglx@linutronix.de>, Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> > If the relationship between the GIC and the shadow interrupt controllers
> > had been described, we would have avoided breaking the compatibility. I
> > guess it was too tempting to reuse pre-DT mechanisms and to forget about
> > this entirely.
> 
> I'm not sure tempting is the right word.  Everyone has known since this
> project began that we were striving to describe the hardware.  I suspect
> the reason we got to where we are is that people *assumed* the code was
> describing the hardware, and so wrote bindings reflecting their
> understanding.  iow, we don't have enough hardware engineers reviewing
> bindings :-P

FWIW when routable-irqs was introduced I negatively reviewed it, stating
that it was backwards, and that the crossbar driver should request the
appropriate domain dynamically [1]. We _knew_ it was wrong at the time,
but people decided to ignore that review because it was easier to do
things in a broken way.

A more general issue is that people hack in the minimal amount of DT
parsing code to an existing driver and rely on platform data and code to
do the heavy lifting, rather than doing a clean break with DT (which
would highlight deficiencies in the bndings). You end up with the worst
of both worlds, because you depend on both an incomplete DT and
implementation-specific platform data/code.

Mark.

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2013-November/211530.html
