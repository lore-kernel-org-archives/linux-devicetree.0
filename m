From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 4/5] arm64: dts: renesas: ulcb: Add HDMI output
 connector
Date: Tue, 11 Jul 2017 11:03:54 +0200
Message-ID: <20170711090353.GF4517@verge.net.au>
References: <1499741237-27407-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <CAMuHMdW0wC3pP6RuoOJbz2hftRTBBzEi0zX2jmwtBC31pYBN4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdW0wC3pP6RuoOJbz2hftRTBBzEi0zX2jmwtBC31pYBN4g@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vladimir Barinov <vladimir.barinov@cogentembedded.com>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 11, 2017 at 09:05:21AM +0200, Geert Uytterhoeven wrote:
> On Tue, Jul 11, 2017 at 4:47 AM, Vladimir Barinov
> <vladimir.barinov@cogentembedded.com> wrote:
> > From: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
> >
> > The ULCB board has one HDMI output connector.
> >
> > This connector is available on both the H3 and M3-W ULCB boards.
> > Add this to the ulcb.dtsi file.
> >
> > Signed-off-by: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.14 with Laurent's Reviewed-by tag from v1.
I have also applied the other 4 patches from v1.
