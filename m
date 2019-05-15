Return-Path: <SRS0=DwSA=TP=verge.net.au=horms@kernel.org>
Date: Wed, 15 May 2019 09:52:01 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3 01/15] ARM: dts: r7s9210: Add USB clock
Message-ID: <20190515075201.cdz6tnurr2zclz6l@verge.net.au>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
 <20190514145605.19112-2-chris.brandt@renesas.com>
 <CAMuHMdWW=4nS__ykVBVe7Dz_3aaJQ4s5GK5Rdazg0nj4X==_Wg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWW=4nS__ykVBVe7Dz_3aaJQ4s5GK5Rdazg0nj4X==_Wg@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, USB list <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, May 15, 2019 at 09:38:32AM +0200, Geert Uytterhoeven wrote:
> On Tue, May 14, 2019 at 4:56 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> > Add USB clock node. If present, this clock input must be 48MHz.
> >
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v5.3.
