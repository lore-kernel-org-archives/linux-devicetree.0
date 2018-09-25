MIME-Version: 1.0
Date: Tue, 25 Sep 2018 09:45:12 -0500
References: <1536955389-30442-1-git-send-email-pdeschrijver@nvidia.com>
	<1536955389-30442-15-git-send-email-pdeschrijver@nvidia.com>
	<5baa1ae9.1c69fb81.1ab9.1805@mx.google.com>
	<20180925130329.GK7636@tbergstrom-lnx.Nvidia.com>
In-Reply-To: <20180925130329.GK7636@tbergstrom-lnx.Nvidia.com>
Message-ID: <CAL_JsqJjbCDk5HU8-ox=2hr7yBcaj5kv-V521CieGC7SJQu_HA@mail.gmail.com>
Subject: Re: [RFC 14/14] dt-bindings: tegra: Add Tegra210 EMC binding
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: vkuruturi@nvidia.com, linux-clk <linux-clk@vger.kernel.org>, linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, daniel@octaforge.org, Andre Heider <a.heider@gmail.com>, swtcr0@gmail.com
List-ID: <devicetree@vger.kernel.org>

On Tue, Sep 25, 2018 at 8:03 AM Peter De Schrijver
<pdeschrijver@nvidia.com> wrote:
>
> On Mon, Sep 24, 2018 at 02:04:24PM -0700, Rob Herring wrote:
> > On Fri, Sep 14, 2018 at 11:03:09PM +0300, Peter De Schrijver wrote:
> > > Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> >
> > Needs a commit msg.
> >
> > > ---
> > >  .../memory-controllers/nvidia,tegra210-emc.txt     | 448 +++++++++++++++++++++
> > >  1 file changed, 448 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
> > > new file mode 100644
> > > index 0000000..1c52f47
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
> > > @@ -0,0 +1,448 @@
> > > +NVIDIA Tegra210 SoC EMC (external memory controller)
> > > +====================================================
> > > +
> > > +Required properties :
> > > +- compatible : Should be "nvidia,tegra21-emc", "nvidia,tegra124-emc".
> > > +- reg : physical base address and length of the controller's registers.
> > > +- nvidia,memory-controller : phandle of the MC driver.
> >
> > Huh? What is this block then?
> >
> > > +- clocks : phandles of the possible source clocks
> > > +- clock-names : names of the possible source clocks
> > > +
> > > +The node should contain a "emc-table" subnode for each supported RAM type
> > > +(see field RAM_CODE in register PMC_STRAPPING_OPT_A), with its unit address
> > > +being its RAM_CODE.
> >
> > Unit address is based on reg property.
> >
> > > +
> > > +Required properties for "emc-table" nodes :
> > > +- nvidia,ram-code : Should contain the value of RAM_CODE this timing set is
> > > +used for.
> > > +
> > > +Each "emc-table" node should contain a "emc-table" subnode for every supported
> > > +EMC clock rate. The "emc-table" subnodes should have the clock rate in kHz as
> > > +their unit address.
> > > +
> > > +Required properties for "emc-table" nodes :
> >
> > Which emc-table nodes, the child or grand-child nodes?
> >
> > > +- compatible  "nvidia,tegra21-emc-table", "nvidia,tegra210-emc-table"
> >
> > > +- nvidia,revision : revision of the parameter set used for this node. All
> > > +                    nodes in the same "emc-table" should have the same revision
> > > +- clock-frequency : frequency in kHz
> > > +- nvidia,emc-min-mv : minimum voltage for this OPP
> > > +- nvidia,gk20a-min-mv : minimum GPU voltage for this OPP
> > > +- nvidia,source : clock source to be used for this OPP
> >
> > Is this memory timings/settings or OPPs? We have a binding for OPPs
> > already.
> >
> > > +- nvidia,src-sel-reg : value of EMC CAR register to be used for this OPP
> > > +- nvidia,needs-training : 1 if the OPP needs training at boot, 0 otherwise
> > > +- nvidia,trained : 1 if initial training has been done by firmware, 0 otherwise
> > > +- nvidia,periodic_training : 1 if the OPP needs periodic training, 0 otherwise
> > > +- nvidia,trained_dram_clktree_c0d0u0 : training data word
> > > +- nvidia,trained_dram_clktree_c0d0u1 : training data word
> >
> > [...]
> >
> > This is a huge list of properties. For all the things that are memory
> > timings, is there really value to defining a property for each setting?
> > Perhaps you should just define your own format and either make it a
> > separate firmware file or include that file in the dtb.
> >
>
> The problem with moving to a binary blob is that it will break compatibility
> with existing devices (eg. Jetson TX1 and shield TV) because their bootloaders
> rely on the existing format.

Good to know, but not really my problem that bindings shipped without
review. While this is self-contained and doesn't have any sort of
common binding which could be used instead, can you say that about
*everything* the bootloader depends on.

Rob
