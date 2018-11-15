Return-Path: <SRS0=elLq=N2=verge.net.au=horms@kernel.org>
Date: Thu, 15 Nov 2018 06:28:10 -0800
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: Add CPU capacity-dmips-mhz
Message-ID: <20181115142809.na5pw64p4zttfqgy@verge.net.au>
References: <1541661895-7064-1-git-send-email-gaku.inami.xh@renesas.com>
 <1541661895-7064-3-git-send-email-gaku.inami.xh@renesas.com>
 <CAMuHMdXvkoMwrXy_878AmAPChaGCzMGbq6RVY3Z_CrFV5nTyAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXvkoMwrXy_878AmAPChaGCzMGbq6RVY3Z_CrFV5nTyAA@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Gaku Inami <gaku.inami.xh@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, Nov 14, 2018 at 10:56:04AM +0100, Geert Uytterhoeven wrote:
> Hi Inami-san,
> 
> On Thu, Nov 8, 2018 at 8:25 AM Gaku Inami <gaku.inami.xh@renesas.com> wrote:
> > Set the capacity-dmips-mhz for R-Car Gen3 SoCs, that is based on
> > dhrystone. The average in 10 times of dhrystone result as follows:
> 
> [...]
> 
> > Signed-off-by: Gaku Inami <gaku.inami.xh@renesas.com>
> > ---
> > v1 -> v2:
> >  - Consolidate two patches for r8a7795 and r8a7796 into one patch
> >  - Add the formula for capacity-dmips-mhz into description
> 
> Thanks for the update, and the extensive and clear description!
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.21.
