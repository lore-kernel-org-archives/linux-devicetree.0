From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v6 2/2] phy: rockchip-inno-usb2: add a new driver for
 Rockchip usb2phy
Date: Tue, 21 Jun 2016 11:05:14 +0200
Message-ID: <2284777.mdEtFaarym@diego>
References: <1466129353-48063-1-git-send-email-frank.wang@rock-chips.com>
 <CABXOdTcz9zjJ1iN2D9UXeYgd0y-kzh+fV3=+kmB=8j2jYqTQkg@mail.gmail.com>
 <986b53d6-ef65-bc1f-38a8-f981e23a6f02@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <986b53d6-ef65-bc1f-38a8-f981e23a6f02-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ziyuan Xu <xzy.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Tao Huang <huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, pawel.moll-5wv7dgnIgG8@public.gmane.org, Guenter Roeck <groeck-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Guenter Roeck <groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Frank,

Am Dienstag, 21. Juni 2016, 15:52:45 schrieb Frank Wang:
> On 2016/6/20 12:56, Guenter Roeck wrote:
> > On Sun, Jun 19, 2016 at 8:32 PM, Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org> 
wrote:
> >>> Turns out my problem was one of terminology. Using "suspend" and
> >>> "resume" to me suggested the common use of suspend and resume
> >>> functions. That is not the case here. After mentally replacing
> >>> "suspend" with "power_off" and "resume" with "power_on", you are
> >>> right, no problem exists. Sorry for the noise.
> >>> 
> >>> Maybe it would be useful to replace "resume" with "power_on" and
> >>> "suspend" with "power_off" in the function and variable names to
> >>> reduce confusion and misunderstandings.
> >>> 
> >>> Thanks,
> >>> Guenter
> >> 
> >> Well, it does have a bits confusion, however, the phy-port always just
> >> goes
> >> to suspend and resume mode (Not power off and power on) in a fact. So
> >> must
> >> it be renamed?
> > 
> > Other phy drivers name the functions _power_off and _power_on and
> > avoid the confusion. The callbacks are named .power_off and .power_on,
> > which gives a clear indication of its intended purpose. Other drivers
> > implementing suspend/resume (such as the omap usb phy driver) tie
> > those functions not into the power_off/power_on callbacks, but into
> > the driver's suspend/resume callbacks. At least the omap driver has
> > separate power management functions.
> > 
> > Do the functions _have_ to be renamed ? Surely not. But, if the
> > functions are really suspend/resume functions and not
> > power_off/power_on functions, maybe they should tie to the
> > suspend/resume functions and not register themselves as
> > power_off/power_on functions ?
> 
> As Guenter mentioned above,  I doped out two solutions, one is that keep
> current process but renaming *_resume/*_suspend to
> *_power_on/*_power_off;

in a way, naming stuff "power_off", "power_on" actually matches. For one, the 
phy-block goes from unusable to usable by usb-devices and also will power-on a 
phy-supply regulator (often named vcc_host* on Rockchip boards) from the phy-
core.

> another is that do not assign power_on/power_off
> functions for phy_ops at phy creating time, then, shorten
> _SCHEDULE_DELAY_ delay time less that 10 Seconds, and the phy-port
> suspend/resume mechanism depend on _sm_work_ completely.

Which in turn would mean that we would always depend on a fully controllable 
phy block. Right now it seems, rk3036, rk3228, rk3368 (probably forgot some) 
have the same type of phy, but with at least the unplug-detection missing.
In its current form the driver can very well support those (later on) by 
simply working statically (only acting on phy_power callbacks and not going to 
suspend on its own).

Also having the work running in 10-second intervall seems wasteful.

> 
> So which is the better way from your view? or would you like to give
> other unique perceptions please?

As obvious from the above, I would prefer just renaming the functions :-)


Heiko
