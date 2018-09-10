From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [1/3] Device Tree for ASUS Tinker Board S
Date: Mon, 10 Sep 2018 18:47:15 +0200
Message-ID: <3597397.qpyucnFYAP@phil>
References: <90338fb8-412d-5658-1142-75dff51e0739@davidjohnsummers.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <90338fb8-412d-5658-1142-75dff51e0739-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org>
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
Cc: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi David,

thanks for working on including the tinker-s.
Some comments below.

Am Sonntag, 2. September 2018, 12:04:48 CEST schrieb beagleboard-8lkWs+DogrrqRUWtDFdff/XRex20P6io@public.gmane.org:
> Hi,
> 
> The ASUS Tinker Board S : 
> https://www.asus.com/uk/Single-Board-Computer/Tinker-Board-S/
> 
> Is a variant on the original ASUS Tinker Board, the main difference 
> being that the "S" has eMMC.
> 
> This patchset sets up the device tree for the "S". It is based on the 
> patches used with the debian distribution which ships with the device : 
> https://github.com/TinkerBoard/debian_kernel/blob/develop/arch/arm/boot/dts/rk3288-miniarm.dts
> 
> So this is really just mainlining the support.
> 
> I've split the changed into three parts:

These general comments apply to all 3 of your patches:

(1) Please follow the general guildelines for sending patches, like
described in Documentation/process/5.Posting.rst in your kernel tree like:
- send output of "git format-patch"
- signed-off-by line
- full name as "from"
- ideally use "git send-email"
- no html mails
- no mangled content (your mail client replaced all tabs with spaces)

(2) Please keep things to lower cases. So name your board for
example rk3288-tinker-s.dts

(3) When adding a board, please also add a corresponding entry to
Documentation/devicetree/bindings/arm/rockchip.txt

(4) When adding a board variant - please don't simply copy devicetrees.
Instead ideally create a shared dtsi, that both the tinker.dts
and tinker-s can include.

For reference you can look at the Rock960 CE+EE patchset posted today:
https://patchwork.kernel.org/cover/10594427/

(5) Please add lists and maintainers. I'm missing
- linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
- Devicetree binding maintainers:
  - robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
  - mark.rutland-5wv7dgnIgG8@public.gmane.org


Thanks
Heiko
