From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2] arm64: dts: renesas: eagle: add EtherAVB pins
Date: Tue, 24 Apr 2018 11:18:31 +0200
Message-ID: <20180424091831.t3mpwmwiuht6nurc@verge.net.au>
References: <382aeecb-c484-ec27-1ef1-8da1673c2c14@cogentembedded.com>
 <8495a934-62f1-3b2e-3125-78844aef04e1@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <8495a934-62f1-3b2e-3125-78844aef04e1@cogentembedded.com>
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

On Fri, Apr 20, 2018 at 02:25:46PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 03/14/2018 10:58 PM, Sergei Shtylyov wrote:
> 
> > Add the (previously omitted) EtherAVB pin data to the Eagle board's
> > device tree.
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
