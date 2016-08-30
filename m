From: Bharat Kumar Gogada <bharat.kumar.gogada@xilinx.com>
Subject: RE: [PATCH] PCI: Xilinx NWL PCIe: Updating device tree
 documentation with prefetchable memory space
Date: Tue, 30 Aug 2016 10:46:18 +0000
Message-ID: <8520D5D51A55D047800579B094147198258D22D1@XAP-PVEXMBX01.xlnx.xilinx.com>
References: <1470751209-31203-1-git-send-email-bharatku@xilinx.com>
 <20160810222251.GA31705@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160810222251.GA31705@rob-hp-laptop>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, "marc.zyngier@arm.com" <marc.zyngier@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michal Simek <michals@xilinx.com>, Soren Brinkmann <sorenb@xilinx.com>, "galak@codeaurora.org" <galak@codeaurora.org>, Ravikiran Gummaluri <rgummal@xilinx.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

> Subject: Re: [PATCH] PCI: Xilinx NWL PCIe: Updating device tree documentation
> with prefetchable memory space
>
> On Tue, Aug 09, 2016 at 07:30:09PM +0530, Bharat Kumar Gogada wrote:
> > Updating device tree documentation with prefetchable memory sapce.
> > Configuration space shifted to 64-bit address space.
> >
> > Signed-off-by: Bharat Kumar Gogada <bharatku@xilinx.com>
> > ---
> >  Documentation/devicetree/bindings/pci/xilinx-nwl-pcie.txt | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
>
> Acked-by: Rob Herring <robh@kernel.org>

Thanks Rob


This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
