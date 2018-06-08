From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 1/5] arm64: dts: renesas: r8a77980: add FCPVD support
Date: Fri, 8 Jun 2018 10:56:56 +0200
Message-ID: <20180608085656.lulmpodu4rytcda7@verge.net.au>
References: <390fabf0-4caf-1600-3780-1893207d94f7@cogentembedded.com>
 <73f61c34-d0ec-75cd-b6fd-a41cfb39078f@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <73f61c34-d0ec-75cd-b6fd-a41cfb39078f@cogentembedded.com>
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

On Thu, Jun 07, 2018 at 11:19:31PM +0300, Sergei Shtylyov wrote:
> Describe FCPVD0 in the R8A77980 device tree; it will be used by VSPD0 in
> the next patch...
> 
> Based on the original (and large) patch by Vladimir Barinov.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Hi,

This looks fine to me but I will wait for the dependencies of this series
to land and to see if there are other reviews before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
