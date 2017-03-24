From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 4/5] firmware: Add coreboot device tree binding
 documentation
Date: Fri, 24 Mar 2017 10:57:27 -0700
Message-ID: <20170324175727.GB119093@google.com>
References: <1490303069-13230-1-git-send-email-thierry.escande@collabora.com>
 <1490303069-13230-5-git-send-email-thierry.escande@collabora.com>
 <20170324122146.GE22771@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170324122146.GE22771@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Thierry Escande <thierry.escande-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

Julius can correct me if I'm wrong on any of this, but a quick note that
probably should have prefaced this:

These bindings were submitted years go

https://patchwork.ozlabs.org/patch/359672/
[PATCH] firmware: Add device tree binding for coreboot

discussed, and resubmitted seemingly according to several reviewers'
suggestions here

https://patchwork.kernel.org/patch/4362661/
[PATCH v2] firmware: Add device tree binding for coreboot

after which point we heard no response.

So these bindings have been baked into our coreboot firmware ever since
and are impossible to change on existing devices. It's *possible* we
could make modifications for new products, but it's really a non-starter
for this binding to be rejected at this point. (Or at least, if you want
this stuff to work in mainline for any Chromebook made in the last
several years.) If it's rejected, Chromebooks will just have to continue
shipping with forked drivers in our downstream tree.

Again, IMO that doesn't mean that this binding can't be improved or
augmented, but I think it's worth very serious consideration that the
legacy binding be considered and documented, even if it's noted as
"deprecated" or something like that.

On Fri, Mar 24, 2017 at 12:21:46PM +0000, Mark Rutland wrote:
> On Thu, Mar 23, 2017 at 10:04:28PM +0100, Thierry Escande wrote:
> > From: Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > 
> > This patch adds documentation describing a device tree binding for the
> > coreboot firmware. It is meant to be dynamically added during boot and
> > contains address definitions for the coreboot table (a list of
> > variable-sized descriptors providing information about various compile-
> > and run-time generated firmware parameters) and the CBMEM area (the
> > structure containing most run-time resident memory regions set up by
> > coreboot).
> > 
> > These definitions allow kernel drivers to easily access data contained
> > in and pointed to by these regions (such as coreboot's in-memory log).
> > (An example implementation can be seen in the following patch)
> > 
> > Signed-off-by: Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > Signed-off-by: Thierry Escande <thierry.escande-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> > ---
> >  .../devicetree/bindings/firmware/coreboot.txt      | 33 ++++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/firmware/coreboot.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/firmware/coreboot.txt b/Documentation/devicetree/bindings/firmware/coreboot.txt
> > new file mode 100644
> > index 0000000..4c95570
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/firmware/coreboot.txt
> > @@ -0,0 +1,33 @@
> > +COREBOOT firmware information
> > +
> > +The device tree node to communicate the location of coreboot's memory-resident
> > +bookkeeping structures to the kernel. Since coreboot itself cannot boot a
> > +device-tree-based kernel (yet), this node needs to be inserted by a
> > +second-stage bootloader (a coreboot "payload").
> > +
> > +Required properties:
> > + - compatible: Should be "coreboot"
> 
> Devicetree bindings should be in vendor,prefix format. This doesn't
> represent every aspect of coreboot, so it needs a more descriptive
> string.

Any particular suggestion? I suppose this is Google's interpretation of
coreboot tables, so "google,coreboot"?

> > + - reg: Address and length of the following two memory regions, in order:
> > +	1.) The coreboot table. This is a list of variable-sized descriptors
> > +	that contain various compile- and run-time generated firmware
> > +	parameters. It is identified by the magic string "LBIO" in its first
> > +	four bytes.
> > +	See coreboot's src/commonlib/include/commonlib/coreboot_tables.h for
> > +	details.
> 
> Given this is a memory region, it should be described under the
> reserved-memory node.

We've painted this bikeshed before. I guess the result was either to use
/reserved-memory or /memreserve/. I believe we've been using
/memreserve/. I suppose we could document a method to use either, but
the main "agreement" was to use the /firmware/coreboot path instead of
/reserved-memory/coreboot.

(And yes, I suppose /memreserve/ should be noted here.)

Brian

> > +	2.) The CBMEM area. This is a downward-growing memory region used by
> > +	coreboot to dynamically allocate data structures that remain resident.
> > +	It may or may not include the coreboot table as one of its members. It
> > +	is identified by a root node descriptor with the magic number
> > +	0xc0389481 that resides in the topmost 8 bytes of the area.
> > +	See coreboot's src/include/imd.h for details.
> 
> I beleive likewise here.
> 
> Thanks,
> Mark.
> 
> > +
> > +Example:
> > +	firmware {
> > +		ranges;
> > +
> > +		coreboot {
> > +			compatible = "coreboot";
> > +			reg = <0xfdfea000 0x264>,
> > +			      <0xfdfea000 0x16000>;
> > +		}
> > +	};
> > -- 
> > 2.7.4
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
