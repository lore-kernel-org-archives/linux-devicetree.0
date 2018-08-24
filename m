From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 9/9] arm64: dts: renesas: r8a774a1: Add FCPF and FCPV
 instances
Date: Fri, 24 Aug 2018 09:26:31 +0000
Message-ID: <TY1PR01MB17703688D4E3F92734BADDD7C0360@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1535031788-19907-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1535031788-19907-10-git-send-email-fabrizio.castro@bp.renesas.com>
 <c27a266e-3eaa-a879-85ab-0e0aeb5f8b31@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <c27a266e-3eaa-a879-85ab-0e0aeb5f8b31@cogentembedded.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hello Sergei,

Thank you for your feedback!

> Subject: Re: [PATCH 9/9] arm64: dts: renesas: r8a774a1: Add FCPF and FCPV instances
>
> Hello!
>
> On 8/23/2018 4:43 PM, Fabrizio Castro wrote:
>
> > Add FCPF and FCPV instances to the r8a774a1 dtsi, similarly
> > to what was done for the r8a7796 with commits 41dbbf0c5 ("arm64: dts:
> > r8a7796: Add FCPF and FCPV instances"), 69490bc96 ("arm64: dts:
> > renesas: r8a7796: Point FDP1 via FCPF to IPMMU-VI0"), and cef942d0b
> > ("arm64: dts: renesas: r8a7796: Point VSPI via FCPVI to IPMMU-VC0").
>
>    Need to specify 12 hex digits of SHA1 when citing commits.

I'll send a v2 to address that.

Thanks,
Fab

>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> [...]
>
> MBR, Sergei



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, Buckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered No. 04586709.
