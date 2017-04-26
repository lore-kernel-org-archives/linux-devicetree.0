From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: r8a7795: update PFC node name to
 pin-controller
Date: Wed, 26 Apr 2017 09:48:01 +0200
Message-ID: <20170426074800.GG25517@verge.net.au>
References: <1493023915-21658-1-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdVw9OJZarw3SRa7NuuaMtmDKPVN3Om0GFVFm5k_YAqn6g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdVw9OJZarw3SRa7NuuaMtmDKPVN3Om0GFVFm5k_YAqn6g@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Magnus Damm <magnus.damm@gmail.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 24, 2017 at 11:03:54AM +0200, Geert Uytterhoeven wrote:
> On Mon, Apr 24, 2017 at 10:51 AM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > The device trees for Renesas SoCs use either pfc or pin-controller
> > as the node name for the PFC device. This patch is intended to take a step
> > towards unifying the node name used as pin-controller which appears to
> > be more the more generic of the two and thus more in keeping with the DT
> 
> s/be more/be/
> 
> > specs.
> >
> > My analysis is that this is a user-visible change to the extent that kernel
> > logs, and sysfs entries change from e6060000.pfc and pfc@e6060000 to
> > e6060000.pin-controller and pin-controller@e6060000.
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, I fixed the typo when queuing this up.
