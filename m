From: Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 1/3] dt-bindings: phy: phy-rockchip-typec: add usb3 otg
 reset
Date: Thu, 18 Jan 2018 09:47:50 -0800
Message-ID: <20180118174748.GA63108@google.com>
References: <1515751704-13213-1-git-send-email-william.wu@rock-chips.com>
 <1515751704-13213-2-git-send-email-william.wu@rock-chips.com>
 <20180117220715.GA112833@google.com>
 <CAFqH_52KiHQzEeaX5rFN66pMqAuVVKeWJhxnS5L4hY4XiVG8mw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAFqH_52KiHQzEeaX5rFN66pMqAuVVKeWJhxnS5L4hY4XiVG8mw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Enric Balletbo Serra <eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Guenter Roeck <groeck-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Frank Wang <frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, lin.huang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, Doug Anderson <dianders-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 18, 2018 at 06:20:09PM +0100, Enric Balletbo Serra wrote:
> As Brian said commit 06c47e6286d5 'usb: dwc3: of-simple: Add support
> to get resets for the device' introduced the support to get the resets
> from dwc3-of-simple and the queued commit 'b7e63d95c14d arm64: dts:
> rockchip: add reset property for dwc3 controllers on rk3399' started
> using it. Without the latest I get errors like this doing bind/unbind
> tests.
> 
>    dwc3: probe of fe900000.dwc3 failed with error -110
> 
> I just tested these series on top of mainline, I reverted my patch
> because otherwise two drivers are requesting the same reset and fails,
> and I did some of the bind/unbind test. They just worked fine, and
> seems that this is right way, so this makes me think some questions.

Actually, this was intended to coexist with DWC3 optionally controlling
the same reset. It was written before the reset framework was rewritten
to have shared and exclusive resets. Should this be rewritten to use
shared resets? We'd have to modify both dwc3 core and the PHY driver.

> Should 'b7e63d95c14d arm64: dts: rockchip: add reset property for dwc3
> controllers on rk3399' removed for 4.16? That's a question for Heiko I
> guess, if it's removed we will have usb broken meanwhile these patches
> doesn't land. If we don't remove the patch we will need to introduce a
> new patch in this series that reverts the first patch.

If we don't make this shared, I suppose Rockchip should rewrite this
series and rebase on Heiko's tree, where the DTSI change should just
remove the reset from DWC3 and add it to the PHY node at the same time.
That would be an atomic, non-breaking change.

> Is commit 06c47e6286d5 'usb: dwc3: of-simple: Add support to get
> resets for the device'  really needed ? Seems that I was the only user
> of it.

I don't personally know the history of this one. I just noticed that you
started using it to resolve a problem that was implemented differently
in our downstream tree.

> Anyway, these patches looks good to me and are
> 
> Tested-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>

Awesome.

Brian
