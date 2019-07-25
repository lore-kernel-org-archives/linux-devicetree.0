Return-Path: <gregkh@linuxfoundation.org>
Date: Thu, 25 Jul 2019 11:09:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: usb: renesas_gen3: Rename bindings
 documentation file
Message-ID: <20190725090946.GA3311@kroah.com>
References: <20190703083514.32385-1-horms+renesas@verge.net.au>
 <20190703083514.32385-3-horms+renesas@verge.net.au>
 <CAMuHMdVgx9N0yeeei5qcg1yz2WEdDf0gQ6GcwUOAz7u09S_D4A@mail.gmail.com>
 <20190711080302.qeotxueyvlr7pvhe@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190711080302.qeotxueyvlr7pvhe@verge.net.au>
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, USB list <linux-usb@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
List-ID: <devicetree@vger.kernel.org>

On Thu, Jul 11, 2019 at 10:03:03AM +0200, Simon Horman wrote:
> On Wed, Jul 03, 2019 at 02:28:51PM +0200, Geert Uytterhoeven wrote:
> > Hi Simon,
> > 
> > On Wed, Jul 3, 2019 at 10:35 AM Simon Horman <horms+renesas@verge.net.au> wrote:
> > > For consistency with the naming of (most) other documentation files for DT
> > > bindings for Renesas IP blocks rename the Renesas USB3.0 peripheral
> > > documentation file from renesas-gen3.txt to renesas,usb3-peri.txt
> > >
> > > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> > >
> > > ---
> > > v2
> > > * Accumulate review tags
> > > * Use renesas,usb3-peri.txt as new filename as suggested by Shimoda-san
> > 
> > Unfortunately the previous version has already made it into usb-next
> > 23c46801d14cb647 dt-bindings: usb: renesas_gen3: Rename bindings
> > documentation file
> 
> Ok, I guess we should go with that version.

So can you resend this series based on 5.3-rc1 so I know what to apply?

thanks,

greg k-h
