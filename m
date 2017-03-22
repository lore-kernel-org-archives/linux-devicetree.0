From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 2/2] arm64: dts: add arm/arm64 include symlinks
Date: Tue, 21 Mar 2017 17:20:27 -0700
Message-ID: <20170322002027.GA2984@localhost>
References: <20170226060058.5841-1-heiko@sntech.de>
 <20170226060058.5841-2-heiko@sntech.de>
 <20170320230337.GB78325@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170320230337.GB78325-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 20, 2017 at 04:03:37PM -0700, Brian Norris wrote:
> Hi,
> 
> On Sun, Feb 26, 2017 at 07:00:58AM +0100, Heiko Stuebner wrote:
> > Allow including of dtsi files in an architecture-independent manner.
> > Some dtsi files may be shared between architectures and one suggestion
> > was to have symlinks and let these includes get accessed via a
> >     #include <arm64/foo.dtsi>
> > So add the necessary symlinks for arm32.
> > 
> > Suggested-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> > Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> > ---
> > Suggested by Olof in response to the patch adding direct symlinks
> > for cros-ec includes.
> > 
> > Tested with adapted rk3399-Gru dtsi files and while we only need this arm64
> > version right now, it might make sense to already have both the arm32 and
> > arm64 versions ready.
> 
> FWIW, tested fine here too (for the same platform).
> 
> I guess this works fine, if it makes people happy. It also allows some
> weird #include paths. e.g.:
> 
> #include <arm64/include/arm/include/arm64/rockchip/rk3399.dtsi>
> 
> I guess we can call that an entertaining feature, and not a bug?
> 
> Reviewed-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Tested-by: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> 
> Where should this go? I'd like not to wait another few months before
> sending my Gru/Kevin DTS again.

Checked into shared/dt-symlinks on the arm-soc repo now (and merged into
next/dt and next/dt64). Please use that branch as a base for DT material that
will use this.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
