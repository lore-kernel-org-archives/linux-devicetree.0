From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 0/4] Patches to fix remote wakeup on rk3288 dwc2 "host"
 port
Date: Sat, 24 Oct 2015 17:22:22 -0400
Message-ID: <CAD=FV=VgYU8sZfSkbNbbOFpb-nt=Yy9NjybxADBnAiQXfasDpw@mail.gmail.com>
References: <1445624891-31680-1-git-send-email-dianders@chromium.org>
 <562B9F5F.1080800@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <562B9F5F.1080800-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "Herrero,
 Gregory" <gregory.herrero-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, lyz <lyz-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, wulf <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, paulz <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XcXa4x6EXUF0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Rob,

On Sat, Oct 24, 2015 at 11:10 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On 10/23/2015 01:28 PM, Douglas Anderson wrote:
>> The "host1" port (AKA the dwc2 port that isn't the OTG port) on rk3288
>> has a hardware errata that causes everything to get confused when we get
>> a remote wakeup.  It appears that the "port reset" bit that's in the USB
>> phy (located in the rk3288 GRF) fixes things up and appears safe to do.
>>
>> This series of patches exports the "port reset" from the PHY and then
>> hooks it up to dwc2 through a quirk.
>>
>> I've tested this series atop a bit of a conglomeration of Heiko's github
>> "somewhat stable" branch (v4.3-rc3-876-g6509232) but with Greg KH's
>> usb-next merged in.
>>
>> These patches currently conflict with patches that I posted previously
>> to enable USB wakeup from S3, specifically:
>> * https://patchwork.kernel.org/patch/6727081/
>> * https://patchwork.kernel.org/patch/6727121/
>> ...those patches no longer apply anyway, so presumably they need to be
>> reposted and I can do so later atop these patches.
>>
>>
>> Douglas Anderson (4):
>>   phy: rockchip-usb: Support the PHY's "port reset"
>>   usb: dwc2: optionally assert phy "port reset" when waking up
>>   ARM: dts: rockchip: Enable the USB phys as reset providers on rk3288
>>   ARM: dts: rockchip: Point rk3288 dwc2 usb at phy port reset
>>
>>  .../devicetree/bindings/phy/rockchip-usb-phy.txt   |  6 ++
>>  Documentation/devicetree/bindings/usb/dwc2.txt     |  7 ++
>>  arch/arm/boot/dts/rk3288.dtsi                      |  8 +++
>>  drivers/phy/phy-rockchip-usb.c                     | 74 ++++++++++++++++++++++
>>  drivers/usb/dwc2/core.h                            |  5 ++
>>  drivers/usb/dwc2/core_intr.c                       |  7 ++
>>  drivers/usb/dwc2/platform.c                        | 13 ++++
>>  7 files changed, 120 insertions(+)
>
> A DT reset controller seems like a bit of an overkill here. I think this
> would be much more simple if we just add a phy reset hook to the phy
> subsystem.

Adding a reset hook in the PHY subsystem does seem like a reasonable
idea to me.  I was considering it in an earlier version of this series
that actually used a reset of the PHY to the fix the stuck dwc2.

...but I think that even if the phy subsystem had a reset hook it
wouldn't be the ideal solution here.  When we assert the PHY "port
reset" we're not actually fully resetting the PHY.  We're instead
doing some sort of a more minor "state machine" reset in the PHY.
This appears better (in my case) than resetting the whole PHY because
it doesn't force a de-enumeration / re-enumeration.  Exposing this
more minor reset as a PHY reset seems wrong to me.  ...and it also
precludes us later also exposing the more full reset through the PHY
framework if that later becomes useful.

...we could, of course, re-invent the reset framework (with string or
integral IDs so we can assert different types of resets) within the
PHY framework.  That doesn't seem ideal to me, but if that's what
others want to do then I guess it would be OK...

-Doug
