From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Fri, 29 May 2009 08:21:58 +1000
Message-ID: <1243549318.17903.9.camel@pasglop>
References: <20090527175609.GB31861@flint.arm.linux.org.uk>
	<1243496236.3171.140.camel@pasglop>
	<20090528091513.GA14789@n2100.arm.linux.org.uk>
	<20090528.025739.16559619.davem@davemloft.net>
	<gvlvcs$ub5$1@ger.gmane.org>
	<fa686aa40905280713u2b3ef5fvbe3d58ccdb629b60@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <fa686aa40905280713u2b3ef5fvbe3d58ccdb629b60-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2009-05-28 at 08:13 -0600, Grant Likely wrote:
> Two nodes are used to describe the device and a "phandle" is used to
> link them.  A device driver probe could be triggered (bind) against
> the i2c half of the device and follow the phandle to get the rest of
> the description.

One thing I wouldn't do though is to put "phandle" in the property
name :-) Just call it spi-interface.

Now, that's an option. And it works to a certain extent. But I do
understand the need in general to provide "methods". It's something
we don't solve (but then we don't make it worse than it was before).

I think the cleanest option might be named methods in the device-tree
for example, a device can have an "enable-method" property and a
"clock-method" property. The names would use the usual convention
of "manuf,name" to avoid clashes and could be registered by the
platform.

Now, it -does- somewhat deviates from the moto that the DT should
only contain OS agnostic HW representations, but appart for having
a full blown OF with actual method calls in each nodes I don't
see a nicer way at this stage.

Now, the methods could then take "informations" from the target DT.

For example, one could have a generic "simple-gpio-enable" method that
can be used as "enable-method" anywhere, as long as the target device
contains also a "enable-gpio" property that points to the actual GPIO
(and maybe an "enable-delay" while at it).

IE. We can provide a collection of "simple" methods that handle
the easy cases in library code.

I'm very much against putting actual function pointers in the tree
though as Jon Smirl proposed.

Cheers,
Ben.
