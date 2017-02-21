From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2 1/6] arm64: dts: Add symlinks for cros-ec-keyboard and cros-ec-sbs
Date: Tue, 21 Feb 2017 15:47:31 -0800
Message-ID: <CAOesGMiim2WFfEAg-bJmWTwWn69=V_GuEg6AxsxPYMyzd3KFUw@mail.gmail.com>
References: <20170210010521.78872-1-briannorris@chromium.org> <20170210010521.78872-2-briannorris@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170210010521.78872-2-briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Stephen Barber <smbarber-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Thu, Feb 9, 2017 at 5:05 PM, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> From: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>
> We'd like to be able to use the cros-ec-keyboard.dtsi and
> cros-ec-sbs.dtsi snippets for arm64 devices.  Currently those files live
> in the arm/boot/dts directory.
>
> Let's follow the convention set by commit 8ee57b8182c4 ("ARM64: dts:
> vexpress: Use a symlink to vexpress-v2m-rs1.dtsi from arch=arm") and use
> a symlink.  Note that in this case we put the files in a new
> "include/common" directory since these snippets may need to be
> referenced by dts files in many different subdirectories.

I'd rather have something like this:

https://marc.info/?m=147547436324674&w=2

Instead of having everybody move things over. I.e. make it easy to
refer to the arm version from arm64 instead of creating a "common"
layer inbetween.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
