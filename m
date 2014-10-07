From: Robert Richter <robert.richter@caviumnetworks.com>
Subject: Re: [PATCH 3/6] pci, thunder: Add PCIe host controller devicetree
 bindings
Date: Tue, 7 Oct 2014 16:27:44 +0200
Message-ID: <20141007142744.GE31556@rric.localhost>
References: <1411573068-12952-1-git-send-email-rric@kernel.org>
 <1411573068-12952-4-git-send-email-rric@kernel.org>
 <3082935.e3X4GsVUDn@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <3082935.e3X4GsVUDn@wuerfel>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>, Liviu Dudau <liviu.dudau@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Robert Richter <rric@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-pci@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Bjorn Helgaas <bhelgaas@google.com>, Sunil Goutham <sgoutham@cavium.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 24.09.14 18:06:04, Arnd Bergmann wrote:
> > +               compatible = "cavium,thunder-pcie";
> > +               device_type = "pci";
> > +               msi-parent = <&its>;
> > +               bus-range = <0 255>;
> > +               #size-cells = <2>;
> > +               #address-cells = <3>;
> > +               reg = <0x8480 0x00000000 0 0x10000000>;  /* Configuration space */
> > +               ranges = <0x03000000 0x8010 0x00000000 0x8010 0x00000000 0x70 0x00000000>, /* mem ranges */
> > +                       <0x03000000 0x8300 0x00000000 0x8300 0x00000000 0x80 0x00000000>,
> > +                       <0x03000000 0x87e0 0x00000000 0x87e0 0x00000000 0x01 0x00000000>;
> > +        };
> 
> If you claim the entire 0-255 bus range, I think you should also
> specify a domain, otherwise it's not predictable which domain you
> get.

Liviu's code assigns a unique id to the domain if missing, see
of_pci_get_domain_nr(). So I don't think we need to add a "pci-domain"
property here.

Liviu's DT implementation that assigns a unique number differs a bit
from ACPI which states: "If _SEG [aka domain number] does not exist,
OSPM assumes that all PCI bus segments are in PCI Segment Group 0."

Maybe of_pci_get_domain_nr() should be similar to ACPI. If there are
multiple root bridges, the "pci-domain" property could be forced
instead.

-Robert
