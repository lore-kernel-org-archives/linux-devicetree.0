Return-Path: <gregkh@linuxfoundation.org>
Date: Sat, 10 Aug 2019 13:14:55 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] dt-bindings: usb: renesas_gen3: Rename bindings
 documentation file to reflect IP block
Message-ID: <20190810111455.GA30455@kroah.com>
References: <20190809213710.31783-1-horms+renesas@verge.net.au>
 <CAMuHMdUHK7Fq3m4y1rjVFxnSXH3tZyTjOzFMfVMtRtPcdKjNCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUHK7Fq3m4y1rjVFxnSXH3tZyTjOzFMfVMtRtPcdKjNCw@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Simon Horman <horms+renesas@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, USB list <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Sat, Aug 10, 2019 at 08:40:15AM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Fri, Aug 9, 2019 at 11:37 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> > For consistency with the naming of (most) other documentation files for DT
> > bindings for Renesas IP blocks rename the Renesas USB3.0 peripheral
> > documentation file from renesas,usb3.txt to renesas,usb3-peri.txt
> >
> > This refines a recent rename from renesas_usb3.txt to renesas-usb3.txt.
> 
> s/renesas-usb3.txt/renesas,usb3.txt/

I'll fix it up now, no need for a resend...
