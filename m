From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 0/3] Add R8A77980/Condor PFC support
Date: Tue, 24 Apr 2018 11:20:32 +0200
Message-ID: <20180424092032.kuxk2irgh6y27kax@verge.net.au>
References: <88e52531-e538-8685-110a-1a2e79a3fe49@cogentembedded.com>
 <4b325d8a-f018-5279-17b9-7fa8aac5b4da@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <4b325d8a-f018-5279-17b9-7fa8aac5b4da@cogentembedded.com>
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

On Fri, Apr 20, 2018 at 08:33:20PM +0300, Sergei Shtylyov wrote:
> On 03/09/2018 03:04 PM, Sergei Shtylyov wrote:
> 
> > Here's the set of 3 patches against Simon Horman's 'renesas.git' repo's
> > 'renesas-devel-20180308-v4.16-rc4' tag.  We're adding the R8A77980 PFC node
> > and then describing the pins for SCIF0 and EtherAVB devices declared earlier.
> > These patches depend on the R8A77980 PFC support in order to work properly.
> 
>   ... and their time has finally come! Please merge.
> 
> > [1/3] arm64: dts: renesas: r8a77980: add PFC support
> > [2/3] arm64: dts: renesas: condor: add SCIF0 pins
> > [3/3] arm64: dts: renesas: condor: add EtherAVB pins

Thanks, applied.
