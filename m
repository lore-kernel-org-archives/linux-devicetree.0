From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: dts: iwg20d-q7: Add pinctl support for scif0
Date: Wed, 21 Jun 2017 13:33:56 +0200
Message-ID: <20170621113354.GC17965@verge.net.au>
References: <1497625049-46802-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdVe7sRcGohSPvSUrryNMetddomoMbN7ffOtq9Y3DBt=zQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdVe7sRcGohSPvSUrryNMetddomoMbN7ffOtq9Y3DBt=zQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, Chris Paterson <chris.paterson2@renesas.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 19, 2017 at 10:42:18AM +0200, Geert Uytterhoeven wrote:
> Hi Biju,
> 
> On Fri, Jun 16, 2017 at 4:57 PM, Biju Das <biju.das@bp.renesas.com> wrote:
> > Adding pinctrl support for scif0 interface.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> 
> The patch looks good to me, but without schematics, we cannot verify the
> actual pins used.
> 
> Are the schematics somewhere available? Having access to them would allow us
> doing a better job reviewing your DTS patches.

Echoing Geert's request, it would be great to be able to compare the
DT description against some documentation.

My understanding is that this patch depends on "[PATCH v2 0/3] Add
R8A7743/SK-RZG1M PFC support" which in turn depends on pfc driver support
which is on target to be included in v4.13-rc1.

Accordingly I have marked this patch as deferred. Please repost
or otherwise ping me once the driver dependency is present in an rc release.
Thanks.
