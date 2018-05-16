Return-Path: <SRS0=f8Ap=ID=verge.net.au=horms@kernel.org>
Date: Wed, 16 May 2018 10:58:03 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 2/2] soc: renesas: r8a77990-sysc: Add workaround for
 3DG-{A,B}
Message-ID: <20180516085802.5f334ljcpmtsj44u@verge.net.au>
References: <1526386059-6173-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1526386059-6173-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdUedCHrvJd79P49Sa+=f905k=hAE=ZNYRhbyPEdaw8rjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUedCHrvJd79P49Sa+=f905k=hAE=ZNYRhbyPEdaw8rjQ@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, May 16, 2018 at 09:47:04AM +0200, Geert Uytterhoeven wrote:
> On Tue, May 15, 2018 at 2:07 PM, Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> > This patch adds workaround for 3DG-{A,B} of R-Car E3 ES1.0 because
> > the SoC has a restriction about the order.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, accepted.
