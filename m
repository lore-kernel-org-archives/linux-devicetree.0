From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/2] ARM: shmobile: r8a7791: fix "gpio-ranges" props
Date: Fri, 23 Oct 2015 09:20:11 +0900
Message-ID: <20151023002010.GC15844@verge.net.au>
References: <10037494.4LD4T2QGPX@wasted.cogentembedded.com>
 <5904216.pOYUtEytKc@wasted.cogentembedded.com>
 <CAMuHMdVEBAJVezoj=Nm_upRSM_YjMrD8MmpX6EsT-4=vZTg+pQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-sh-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdVEBAJVezoj=Nm_upRSM_YjMrD8MmpX6EsT-4=vZTg+pQ@mail.gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Linux-sh list <linux-sh@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 22, 2015 at 01:06:02PM +0200, Geert Uytterhoeven wrote:
> On Thu, Oct 22, 2015 at 1:05 AM, Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
> > On R8A7791, GPIO banks 1 and 7  are missing  pins 26 to 31.  Correct the
> > "gpio-ranges" properties of the GPIO1 node (GPIO7 is already correct).
> >
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> LEDs and keys on r8a7791/koelsch (which are connected to a higher gpio)
> still work fine.
> 
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, I have queued this up.
