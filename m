From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2] arm64: dts: r8a7795: Add CAN external clock support
Date: Mon, 29 Feb 2016 09:39:14 +0900
Message-ID: <20160229003914.GB25079@verge.net.au>
References: <CAMuHMdXJRN2kF2r=bqcY8v87aYHj_OKr2=5vzcfoHwvr02Y2CA@mail.gmail.com>
 <1456504727-54332-1-git-send-email-ramesh.shanmugasundaram@bp.renesas.com>
 <CAMuHMdXbwZjw=s8LR_HyOZab1H=mVNPjBRDoCq_=t_RK3eoHcw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdXbwZjw=s8LR_HyOZab1H=mVNPjBRDoCq_=t_RK3eoHcw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-renesas-soc@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Chris Paterson <chris.paterson2@renesas.com>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 26, 2016 at 05:54:16PM +0100, Geert Uytterhoeven wrote:
> On Fri, Feb 26, 2016 at 5:38 PM, Ramesh Shanmugasundaram
> <ramesh.shanmugasundaram@bp.renesas.com> wrote:
> > Adds external CAN clock node for r8a7795. This clock can be used as
> > fCAN clock of CAN and CAN FD controller.
> >
> > Signed-off-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
> 
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, I have queued this up for v4.7.
