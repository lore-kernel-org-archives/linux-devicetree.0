From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Wed, 27 May 2009 21:21:07 -0600
Message-ID: <fa686aa40905272021w18a148caqd2b73c4448da2b28@mail.gmail.com>
References: <ed82fe3e0905270739k38018c87ka11f62c5977e45fb@mail.gmail.com>
	<87vdnm8sec.fsf@macbook.be.48ers.dk> <4A1D6901.2090508@freescale.com>
	<20090527175609.GB31861@flint.arm.linux.org.uk>
	<4A1D8FBA.6040802@freescale.com>
	<9e4733910905271213k7f4b93e7i7e6f2af24d85f@mail.gmail.com>
	<20090527192116.GA31110@n2100.arm.linux.org.uk>
	<20090527193927.GD30039@game.jcrosoft.org>
	<fa686aa40905271322x2f62c3dcs355374b30b4db3ca@mail.gmail.com>
	<20090527235704.GQ6805@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090527235704.GQ6805-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Robert Schwebel <r.schwebel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Janboe Ye <yuan-bo.ye-3WKxDLwmzFNWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Jon Smirl <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linux-arm-kernel-xIg/pKzrS19vn6HldHNs0ANdhmdF6hFW@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, May 27, 2009 at 5:57 PM, Robert Schwebel
<r.schwebel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> On Wed, May 27, 2009 at 02:22:50PM -0600, Grant Likely wrote:
>> 2) Driver binding mechanism: =A0device tree nodes usually have a
>> "compatible" property which is a list of strings. The first string
>> describes exactly what the device is (ie. "atmel,24c08") and an
>> optional list of other devices which it is register interface
>> backwards compatible with.
>
> This is a good example. The "exact" description above doesn't say
> anything about some of the details the driver needs to know. Here is the
> at24 driver:
>
> http://lxr.linux.no/linux+v2.6.29/include/linux/i2c/at24.h#L18
>
> Where do we get the page size & flags from?

It is inherent in the value "atmel,24c08".  Because the exact device
model is specified, the kernel can know what the page size and flags
are for that device.  OTOH, if it is appropriate for the device, then
the binding can be defined to include things like page size and flags
encoded explicitly in additional properties.

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
