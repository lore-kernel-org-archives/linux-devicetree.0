From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] PCI: add missing DT binding for linux,pci-domain property
Date: Wed, 5 Nov 2014 16:17:43 -0700
Message-ID: <20141105231743.GI6168@google.com>
References: <1415101660-26450-1-git-send-email-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1415101660-26450-1-git-send-email-l.stach@pengutronix.de>
Sender: linux-pci-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-pci@vger.kernel.org, Liviu Dudau <Liviu.Dudau@arm.com>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 04, 2014 at 12:47:40PM +0100, Lucas Stach wrote:
> This property was added by 41e5c0f81d3e
> (of/pci: Add pci_get_new_domain_nr() and of_get_pci_domain_nr())
> without the required binding documentation. As this property
> will be supported by a number of host bridge drivers going forward,
> add it to the common PCI binding doc.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

I merged 41e5c0f81d3e through my tree, and I could merge something like
this if a consensus develops with some acks.  But I'll just let you guys
handle it unless you poke me again.

> ---
> This is a non-critical fix, but may still qualify for 3.18-rc as
> the property was added in this release cycle.
> ---
>  Documentation/devicetree/bindings/pci/pci.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/pci.txt b/Documentation/devicetree/bindings/pci/pci.txt
> index 41aeed38926d..b754f786ed5e 100644
> --- a/Documentation/devicetree/bindings/pci/pci.txt
> +++ b/Documentation/devicetree/bindings/pci/pci.txt
> @@ -7,3 +7,13 @@ And for the interrupt mapping part:
>  
>  Open Firmware Recommended Practice: Interrupt Mapping
>  http://www.openfirmware.org/1275/practice/imap/imap0_9d.pdf
> +
> +Additionally to the properties specified in the above standards a host bridge
> +driver implementation may support the following properties:
> +
> +- linux,pci-domain:
> +   If present this property assigns a fixed PCI domain number to a host bridge,
> +   otherwise an unstable (across boots) unique number will be assigned.
> +   It is recommended to either not set this property at all or set it for all
> +   host bridges in the system, otherwise potentially conflicting domain numbers
> +   may be assigned to root buses behind different host bridges.
> -- 
> 2.1.1
> 
