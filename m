From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: v3msk: add EtherAVB pins
Date: Tue, 24 Apr 2018 11:18:55 +0200
Message-ID: <20180424091855.2ngzbiwvigragk5h@verge.net.au>
References: <c42c9e9a-8fe8-5cad-0eeb-0c1fbd09f83c@cogentembedded.com>
 <ed7ddd72-4e52-0b2b-d2ef-1d407f638745@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <ed7ddd72-4e52-0b2b-d2ef-1d407f638745@cogentembedded.com>
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

On Fri, Apr 20, 2018 at 02:28:51PM +0300, Sergei Shtylyov wrote:
> On 03/14/2018 11:30 PM, Sergei Shtylyov wrote:
> 
> > Add the (previously omitted) EtherAVB pin data to the V3M Starter Kit
> > board's device tree.
> > 
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> > 
> > ---
> > The patch is against the 'renesas-devel-20180314-v4.16-rc5' tag of Simon's
> > 'renesas.git repo. It depends on the R8A77970 PFC driver patch adding EtherAVB
> > pin groups (posted yesterday) in order to work properly...
> 
>    The dependency has been now met, please merge this patch.

Thanks, applied.
