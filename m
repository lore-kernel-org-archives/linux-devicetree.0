From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3 04/11] ARM: dts: r8a7743: initial SoC device tree
Date: Sat, 8 Oct 2016 11:28:51 +0900
Message-ID: <20161008022851.GA14617@verge.net.au>
References: <2056698.ncAHq8vRQ3@wasted.cogentembedded.com>
 <2883940.Oo8sg10L7m@wasted.cogentembedded.com>
 <20161007030932.GH13721@verge.net.au>
 <cd1391d1-d2b5-6315-ee15-0253019d9836@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <cd1391d1-d2b5-6315-ee15-0253019d9836@cogentembedded.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux@arm.linux.org.uk, magnus.damm@gmail.com, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Oct 07, 2016 at 12:57:28PM +0300, Sergei Shtylyov wrote:
> On 10/7/2016 6:09 AM, Simon Horman wrote:
> 
> >>The  initial R8A7743 SoC device tree including CPU cores, GIC, timer, SYSC,
> >>CPG, and the required clock descriptions.
> >>
> >>Based on the original (and large) patch by Dmitry Shifrin
> >><dmitry.shifrin@cogentembedded.com>.
> >>
> >>Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >
> >I notice that this patch enables two CPUs. Have you tested SMP and:
> >- CPU hotplug
> >- Suspend to RAM
> 
>    No, not really. I'll remove CPU1. :-<

Thanks.
