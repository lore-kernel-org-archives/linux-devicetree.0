From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77970: add SMP support
Date: Sat, 12 May 2018 16:08:40 +0200
Message-ID: <20180512140836.jwducouc7j4sm5od@verge.net.au>
References: <14666252.G84Ipxe6EL@wasted.cogentembedded.com>
 <54dbd1d2-8279-5073-cffb-c647fba91e42@cogentembedded.com>
 <CAMuHMdUqVVWz0jLb2Vmrkk3BQBsYVsCOW1zsaPUi8o6jr_mojQ@mail.gmail.com>
 <db136ee6-4ce6-756e-743d-3342b2e65f2b@cogentembedded.com>
 <20180509190517.ho5og3grbuzf4wz4@verge.net.au>
 <110ba99c-1a8d-98a1-3ca0-5fc99e79572b@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <110ba99c-1a8d-98a1-3ca0-5fc99e79572b@cogentembedded.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 10, 2018 at 07:43:03PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 05/09/2018 10:05 PM, Simon Horman wrote:
> 
> >>>> Add the device node for the second Cortex-A53 CPU core.
> >>>>
> >>>> Based on the original (and large) patch by Daisuke Matsushita
> >>>> <daisuke.matsushita.ns@hitachi.com>.
> >>>>
> >>>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> >>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >>>
> >>> Dupe of https://patchwork.kernel.org/patch/10032875/
> >>
> >>    Sorry!
> >>    Not an exact dupe, though -- mine has clock/power #define's used,
> >> yours -- only bare #s. :-)
> >>
> >>> From series "[PATCH 0/2] arm64: dts: renesas: r8a77970: Add SMP Support"
> >>> (https://www.spinics.net/lists/linux-renesas-soc/msg19681.html)
> >>
> >>    Hmm... what's the fate of this series?
> > 
> > There is now a v2 of Geert's series which incorporates your enhancements.
> 
>    I suggested to respin it. :-)

Thanks, that would have been my suggestion too :)

> > I will apply that.
> 
>    Thank you.
>    For the record, I had better luck than Geert testing SMP on Eagle:
>    only CPU0 couldn't be offlined (and I was unable to find a
>    workaround), others could be on/ offlined w/o issues. As for
>    suspend/resume -- it did work but I could only test s2idle
>    (/sys/power/mem_sleep had no other variants)...

Thanks. Perhaps you have a more recent firmware than Geert.
I would expect the CPU0 issue you describe will be resolved in time in
the firmware.
