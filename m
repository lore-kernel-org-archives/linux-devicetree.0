From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH 04/14] bus: mvebu-mbus: Add static window allocation to
 the DT binding
Date: Sat, 8 Jun 2013 19:45:06 -0600
Message-ID: <20130609014506.GB10027@obsidianresearch.com>
References: <1370623671-7748-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1370623671-7748-5-git-send-email-ezequiel.garcia@free-electrons.com>
 <201306072101.44694.arnd@arndb.de>
 <20130607200054.GA9010@obsidianresearch.com>
 <20130608183851.GB2354@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130608183851.GB2354@localhost>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jun 08, 2013 at 03:38:52PM -0300, Ezequiel Garcia wrote:

> > mbus {
> >    ranges = <0x012f0000 0  0xe8000000  0x8000000>
> >    devbus-bootcs {
> >        ranges = <0  0x012f0000 0  0x8000000>
> >    }
> > }
> > 
> > We shouldn't mangle the DT format just to make it convenient for
> > humans to write - if this is a major problem then I'd try to use the
> > preprocessor first.. There are several reasonable solutions down that
> > path, IMHO.
> > 
> 
> Right. I think we have two options here for laying the DT ranges.
> 
> 1) This is the proposal implied in the patchset I sent:
> 
> mbus {
> 	ranges = < we only put the internal-reg translation here>
> 	devbus-bootcs {
> 		ranges = <0 {target_id/attribute}
> 	{window_physical_base} {size}>
        ^^^^^^^^^^^^^^^^^^^^^^

This is the mangling I was referring to. It needs to be the offset
into the target, it can't be something else.

I understand your motivation, but this is not a good method of
encoding this in DT.

There is nothing especially wrong with updating the ranges at runtime,
but don't use the 2nd cell in the 2dw address to encode the desired
base address.

> Of course this looks much cleaner, but it forces a lot of duplication
> in the DT files. Now, if you see some of the recent patches we've been
> sending, I think this duplication is very error-prone, and it'll be a
> nightmare to maintain. Let me propose an example to show this
> duplication:

IMHO, dtc was not designed to do the sorts of include things that we
see in the boot/dt directory (eg a complex inheritance system) it is
not surprising we hit limitations in dtc.

It would be better to try and address them either by modding dtc (an
append directive of some kind), or using the preprocessor...

The preprocessor is already setup, here is a way to use it to solve
this problem:

 /* armada.dtsi */
 mbus {
 	ranges = < internal_regs_id 0 internal_regs_base internal_regs_size
 		         bootrom_id 0       bootrom_base  bootrom_size 
                   MBUS_BOARD_SPECIFIC_INFO>

 }
 
 /* armada-A.dts */
 define MBUS_BOARD_SPECIFIC_INFO devbus0_id 0       devbus0_base devbus0_size
 #include "armada.dtsi"

There are lots and lots of solutions using the pre-processor, please
take a look and find one that you feel works for you...

> It is precisely for this reason that I've decided to adopt option #1
> instead! Now, I'm not saying I like that option particularly.
> In fact it has a couple issues as well:

The main issue for me is that you can no longer refer to an offset in
a target, and that badly breaks several desirable DT layouts, eg on
Kirkwood the NAND case could be expressed like:

devbus {
  reg = <INTERNAL_REGS + 0x1234 0xABCD>;
  ranges = <0 DEVBUS_TARGET 0x1000>;
}

The NAND driver needs both internal regs and a target id in one
binding.

Which is why the last DW in the address must be the offset into the
target, not something else.

> What do you think?

IMHO, creating a correct FDT is of primary importance, the
maintainability of the text DT is secondary.

We can always improve the dtc envorionment (as was done recently by
adding the preprocessor), we cannot change 'DT ABI' once it it set.

Jason
