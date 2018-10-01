From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: r8a774a1: Add CAN nodes
Date: Mon, 1 Oct 2018 14:44:43 +0200
Message-ID: <20181001124443.g55dwzqpguhglspv@verge.net.au>
References: <1536576195-11520-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1536576195-11520-4-git-send-email-fabrizio.castro@bp.renesas.com>
 <20180911133220.3kjx5dqp65drx3qs@verge.net.au>
 <TY1PR01MB1770B42824076BF5C57F12DDC0140@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1770B42824076BF5C57F12DDC0140@TY1PR01MB1770.jpnprd01.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Biju Das <biju.das@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 27, 2018 at 10:53:41AM +0000, Fabrizio Castro wrote:
> Hello Simon,
> 
> > Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: r8a774a1: Add CAN nodes
> >
> > On Mon, Sep 10, 2018 at 11:43:15AM +0100, Fabrizio Castro wrote:
> > > From: Chris Paterson <chris.paterson2@renesas.com>
> > >
> > > Add the device nodes for both RZ/G2M CAN channels.
> > >
> > > Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
> > > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> > > ---
> > >
> > > v1->v2:
> > > * replaced "renesas,rzg-gen2-can" with "renesas,rcar-gen3-can" as per
> > >   Geert's comment.
> > >
> > > This patch applies on top of renesas-devel-20180906-v4.19-rc2.
> >
> > Thanks Fabrizio,
> >
> > I would like to waif for the bindings to be accepted before accepting this
> > patch.
> 
> Marc has taken the bindings, I guess we can unblock this patch now?

Thanks, applied for v4.21.
