From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 0/2] Add R8A77980/Condor PCIe support
Date: Mon, 18 Jun 2018 11:36:23 +0200
Message-ID: <20180618093623.s33bkiptazxem463@verge.net.au>
References: <b37d458c-071a-833a-2057-be8a07c880be@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <b37d458c-071a-833a-2057-be8a07c880be@cogentembedded.com>
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

On Thu, Jun 14, 2018 at 10:16:32PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> Here's the set of 2 patches against Simon Horman's 'renesas.git' repo's
> 'renesas-devel-20180614v2-v4.17' tag. We're adding the R8A77980 PCIe related
> device nodes and then enable PCIe on the Condor board. These patches depend
> on the R8A77980 PCIe PHY driver support in order to work properly. Note that
> in case the PCIe PHY driver is not enabled, the kernel will BUG() due to I/O
> space page leak in the PCIe driver...

Is that problem specific to the presence of PCIe nodes for
condor/r8a77980 or is it also true of other (R-Car) boards where
PCIe is enabled?

Regardless, it sounds like these patches expose a kernel bug.
Is it being fixed?

> 
> [1/2] arm64: dts: renesas: r8a77980: add PCIe support
> [2/2] arm64: dts: renesas: condor: add PCIe support
> 
> WBR, Sergei
> 
