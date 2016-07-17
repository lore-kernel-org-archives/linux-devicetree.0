From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: add rk3288-firefly-reload
Date: Sun, 17 Jul 2016 16:01:34 -0500
Message-ID: <20160717210134.GA25977@rob-hp-laptop>
References: <5614243.tqTyZoc945@phil>
 <1468769937-23387-1-git-send-email-ayaka@soulik.info>
 <1468769937-23387-2-git-send-email-ayaka@soulik.info>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1468769937-23387-2-git-send-email-ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, =linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun, Jul 17, 2016 at 11:38:57PM +0800, Randy Li wrote:
> The Firefly RK3288 Reload is a combination Firefly rk3288 core board
> with the Reload baseboard. Add a dtsi for the Firefly rk3288 core
> which can be included into the dts for the various baseboards
> in the future and dts for Reload base board.
> 
> Currently supported are serial console, wired networking, eMMC and
> SD storage, SPFIF, IR receiver, LEDs, SDIO wifi and USB. But only
> the OTG could work on the host mode now, the other USB host can't
> work now, additional patches are required.
> 
> Signed-off-by: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.txt |   4 +
>  arch/arm/boot/dts/Makefile                         |   1 +
>  arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi  | 304 ++++++++++++++++++++
>  arch/arm/boot/dts/rk3288-firefly-reload.dts        | 320 +++++++++++++++++++++
>  4 files changed, 629 insertions(+)
>  create mode 100644 arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi
>  create mode 100644 arch/arm/boot/dts/rk3288-firefly-reload.dts

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
