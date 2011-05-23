From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 2/2] drivers/amba: probe via device tree
Date: Mon, 23 May 2011 16:47:41 +0100
Message-ID: <20110523154741.GC15153@n2100.arm.linux.org.uk>
References: <1305829704-11774-1-git-send-email-robherring2@gmail.com>
	<20110519233958.GB18181@ponder.secretlab.ca>
	<4DD66B8A.5040404@gmail.com> <201105201621.03801.arnd@arndb.de>
	<4DD68614.6090209@gmail.com>
	<a42f0c27-2811-4b68-bedf-7dfaa7bff6ff@VA3EHSMHS025.ehs.local>
	<20110521233558.GA17672@n2100.arm.linux.org.uk>
	<1007bcf2-7786-4f03-bff7-8d8af83939f1@VA3EHSMHS019.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1007bcf2-7786-4f03-bff7-8d8af83939f1-+Ck8Kgl/v0+GljRhoabY2LjjLBE8jN/0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 23, 2011 at 08:00:15AM -0700, Stephen Neuendorffer wrote:
> To be specific (whether this is 'to shreds' or not, you can decide).
> 
> 1. amba_bus expects the old ARM primcell ID. The one in the new A9 IP
> appears to be different. (b105900d instead of b105f00d)

Ok, so we can update to accept the A9 ID if the other IDs are compatible.
My guess is that its changed because the format of the IDs has changed,
and so it serves to distinguish the format.  At the moment I have no
information what so ever on this change of ID.

Some documentation on this would be useful.

> 2. Not only does amba_bus reference apb_pclk, but the driver directly
> references emu_src_clk. Neither of these has direct analogs on our
> hardware.

apb_pclk doesn't reference anything on most APB-using hardware either.
As I've already tried to explain, it's there for those who _do_ have
that, those being the ST Ericsson people, whose cores would lockup or
die in a kernel oops without it.

We're not having platform specific crap appearing in generic drivers,
so a _generic_ solution to the problem is to have everyone provide an
apb_pclk whether they have it or not.

emu_src_clk is there for the OMAP, and again if it's not required then
you just need to provide it with a dummy.

> 3. Implementing the workaround for 2 that you've described requires a
> dummy implementation of the 'standard' clock stuff, which is currently
> not implemented by mach-xilinx, because we simply haven't needed it. 
> Is the right solution here to add more machine-specific code?

In that case, why not just do this:

#define DEV_NAME "whatever_your_etb_device_is_called"

void clk_disable(struct clk *clk)
{
}

int clk_enable(struct clk *clk)
{
        return 0;
}

struct clk *clk_get(struct device *dev, const char *id)
{
        return dev && strcmp(dev_name(dev), DEV_NAME) == 0 ? NULL : ERR_PTR(-ENOENT);
}

void clk_put(struct clk *clk)
{
}

That results in very little actual code, and this is precisely one of the
reasons why I don't like having a huge big pile of code behind the clk API
implementing lots of useless stuff which platforms like yours just don't
want.

> 4. etm is old, we have ptm and other custom cores, but the driver
> combines the etm and etb functionality together. 

If we have hardware coming along which re-uses etb without etm, then the
driver needs to be re-worked to allow the 

> OK, some of this is trivial to fix, but some of it isn't.

Apart from (4), nothing you've said is anything but trivial.  So you
seem to be blaming the bus-level code for problems which have precisely
nothing to do with the bus-level code at all.

I really can't understand that, other than by assigning it to either
gross misunderstanding (due to not being able to separate the issues)
or maybe a religious or political agenda.
