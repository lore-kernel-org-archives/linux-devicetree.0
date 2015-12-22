From: Naoki FUKAUMI <naobsd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/6] ARM: dts: rockchip: add reboot mode node
Date: Tue, 22 Dec 2015 12:04:01 +0900
Message-ID: <CAFnsNoQbeAsuESSPeDDs_fQvPv96pBX=jNh=ahpWrTKLrpEExw@mail.gmail.com>
References: <1450697249-29994-1-git-send-email-andy.yan@rock-chips.com>
 <1450698149-30260-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1450698149-30260-1-git-send-email-andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org
List-Id: devicetree@vger.kernel.org

hi,

On Mon, Dec 21, 2015 at 8:42 PM, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> Add reboot mode driver DT node for rk3xxx,rk3288 platform
>
> Signed-off-by: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
>
>  arch/arm/boot/dts/rk3288.dtsi                | 25 +++++++++++++++++++++++
>  arch/arm/boot/dts/rk3xxx.dtsi                | 26 ++++++++++++++++++++++++
>  include/dt-bindings/soc/rockchip_boot-mode.h | 30 ++++++++++++++++++++++++++++
>  3 files changed, 81 insertions(+)
>  create mode 100644 include/dt-bindings/soc/rockchip_boot-mode.h
>
> diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
> index 04ea209..937ba4c 100644
> --- a/arch/arm/boot/dts/rk3288.dtsi
> +++ b/arch/arm/boot/dts/rk3288.dtsi
> @@ -170,6 +170,31 @@
>                 };
>         };
>
> +       reboot_mode {
> +               compatible = "rockchip,reboot-mode";
> +               rockchip,regmap = <&pmu>;
> +               offset = <0x94>;
> +               loader {
> +                       linux,mode = "loader";
> +                       linux,magic = <0x5242C301>;
> +               };
> +
> +               maskrom {
> +                       linux,mode = "maskrom";
> +                       linux,magic = <0x5242C302>;
> +               };
> +
> +               recovery {
> +                       linux,mode = "recovery";
> +                       linux,magic = <0x5242C303>;
> +               };
> +
> +               fastboot {
> +                       linux,mode = "fastboot";
> +                       linux,magic = <0x5242C309>;
> +               };
> +       };
> +
(snip)

I sometimes use 0xEF08A53C to load bootloader from SD card instead of
on-board flash memory such as eMMC.
 https://github.com/linux-rockchip/u-boot-rockchip/blob/u-boot-rk3288/common/cmd_rockusb.c#L893

I don't know any detail about this function.
(above code says "reboot to maskrom", but it should be wrong from my experience)

do you know something about this function? can you handle this too?

Regards,
