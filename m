From: Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v7 0/5] ARM: dts: imx6q: Add Engicam i.CoreM6 dts
Date: Fri, 21 Oct 2016 13:25:49 +0530
Message-ID: <CAD6G_RRGt19v4wnPOgarjEbJtMbsSOev4boAaoYZMpLp5uqejQ@mail.gmail.com>
References: <1476437243-13297-1-git-send-email-jteki@openedev.com>
 <CAD6G_RQyLtgJw=djPTmY5t7UVwzuZpj0xM0HjchLQjq7P5hMOg@mail.gmail.com> <20161021013546.GF30578@tiger>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161021013546.GF30578@tiger>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matteo Lisi <matteo.lisi-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 21, 2016 at 7:05 AM, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Oct 18, 2016 at 05:30:28PM +0530, Jagan Teki wrote:
>> Hi Shawn,
>>
>> On Fri, Oct 14, 2016 at 2:57 PM, Jagan Teki <jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org> wrote:
>> > This is series add dts support for Engicam I.Core M6 qdl modules. just
>> > rebased on top of linux-next of previous set[1].
>> >
>> > [1] http://www.spinics.net/lists/kernel/msg2358233.html
>> >
>> > Jagan Teki (5):
>> >   ARM: dts: imx6q: Add Engicam i.CoreM6 Quad/Dual initial support
>> >   ARM: dts: imx6q: Add Engicam i.CoreM6 DualLite/Solo initial support
>> >   ARM: dts: imx6qdl-icore: Add usbhost support
>> >   ARM: dts: imx6qdl-icore: Add usbotg support
>> >   ARM: dts: imx6qdl-icore: Add FEC support
>> >
>> >  arch/arm/boot/dts/Makefile           |   2 +
>> >  arch/arm/boot/dts/imx6dl-icore.dts   |  59 ++++++++
>> >  arch/arm/boot/dts/imx6q-icore.dts    |  59 ++++++++
>> >  arch/arm/boot/dts/imx6qdl-icore.dtsi | 271 +++++++++++++++++++++++++++++++++++
>> >  4 files changed, 391 insertions(+)
>> >  create mode 100644 arch/arm/boot/dts/imx6dl-icore.dts
>> >  create mode 100644 arch/arm/boot/dts/imx6q-icore.dts
>> >  create mode 100644 arch/arm/boot/dts/imx6qdl-icore.dtsi
>>
>> Can you pick this series?
>
> Sorry for the delay.  The first two patches look good, and I had a
> couple of small comments on the other 3.  Also, for the initial board
> support submission like this, you do not need to split it per device
> support.  That said, please squash the series into one patch when
> resending.

Sent v8 by squash the usb host and otg with first patch and second and
third one keep separated as one is new board dts and other one though
it is FEC support it also have a rmii_clk addition which is kind of
new compared to other qdl dtsi files. So please let me know if have
any more comments.

thanks!
-- 
Jagan Teki
Free Software Engineer | www.openedev.com
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
