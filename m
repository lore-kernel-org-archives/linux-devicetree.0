From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 0/2] Add R8A77980/Condor PCIe support
Date: Wed, 20 Jun 2018 10:50:09 +0200
Message-ID: <20180620085009.xvd6todrfss6zazd@verge.net.au>
References: <b37d458c-071a-833a-2057-be8a07c880be@cogentembedded.com>
 <20180618093623.s33bkiptazxem463@verge.net.au>
 <cfa599bd-d244-0032-490b-553f7870d07c@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <cfa599bd-d244-0032-490b-553f7870d07c@cogentembedded.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 18, 2018 at 07:16:47PM +0300, Sergei Shtylyov wrote:
> On 06/18/2018 12:36 PM, Simon Horman wrote:
> 
> >> Here's the set of 2 patches against Simon Horman's 'renesas.git' repo's
> >> 'renesas-devel-20180614v2-v4.17' tag. We're adding the R8A77980 PCIe related
> >> device nodes and then enable PCIe on the Condor board. These patches depend
> >> on the R8A77980 PCIe PHY driver support in order to work properly. Note that
> >> in case the PCIe PHY driver is not enabled, the kernel will BUG() due to I/O
> >> space page leak in the PCIe driver...
> > 
> > Is that problem specific to the presence of PCIe nodes for
> > condor/r8a77980
> 
>    The nodes are safe unless they are enabled, so the Condor patch may be
> deferred untl I fix the PCI code.

Understood. I would expect that given this is a but a fix
would be backported to -stable in due course. But I agree its
best to be cautious here.

> > condor/r8a77980 or is it also true of other (R-Car) boards where
> > PCIe is enabled?
> 
>    The leak happens every time the driver fails to probe later than
> pci_remap_iospace() is called but the BUG_ON() is only triggered by rhe 2nd try
> with EPROBE_DEFER returned previously.
> 
> > Regardless, it sounds like these patches expose a kernel bug.
> > Is it being fixed?
> 
>    I'm working on a fix (which embraces several PCI drivers)...
> 
> >> [1/2] arm64: dts: renesas: r8a77980: add PCIe support
> >> [2/2] arm64: dts: renesas: condor: add PCIe support
> 
> WBR, Sergei
> 
