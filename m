From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/4] Documentation: dt-bindings: Add the binding info for
 APM X-Gene PCIe DMA driver
Date: Wed, 07 Jan 2015 09:30:45 +0100
Message-ID: <2098807.VbUeJKFBVr@wuerfel>
References: <1420608537-12296-1-git-send-email-mchitale@apm.com>
 <1420608537-12296-3-git-send-email-mchitale@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1420608537-12296-3-git-send-email-mchitale@apm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mayuresh Chitale <mchitale@apm.com>
Cc: devicetree@vger.kernel.org, vinod.koul@intel.com, jcm@redhat.com, patches@apm.com, ddutile@redhat.com, dmaengine@vger.kernel.org, dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wednesday 07 January 2015 10:58:55 Mayuresh Chitale wrote:
> +Required properties:
> +- compatible :
> +       - "apm,xgene-pciedma" for pcie DMA on X-Gene SoC
> +- interrupts : An interrupt-specifier which is used to handle DMA interrupts
> +
> +Examples:
> +               pciedma0 {
> +                       status = "disabled";
> +                       compatible = "apm,xgene-pciedma";
> +                       reg = < 0x0 0x1F2B0154 0x0 0xC
> +                               0x0 0x1F2B0058 0x0 0x8>;
> +                       reg-names = "cfg", "intr";
> +                       interrupts = <0x0 0xC6 0x4>;
> +               };
> 

The example contains a "reg-names" property that is neither listed
as optional nor mandatory, and that is not used by the driver.
Bettter drop that from the example.

The 'reg' property is not documented in the binding. Please
document which register each index refers to.

	Arnd
