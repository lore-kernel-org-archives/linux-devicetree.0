Return-Path: <SRS0=I2AB=V5=verge.net.au=horms@kernel.org>
Date: Thu, 1 Aug 2019 11:24:25 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] dt-bindings: usb: renesas_gen3: Rename bindings
 documentation file to reflect IP block
Message-ID: <20190801092424.nfbjzk2n3rfc4faf@verge.net.au>
References: <20190801091337.27786-1-horms+renesas@verge.net.au>
 <CAMuHMdXNbqmS4T50+1PXp1-o1NLwbYCKqV=6e1Vj_vuicUxMOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXNbqmS4T50+1PXp1-o1NLwbYCKqV=6e1Vj_vuicUxMOQ@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, USB list <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Thu, Aug 01, 2019 at 11:18:36AM +0200, Geert Uytterhoeven wrote:
> On Thu, Aug 1, 2019 at 11:13 AM Simon Horman <horms+renesas@verge.net.au> wrote:
> > For consistency with the naming of (most) other documentation files for DT
> > bindings for Renesas IP blocks rename the Renesas USB3.0 peripheral
> > documentation file from renesas,gen3.txt to renesas,usb3-peri.txt
> 
> from renesas,usb3.txt
> 
> > This refines a recent rename from renesas,gen3.txt to renesas-gen3.txt.
> 
> Actually it was renamed from renesas_usb3.txt to renesas,usb3.txt.
> 
> > The motivation is to to more accurately reflect the IP block documented in
> 
> double to
> 
> > this file.
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> With the above fixed:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, I'll fix this up.
