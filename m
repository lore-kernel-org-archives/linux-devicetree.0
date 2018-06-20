From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: r8a77980: add PCIe support
Date: Wed, 20 Jun 2018 10:49:11 +0200
Message-ID: <20180620084910.fal6aym7b66zgqto@verge.net.au>
References: <b37d458c-071a-833a-2057-be8a07c880be@cogentembedded.com>
 <7e8c70ae-5c85-1e73-1be9-a40901a345f0@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <7e8c70ae-5c85-1e73-1be9-a40901a345f0@cogentembedded.com>
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

On Thu, Jun 14, 2018 at 10:17:46PM +0300, Sergei Shtylyov wrote:
> Describe the PCIe PHY, PCIEC, and PCIe bus clock in the R8A77980 device
> tree.
> 
> Based on the original (and large) patch by Vladimir Barinov.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

This looks good to me.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

I am marking it as deferred pending acceptance of the
renesas,r8a77980-pcie-phy binding. Please repost or otherwise
ping me once that has happened.
