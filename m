From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/3] dt-bindings: PCI: add PCIe hotplug property
Date: Fri, 25 Aug 2017 17:03:57 -0500
Message-ID: <20170825220356.s75yxkfasnnaygfc@rob-hp-laptop>
References: <1503564548-1834-1-git-send-email-oza.oza@broadcom.com>
 <1503564548-1834-3-git-send-email-oza.oza@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1503564548-1834-3-git-send-email-oza.oza@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Oza Pawandeep <oza.oza@broadcom.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, helgaas@kernel.org, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Andy Gospodarek <gospo@broadcom.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Oza Pawandeep <oza.pawandeep@gmail.com>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 24, 2017 at 02:19:07PM +0530, Oza Pawandeep wrote:
> Host drivers have the requirement of implementing PCI hotplug
> based on the how their SOC supports PCI hotplug.
> 
> Couple of properties have been added. the one to enable
> the hotplug feature itself, and the other caters to
> the PCI hotplug implementation with the use of gpios.
> 
> Signed-off-by: Oza Pawandeep <oza.oza@broadcom.com>

I acked v2. Please add acks when posting new versions.

Rob
