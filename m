Return-Path: <SRS0=elLq=N2=verge.net.au=horms@kernel.org>
Date: Thu, 15 Nov 2018 06:27:56 -0800
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: Add CPU topology on R-Car
 Gen3 SoCs
Message-ID: <20181115142756.oumknzcuymhdlw5e@verge.net.au>
References: <1541661895-7064-1-git-send-email-gaku.inami.xh@renesas.com>
 <1541661895-7064-2-git-send-email-gaku.inami.xh@renesas.com>
 <CAMuHMdV5zFmVR7r5Lxky5uT77T7e=om0DpnW=YLz=YfD6F=hyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdV5zFmVR7r5Lxky5uT77T7e=om0DpnW=YLz=YfD6F=hyg@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Gaku Inami <gaku.inami.xh@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, Nov 14, 2018 at 10:50:03AM +0100, Geert Uytterhoeven wrote:
> Hi Inami-san,
> 
> On Thu, Nov 8, 2018 at 8:25 AM Gaku Inami <gaku.inami.xh@renesas.com> wrote:
> > This patch adds the "cpu-map" into r8a7795/r8a7796 composed of
> > multi-cluster. This definition is used to parse the cpu topology.
> >
> > Signed-off-by: Gaku Inami <gaku.inami.xh@renesas.com>
> 
> Thanks for your patch!
> 
> Next time, please collect tags provided by reviewers on the previous
> version.
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.21.
