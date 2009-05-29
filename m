From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Fri, 29 May 2009 13:52:16 +1000
Message-ID: <1243569136.17903.27.camel@pasglop>
References: <20090527175609.GB31861@flint.arm.linux.org.uk>
	<1243496236.3171.140.camel@pasglop>
	<20090528091513.GA14789@n2100.arm.linux.org.uk>
	<20090528.025739.16559619.davem@davemloft.net>	<gvlvcs$ub5$1@ger.gmane.org>
	<fa686aa40905280713u2b3ef5fvbe3d58ccdb629b60@mail.gmail.com>
	<1243549318.17903.9.camel@pasglop>
	<20090529013908.GA7831@yookeroo.seuss>
	<4A1F4189.8060702@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <4A1F4189.8060702-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Cc: Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2009-05-29 at 09:59 +0800, Mitch Bradley wrote:
> I have an embeddable FCode interpreter that could be built into a 
> kernel.  Perhaps it's time to resurrect that.  The total size is on the 
> order of 50K with debugging tools included; probably more like 35K if 
> stripped down to just the essentials.

It's interesting... might be an option. I tend to prefer myself having
the methods be properly documented by the HW designer, and implemented
as C code in the kernel, for various reasons.

There are pro and cons to both approaches. We could define special
properties to embed f-code in the device-tree and run it that way, it's
probably a more business-friendly method :-) IE. It makes it possible
to completely avoid board specific code in the kernel, possibly making
it feasible to run existing distributions on new HW to a certain
extend by just updating those scripts.

But it comes with some drawbacks too... too often, this stuff will
replace good documentation, the scripts provided by the FW will be
busted in subtle ways that the kernel will have to work around, and thus
it can be used as a way to avoid documenting or open sourcing things and
obfuscating operations.

So at this stage, my personal preference goes for well defined methods
named by the device tree and implemented by the kernel natively. But
people are free to disagree with me on this one.

Cheers,
Ben.
