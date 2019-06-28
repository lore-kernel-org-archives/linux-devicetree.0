From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: allwinner: a64: enable ANX6345
 bridge on Teres-I
Date: Fri, 28 Jun 2019 12:39:32 +0200
Message-ID: <bb2c2c00-b46e-1984-088f-861ac8952331@samsung.com>
References: <20190604122150.29D6468B05@newverein.lst.de>
        <20190604122308.98D4868B20@newverein.lst.de>
        <CA+E=qVckHLqRngsfK=AcvstrD0ymEfRkYyhS_kBtZ3YWdE3L=g@mail.gmail.com>
        <20190605101317.GA9345@lst.de> <20190605120237.ekmytfxcwbjaqy3x@flea>
        <E1hYsvP-0000PY-Pz@stardust.g4.wien.funkfeuer.at>
        <20190607062802.m5wslx3imiqooq5a@flea>
        <CGME20190607094103epcas1p4babbb11ec050974a62f2af79bc64d752@epcas1p4.samsung.com>
        <20190607094030.GA12373@lst.de>
        <66707fcc-b48e-02d3-5ed7-6b7e77d53266@samsung.com>
        <20190612152022.c3cfhp4cauhzhfyr@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190612152022.c3cfhp4cauhzhfyr@flea>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Torsten Duwe <duwe@lst.de>, Harald Geyer <harald@ccbib.org>, Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Icenowy Zheng <icenowy@aosc.io>, Sean Paul <seanpaul@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree <devicetree@vger.kernel.org>, arm-linux <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Maxime,

It seems I have missed your response.

On 12.06.2019 17:20, Maxime Ripard wrote:
>> I am not sure if I understand whole discussion here, but I also do not
>> understand whole edp-connector thing.
> The context is this one:
> https://patchwork.freedesktop.org/patch/257352/?series=51182&rev=1
> https://patchwork.freedesktop.org/patch/283012/?series=56163&rev=1
> https://patchwork.freedesktop.org/patch/286468/?series=56776&rev=2
>
> TL;DR: This bridge is being used on ARM laptops that can come with
> different eDP panels. Some of these panels require a regulator to be
> enabled for the panel to work, and this is obviously something that
> should be in the DT.
>
> However, we can't really describe the panel itself, since the vendor
> uses several of them and just relies on the eDP bus to do its job at
> retrieving the EDIDs. A generic panel isn't really working either
> since that would mean having a generic behaviour for all the panels
> connected to that bus, which isn't there either.
>
> The connector allows to expose this nicely.


As VESA presentation says[1] eDP is based on DP but is much more
flexible, it is up to integrator (!!!) how the connection, power
up/down, initialization sequence should be performed. Trying to cover
every such case in edp-connector seems to me similar to panel-simple
attempt failure. Moreover there is no such thing as physical standard
eDP connector. Till now I though DT connector should describe physical
connector on the device, now I am lost, are there some DT bindings
guidelines about definition of a connector?

Maybe instead of edp-connector one would introduce integrator's specific
connector, for example with compatible "olimex,teres-edp-connector"
which should follow edp abstract connector rules? This will be at least
consistent with below presentation[1] - eDP requirements depends on
integrator. Then if olimex has standard way of dealing with panels
present in olimex/teres platforms the driver would then create
drm_panel/drm_connector/drm_bridge(?) according to these rules, I guess.
Anyway it still looks fishy for me :), maybe because I am not
familiarized with details of these platforms.

[1]: https://www.vesa.org/wp-content/uploads/2010/12/DisplayPort-DevCon-Presentation-eDP-Dec-2010-v3.pdf


>
>> According to VESA[1] eDP is "Internal display interface" - there is no
>> external connector for eDP, the way it is connected is integrator's
>> decision, but it is fixed - ie end user do not plug/unplug it.
> I'm not sure if you mean DRM or DT connector here though. In DRM,
> we're doing this all the time for panels. I'm literaly typing this
> from a laptop that has a screen with an eDP connector.


VESA describes only hardware, but since DT also describes hardware I
guess it should be similar.


Regards

Andrzej




>
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
