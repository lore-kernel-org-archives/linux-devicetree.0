From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: ulcb-kf: add dr_mode property for USB2.0
 channel 0
Date: Fri, 17 Nov 2017 06:16:37 -0800
Message-ID: <20171117141637.h4epzbusuborqao2@verge.net.au>
References: <1510146540-31881-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <CAMuHMdWLXyj=WaeacPpOohP0Th2Puwszri4t4YjNgceTuBcU5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdWLXyj=WaeacPpOohP0Th2Puwszri4t4YjNgceTuBcU5Q@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vladimir Barinov <vladimir.barinov@cogentembedded.com>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 15, 2017 at 05:52:29PM +0100, Geert Uytterhoeven wrote:
> On Wed, Nov 8, 2017 at 2:09 PM, Vladimir Barinov
> <vladimir.barinov@cogentembedded.com> wrote:
> > ULCB-KF has a USB2.0 dual-role channel (CN13).
> > This adds dr_mode property for USB2.0 channel 0 (EHCI/OHCI and HS-USB)
> > as "otg".
> >
> > Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.
