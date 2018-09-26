Return-Path: <SRS0=6++d=MI=nvidia.com=pdeschrijver@kernel.org>
Date: Wed, 26 Sep 2018 11:14:55 +0300
From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [RFC 14/14] dt-bindings: tegra: Add Tegra210 EMC binding
Message-ID: <20180926081455.GL7636@tbergstrom-lnx.Nvidia.com>
References: <1536955389-30442-1-git-send-email-pdeschrijver@nvidia.com>
 <1536955389-30442-15-git-send-email-pdeschrijver@nvidia.com>
 <5baa1ae9.1c69fb81.1ab9.1805@mx.google.com>
 <20180925121107.GJ7636@tbergstrom-lnx.Nvidia.com>
 <CAL_JsqLY93P52idTiD2b_WwgTc2+s9A24+TdUEQsUeaUDwGK7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAL_JsqLY93P52idTiD2b_WwgTc2+s9A24+TdUEQsUeaUDwGK7A@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: vkuruturi@nvidia.com, linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, daniel@octaforge.org, Andre Heider <a.heider@gmail.com>, swtcr0@gmail.com, linux-clk <linux-clk@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Tue, Sep 25, 2018 at 09:37:59AM -0500, Rob Herring wrote:
> On Tue, Sep 25, 2018 at 7:11 AM Peter De Schrijver
> <pdeschrijver@nvidia.com> wrote:
> >
> > On Mon, Sep 24, 2018 at 02:04:24PM -0700, Rob Herring wrote:
> > > On Fri, Sep 14, 2018 at 11:03:09PM +0300, Peter De Schrijver wrote:
> > > > Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> > >
> > > Needs a commit msg.
> > >
> > > > ---
> > > >  .../memory-controllers/nvidia,tegra210-emc.txt     | 448 +++++++++++++++++++++
> > > >  1 file changed, 448 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
> > > > new file mode 100644
> > > > index 0000000..1c52f47
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
> > > > @@ -0,0 +1,448 @@
> > > > +NVIDIA Tegra210 SoC EMC (external memory controller)
> > > > +====================================================
> > > > +
> > > > +Required properties :
> > > > +- compatible : Should be "nvidia,tegra21-emc", "nvidia,tegra124-emc".
> > > > +- reg : physical base address and length of the controller's registers.
> > > > +- nvidia,memory-controller : phandle of the MC driver.
> > >
> > > Huh? What is this block then?
> > >
> >
> > This is the EMC. The EMC handles the interface with the external DRAM chips.
> > The MC aggregates and schedules requests to the EMC. It also handles address
> > translation. See figure 33 of the TRM.
> 
> Sorry, but I hardly have time to go read TRM's for every binding.
> 
> Just explain what the MC is here and remove 'driver'.
> 
> > > > +- clocks : phandles of the possible source clocks
> > > > +- clock-names : names of the possible source clocks
> > > > +
> > > > +The node should contain a "emc-table" subnode for each supported RAM type
> > > > +(see field RAM_CODE in register PMC_STRAPPING_OPT_A), with its unit address
> > > > +being its RAM_CODE.
> > >
> > > Unit address is based on reg property.
> > >
> > > > +
> > > > +Required properties for "emc-table" nodes :
> > > > +- nvidia,ram-code : Should contain the value of RAM_CODE this timing set is
> > > > +used for.
> > > > +
> > > > +Each "emc-table" node should contain a "emc-table" subnode for every supported
> > > > +EMC clock rate. The "emc-table" subnodes should have the clock rate in kHz as
> > > > +their unit address.
> > > > +
> > > > +Required properties for "emc-table" nodes :
> > >
> > > Which emc-table nodes, the child or grand-child nodes?
> > >
> >
> > The child "emc-table" node.
> >
> > > > +- compatible  "nvidia,tegra21-emc-table", "nvidia,tegra210-emc-table"
> > >
> > > > +- nvidia,revision : revision of the parameter set used for this node. All
> > > > +                    nodes in the same "emc-table" should have the same revision
> > > > +- clock-frequency : frequency in kHz
> > > > +- nvidia,emc-min-mv : minimum voltage for this OPP
> > > > +- nvidia,gk20a-min-mv : minimum GPU voltage for this OPP
> > > > +- nvidia,source : clock source to be used for this OPP
> > >
> > > Is this memory timings/settings or OPPs? We have a binding for OPPs
> > > already.
> > >
> >
> > This is memory timings.
> >
> > > > +- nvidia,src-sel-reg : value of EMC CAR register to be used for this OPP
> > > > +- nvidia,needs-training : 1 if the OPP needs training at boot, 0 otherwise
> > > > +- nvidia,trained : 1 if initial training has been done by firmware, 0 otherwise
> > > > +- nvidia,periodic_training : 1 if the OPP needs periodic training, 0 otherwise
> > > > +- nvidia,trained_dram_clktree_c0d0u0 : training data word
> > > > +- nvidia,trained_dram_clktree_c0d0u1 : training data word
> > >
> > > [...]
> > >
> > > This is a huge list of properties. For all the things that are memory
> > > timings, is there really value to defining a property for each setting?
> > > Perhaps you should just define your own format and either make it a
> > > separate firmware file or include that file in the dtb.
> >
> > If it's a binary structure, how would this be passed given the bootloader has
> > to fill in the training information?
> 
> Perhaps training data makes sense to keep as DT properties, but it is
> not all training data, right? Things like a list of register
> initialization values do not sound like training data.
> 

No, those are per frequency timing settings, just like we have them for
Tegra124 and previous chips.

> I assume the the training data is read back from the h/w, can't the
> kernel just do that itself? Or the data is lost after init is
> complete?

The data is mostly lost. The training data also depends on the frequency, so
if it could be read back from the h/w, it would only be the data for the last
frequency which was trained.

Peter.
