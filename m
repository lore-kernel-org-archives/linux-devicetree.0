From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: Subject: L2x0 OF properties do not include interrupt #
Date: Fri, 12 Aug 2011 10:02:48 +0100
Message-ID: <20110812090248.GI4775@n2100.arm.linux.org.uk>
References: <000201cc575b$c1229010$4367b030$@rutland@arm.com>
	<201108101624.27881.arnd@arndb.de>
	<20110810142808.GL10121@e102144-lin.cambridge.arm.com>
	<201108111505.11887.arnd@arndb.de>
	<20110811130910.GA10189@e102144-lin.cambridge.arm.com>
	<4E43F5F8.4060704@gmail.com>
	<20110811153800.GC5154@e102144-lin.cambridge.arm.com>
	<4E43FDFF.1080401@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4E43FDFF.1080401-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "workgroup.linux-kQvG35nSl+M@public.gmane.org" <workgroup.linux-kQvG35nSl+M@public.gmane.org>, "weizeng.he-kQvG35nSl+M@public.gmane.org" <weizeng.he-kQvG35nSl+M@public.gmane.org>, "tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org" <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 11, 2011 at 11:06:23AM -0500, Rob Herring wrote:
> No, either you have 1 interrupt and it is the combined one. or you have
> the 9? separate interrupts.  Having both combined and separate hooked up
> is a bit dumb, so I would not worry about that case. I would just define
> the event counter interrupt 1st as that is probably the primary use.
> Also, I think that was the only interrupt on the L2x0 controllers IIRC.
> 
> It's also conceivable that some of the interrupts get routed somewhere
> else rather than just into the GIC.

A lot of other primecells have the one-combined and individual interrupts.
So far, in the last 10 years, no one's used the individual interrupts in
Linux (or even afaik wired them up.)  Not with either the original ARM
primecells or the vendor modified ones.

That tells us something about the individual interrupts.
