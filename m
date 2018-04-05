From: Balbir Singh <bsingharora-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESEND v2 3/4] doc/devicetree: Persistent memory region bindings
Date: Thu, 5 Apr 2018 14:43:48 +1000
Message-ID: <20180405144348.141fd93f@gmail.com>
References: <20180403142415.30083-1-oohall@gmail.com>
 <20180403142415.30083-3-oohall@gmail.com>
 <CAPcyv4jW5H8A96MFD7-UazNSZq-t1_NfrChNB3p9=somdBpsNw@mail.gmail.com>
 <20180404220750.0436bbe1@gmail.com>
 <CAOSf1CGdKU4zQQauqo3UoNvKnKDMHteAEtsMWVtTG7T01csMbg@mail.gmail.com>
 <CAPcyv4if4un9mgFon4ttjKDYEtHC_GP6VoxUENp7YNS50T3afA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
In-Reply-To: <CAPcyv4if4un9mgFon4ttjKDYEtHC_GP6VoxUENp7YNS50T3afA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.01.org/mailman/options/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/linux-nvdimm/>
List-Post: <mailto:linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
List-Help: <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/linux-nvdimm>,
 <mailto:linux-nvdimm-request-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org?subject=subscribe>
Errors-To: linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
Sender: "Linux-nvdimm" <linux-nvdimm-bounces-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
To: Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linux-nvdimm <linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 4 Apr 2018 07:21:32 -0700
Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:

> On Wed, Apr 4, 2018 at 7:04 AM, Oliver <oohall-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > On Wed, Apr 4, 2018 at 10:07 PM, Balbir Singh <bsingharora-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:  
> >> On Tue, 3 Apr 2018 10:37:51 -0700
> >> Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> wrote:
> >>  
> >>> On Tue, Apr 3, 2018 at 7:24 AM, Oliver O'Halloran <oohall-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:  
> >>> > Add device-tree binding documentation for the nvdimm region driver.
> >>> >
> >>> > Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> >>> > Signed-off-by: Oliver O'Halloran <oohall-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >>> > ---
> >>> > v2: Changed name from nvdimm-region to pmem-region.
> >>> >     Cleaned up the example binding and fixed the overlapping regions.
> >>> >     Added support for multiple regions in a single reg.
> >>> > ---
> >>> >  .../devicetree/bindings/pmem/pmem-region.txt       | 80 ++++++++++++++++++++++
> >>> >  MAINTAINERS                                        |  1 +
> >>> >  2 files changed, 81 insertions(+)
> >>> >  create mode 100644 Documentation/devicetree/bindings/pmem/pmem-region.txt  
> >>>
> >>> Device-tree folks, does this look, ok?
> >>>
> >>> Oliver, is there any concept of a management interface to the
> >>> device(s) backing these regions? libnvdimm calls these "nmem" devices
> >>> and support operations like health status and namespace label
> >>> management.  
> >
> > It's something I'm planning on implementing as soon as someone gives
> > me some hardware that isn't hacked up lab crap. I'm posting this
> > version with just regions since people have been asking for something
> > in upstream even if it's not fully featured.
> >
> > Grumbling aside, the plan is to have separate drivers for the DIMM
> > type. Discovering DIMM devices happens via the normal discovery
> > mechanisms (e.g. an NVDIMM supporting the JEDEC interface is an I2C
> > device) and when binding to a specific DIMM device it registers a DIMM
> > descriptor structure and a ndctl implementation for that DIMM type
> > with of_pmem. When of_pmem binds to a region it can plug everything
> > into the region specific bus. There's a few details to work out, but I
> > think it's a reasonable approach.  
> 
> Yeah, that sounds reasonable. It would mean that your management
> interface would need to understand that nmems on different buses could
> potentially move to another bus after a reconfiguration, but that's
> not too much different than the ACPI case where nmems can join and
> leave regions after a reset / reconfig.
> 
> >> We would need a way to have nmem and pmem-regions find each other. Since we
> >> don't have the ACPI abstractions, the nmem region would need to add the
> >> ability for a driver to have a phandle to the interleaving and nmem properties.
> >>
> >> I guess that would be a separate driver, that would manage the nmem devices
> >> and there would be a way to relate the pmem and nmems. Oliver?  
> >
> > Yes, that's the plan.  
> 
> So Balbir, is that enough for an Acked-by for this device-tree proposal?

I don't see any major problems with the binding, but I think Oliver wanted
to send in a few clarifications based on a private discussion.

Balbir Singh.
