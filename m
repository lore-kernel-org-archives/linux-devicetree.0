From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [linux-sunxi] [PATCH v4 11/11] arm64: dts: allwinner: a64: Enable
 HDMI output on A64 boards w/ HDMI
Date: Wed, 5 Sep 2018 15:53:23 -0700
Message-ID: <CA+E=qVdWXWztLj3989X+U+=4P5FpM4hs+6ByVmq8bf7mPeiWsA@mail.gmail.com>
References: <20180904044053.15425-1-icenowy@aosc.io> <20180904044053.15425-12-icenowy@aosc.io>
 <CAMty3ZCvpUf0nJ3WuPccP8BizBP=Uc8ChzB8SeN8fkX2iS1E_Q@mail.gmail.com>
 <20180905075136.chumwosx76o2n66l@flea> <CAMty3ZAVr_d+Rwry_DMWY221OC+YSWmReNm-TXzYWgpd1s68+w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMty3ZAVr_d+Rwry_DMWY221OC+YSWmReNm-TXzYWgpd1s68+w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jagan Teki <jagan@amarulasolutions.com>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, devicetree <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>, linux-sunxi <linux-sunxi@googlegroups.com>, linux-kernel <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>, linux-clk <linux-clk@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

I can test it tonight.

On Wed, Sep 5, 2018 at 12:57 AM, Jagan Teki <jagan@amarulasolutions.com> wrote:
> On Wed, Sep 5, 2018 at 1:21 PM, Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>> On Wed, Sep 05, 2018 at 12:56:03PM +0530, Jagan Teki wrote:
>>> On Tue, Sep 4, 2018 at 10:10 AM, Icenowy Zheng <icenowy@aosc.io> wrote:
>>> > From: Jagan Teki <jagan@amarulasolutions.com>
>>> >
>>> > Enable all necessary device tree nodes and add connector node to device
>>> > trees for all supported A64 boards with HDMI.
>>> >
>>> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>> > [Icenowy: squash all board patches altogether and change supply name]
>>> > Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
>>> > ---
>>> > Changes in v4:
>>> > - Rebase some device trees.
>>> > Changes in v3,1:
>>> > - Squash all enablement patches altogether.
>>> > - Change supply name to match DT binding & driver change.
>>> > Changes for v3:
>>> > - Enable all pipeline components
>>> > Changes for v2:
>>> > - none
>>> >
>>> >  .../dts/allwinner/sun50i-a64-bananapi-m64.dts | 34 +++++++++++++++++++
>>> >  .../dts/allwinner/sun50i-a64-nanopi-a64.dts   | 34 +++++++++++++++++++
>>> >  .../dts/allwinner/sun50i-a64-olinuxino.dts    | 34 +++++++++++++++++++
>>> >  .../dts/allwinner/sun50i-a64-orangepi-win.dts | 34 +++++++++++++++++++
>>> >  .../boot/dts/allwinner/sun50i-a64-pine64.dts  | 34 +++++++++++++++++++
>>> >  .../allwinner/sun50i-a64-sopine-baseboard.dts | 34 +++++++++++++++++++
>>> >  6 files changed, 204 insertions(+)
>>>
>>> Tested-by: Jagan Teki <jagan@amarulasolutions.com> # BPI-M64, OPI-Win,
>>> A64-Olinuxino, NPI-A64
>>>
>>> Pine64 boards look unable by saying
>>> [drm] Cannot find any crtc or sizes
>>>
>>> May be someone can confirm, it.
>>
>> Then we should drop the pine64 additions until someone figures it out,
>> as it has been already discussed.
>
> That is fine, but If anyone have pine64 can confirm this.
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
