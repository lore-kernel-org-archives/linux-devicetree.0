From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: dts: r8a7794: fix PWM clock parent
Date: Mon, 5 Sep 2016 13:59:09 +0200
Message-ID: <20160905115906.GA24256@verge.net.au>
References: <1618499.8bcj8adpVO@wasted.cogentembedded.com>
 <1994467.CVFvpbaMyF@wasted.cogentembedded.com>
 <CAMuHMdVezsJ1q0A4TCdhfEEPtnyMeXGGZxRREQucy6kr2BO=EA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdVezsJ1q0A4TCdhfEEPtnyMeXGGZxRREQucy6kr2BO=EA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 05, 2016 at 11:50:41AM +0200, Geert Uytterhoeven wrote:
> On Sun, Sep 4, 2016 at 9:55 PM, Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
> > When removing the non-existing thermal clock I forgot to remove its
> > parent from the node's "clocks" property  -- this led to a wrong PWM
> > clock's parent clock.
> >
> > Fixes: 2a29f9d6fea8 ("ARM: dts: r8a7794: add MSTP5 clocks")
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, I have queued this up.
