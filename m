From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: v3msk: add eMMC support
Date: Fri, 24 Aug 2018 10:24:57 +0200
Message-ID: <20180824082456.d25w3kxyvkyouboh@verge.net.au>
References: <1af46bf9-d9e5-8dcf-0ac7-a85e7348a34e@cogentembedded.com>
 <9da672a2-0269-4860-8912-189414b43d4c@cogentembedded.com>
 <20180822113100.edpyplj2kteomr2j@verge.net.au>
 <9f94612a-5035-b006-f6af-6bafb7ff91f3@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <9f94612a-5035-b006-f6af-6bafb7ff91f3@cogentembedded.com>
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

On Wed, Aug 22, 2018 at 05:43:11PM +0300, Sergei Shtylyov wrote:
> On 08/22/2018 02:31 PM, Simon Horman wrote:
> 
> >> Add the eMMC chip support for the V3M Started Kit board.
> >>
> >> Based on the original (and large) patches by Vladimir Barinov.
> >>
> >> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> >> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> > 
> > Thanks,
> > 
> > This looks fine to me but I will wait to see if there are other reviews
> > before applying.
> > 
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> > 
> > I am, however, curious to know about HS200.
> > Is it supported on the v3msk? If so, do you have any plans to enable it?
> 
>    As I've already said, the eMMC chip only receives 3.3V on all its voltage inputs.

Thanks Sergei, got it.

I have applied this for v4.20.
