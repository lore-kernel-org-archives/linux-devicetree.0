From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 02/11] soc: renesas: rcar-rst: add R8A77980 support
Date: Tue, 6 Feb 2018 13:45:55 +0100
Message-ID: <20180206124555.62vty4lwp7gakmgi@verge.net.au>
References: <46fca582-220d-e5a7-62cd-2fc77a29846b@cogentembedded.com>
 <76b4144e-423a-65fd-fe17-bfedbc0deb8e@cogentembedded.com>
 <CAMuHMdVcKEH4FMf8UazacV86DFtJq8sdxfT+c7UX+67k5vXugA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdVcKEH4FMf8UazacV86DFtJq8sdxfT+c7UX+67k5vXugA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Rob Herring <robh+dt@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Mon, Feb 05, 2018 at 01:37:04PM +0100, Geert Uytterhoeven wrote:
> On Fri, Feb 2, 2018 at 7:27 PM, Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
> > Add support for R-Car V3H (R8A77980) to the R-Car RST driver -- this driver
> > is  needed  for the clock driver to work.
> 
> Please drop the extra spaces in between words that are part of the same
> sentence.
> 
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied with whitespace fixes suggested above.
