From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 0/3] Add R8A77980/Condor PFC support
Date: Tue, 13 Mar 2018 19:46:12 +0100
Message-ID: <20180313184612.e4z3dkmsjbmnh252@verge.net.au>
References: <88e52531-e538-8685-110a-1a2e79a3fe49@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <88e52531-e538-8685-110a-1a2e79a3fe49@cogentembedded.com>
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

On Fri, Mar 09, 2018 at 03:04:56PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> Here's the set of 3 patches against Simon Horman's 'renesas.git' repo's
> 'renesas-devel-20180308-v4.16-rc4' tag.  We're adding the R8A77980 PFC node
> and then describing the pins for SCIF0 and EtherAVB devices declared earlier.
> These patches depend on the R8A77980 PFC support in order to work properly.

I have marked these patches as Deferred. Please repost or ping me
once the dependencies are in an RC release. If looser dependency handling
is appropriate please let me know.
