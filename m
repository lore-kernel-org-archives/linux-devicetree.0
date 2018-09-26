From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v4 0/2] Reworked rk3288-tinker-s devicetree
Date: Wed, 26 Sep 2018 14:32:10 +0200
Message-ID: <5476375.mdEj9W728V@phil>
References: <20180923113807.11558-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20180923113807.11558-1-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Sonntag, 23. September 2018, 13:38:05 CEST schrieb Heiko Stuebner:
> Hi David,
> 
> I've adpated your patches 1+2 like so and would like to add them this way
> later on. Biggest change is of course making patch 1 solely about moving
> the shared parts to the dtsi and adding the tinker-s.dts including the
> emmc in the second patch.
> 
> Apart from that you can also see some previously missing style-related
> fixes. For example patch subject lines are somewhat specific, to allow
> people browsing the git history to realize the core patch contents just
> from the "headline" and also use the "correct" prefixes which vary
> depending on the subsystem your changing.
> 
> For future patches you can just do a "git log --oneline arch/arm/boot/dts"
> (change directory depending on location of the change of course), to
> see that arm32 dts use "ARM: dts: $soc-vendor: foo".
> 
> 
> Also providing a commit message describing the individual change
> in a bit more detail is important.
> 
> The wifi patch is a different issue, so I'll reply there.
> 
> 
> Heiko
> 
> David Summers (2):
>   ARM: dts: rockchip: move shared tinker-board nodes to a common dtsi
>   ARM: dts: rockchip: add rk3288-based Tinker board S

applied for 4.20
