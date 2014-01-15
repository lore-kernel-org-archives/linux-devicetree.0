From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH V2 3/4] dt-bindings: pci: xgene pcie device tree
 bindings
Date: Wed, 15 Jan 2014 10:57:42 +0100
Message-ID: <201401151057.43044.arnd@arndb.de>
References: <1389742458-7693-1-git-send-email-tinamdar@apm.com>
 <1389742458-7693-4-git-send-email-tinamdar@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1389742458-7693-4-git-send-email-tinamdar@apm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tanmay Inamdar <tinamdar@apm.com>
Cc: devicetree@vger.kernel.org, jcm@redhat.com, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, patches@apm.com, linux-kernel@vger.kernel.org, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Rob Landley <rob@landley.net>, linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wednesday 15 January 2014, Tanmay Inamdar wrote:
> This patch adds the bindings for X-Gene PCIe driver. The driver resides
> under 'drivers/pci/host/pci-xgene.c' file.
> 
> Signed-off-by: Tanmay Inamdar <tinamdar@apm.com>
> ---
>  .../devicetree/bindings/pci/xgene-pcie.txt         |   45 ++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/xgene-pcie.txt
> 
> diff --git a/Documentation/devicetree/bindings/pci/xgene-pcie.txt b/Documentation/devicetree/bindings/pci/xgene-pcie.txt
> new file mode 100644
> index 0000000..19b9c28
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/xgene-pcie.txt
> @@ -0,0 +1,45 @@
> +* AppliedMicro X-Gene PCIe interface
> +
> +Required properties:
> +- status: Either "ok" or "disabled".

"status" isn't normally a required property. The default interpretation is
that a node without a status property is active.

> +- device_type: set to "pci"
> +- compatible: should contain "xgene,pcie" to identify the core.
> +- reg: base addresses and lengths of the pcie controller configuration
> +	space register.

Doesn't match the code or example: You only list one area here, but
you actually need to register sets.

Looks good otherwise now.

	Arnd
