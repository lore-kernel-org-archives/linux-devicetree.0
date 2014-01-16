From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH 4/5] dt/bindings: remove device_type "network" references
Date: Thu, 16 Jan 2014 16:30:49 +0000
Message-ID: <20140116163049.9D367C40973@trevor.secretlab.ca>
References: <1386760555-22732-1-git-send-email-grant.likely@linaro.org> < 1386760555-22732-5-git-send-email-grant.likely@linaro.org> <52A87401. 5030001@monstr.eu>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <52A87401.5030001@monstr.eu>
Sender: linux-kernel-owner@vger.kernel.org
To: monstr@monstr.eu
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Wed, 11 Dec 2013 15:17:37 +0100, Michal Simek <monstr@monstr.eu> wrote:
> On 12/11/2013 12:15 PM, Grant Likely wrote:
> > device_type is deprecated and the kernel doesn't require it in most
> > cases. The only exceptions for flat tree users are the "gianfar",
> > "ucc_geth" and "ibm,emac" bindings, and arguably that requirement could
> > be relaxed for ucc_geth and ibm,emac (that is a task for separate
> > patches though).
> > 
> > This patch removes references to device_type="network" from the binding
> > documentation where possible and removes the properties from ARM and
> > microblaze dts files. This patch does not modify the powerpc .dts files
> > since there are a much larger number of them affected and I think the
> > ucc_geth, ibm,emac and gianfar users should be addressed before clearing
> > out the references to reduce the chance of breakage.
> > 
> > Signed-off-by: Grant Likely <grant.likely@linaro.org>
> > Cc: Rob Herring <rob.herring@calxeda.com>
> > Cc: Pawel Moll <pawel.moll@arm.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> > Cc: Kumar Gala <galak@codeaurora.org>
> > Cc: Michal Simek <monstr@monstr.eu>
> > ---
> >  Documentation/devicetree/bindings/marvell.txt                    | 2 --
> >  Documentation/devicetree/bindings/net/marvell-orion-net.txt      | 2 --
> >  Documentation/devicetree/bindings/powerpc/fsl/cpm_qe/network.txt | 1 -
> >  arch/arm/boot/dts/dove.dtsi                                      | 1 -
> >  arch/arm/boot/dts/kirkwood.dtsi                                  | 2 --
> >  arch/arm/boot/dts/orion5x.dtsi                                   | 1 -
> >  arch/microblaze/platform/generic/system.dts                      | 1 -
> >  7 files changed, 10 deletions(-)
> 
> Acked-by: Michal Simek <monstr@monstr.eu>
> 
> btw: what device types can be used?
> I am having them for serial, watchdog, pci, memory, cpu, ethernet-phy
> (will remove network from our generator).
> 
> when I grep kernel there are others types like soc, ipmi and a lot for powerpc.

There are a number of users, but most of them are bogus since they can
just as easily be expressed via a compatible value. There are a few
cases where they are required. PCI bus nodes, memory nodes, and cpus for
example. General rule here is avoid device_type entirely unless some
core infrastructure of the kernel requires it.

g.
