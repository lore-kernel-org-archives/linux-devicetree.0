From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: allwinner: a64: enable ANX6345
 bridge on Teres-I
Date: Mon, 1 Jul 2019 14:27:51 +0200
Message-ID: <64471471-5b4d-3c1f-a0e3-e02ee78ca23c@samsung.com>
References: <CA+E=qVckHLqRngsfK=AcvstrD0ymEfRkYyhS_kBtZ3YWdE3L=g@mail.gmail.com>
        <20190605101317.GA9345@lst.de> <20190605120237.ekmytfxcwbjaqy3x@flea>
        <E1hYsvP-0000PY-Pz@stardust.g4.wien.funkfeuer.at>
        <20190607062802.m5wslx3imiqooq5a@flea>
        <CGME20190607094103epcas1p4babbb11ec050974a62f2af79bc64d752@epcas1p4.samsung.com>
        <20190607094030.GA12373@lst.de>
        <66707fcc-b48e-02d3-5ed7-6b7e77d53266@samsung.com>
        <20190612152022.c3cfhp4cauhzhfyr@flea>
        <bb2c2c00-b46e-1984-088f-861ac8952331@samsung.com>
        <20190701095842.fvganvycce2cy7jn@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190701095842.fvganvycce2cy7jn@flea>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Torsten Duwe <duwe@lst.de>, Harald Geyer <harald@ccbib.org>, Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Icenowy Zheng <icenowy@aosc.io>, Sean Paul <seanpaul@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree <devicetree@vger.kernel.org>, arm-linux <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 01.07.2019 11:58, Maxime Ripard wrote:
> Hi!
>
> On Fri, Jun 28, 2019 at 12:39:32PM +0200, Andrzej Hajda wrote:
>> On 12.06.2019 17:20, Maxime Ripard wrote:
>>>> I am not sure if I understand whole discussion here, but I also do not
>>>> understand whole edp-connector thing.
>>> The context is this one:
>>> https://patchwork.freedesktop.org/patch/257352/?series=51182&rev=1
>>> https://patchwork.freedesktop.org/patch/283012/?series=56163&rev=1
>>> https://patchwork.freedesktop.org/patch/286468/?series=56776&rev=2
>>>
>>> TL;DR: This bridge is being used on ARM laptops that can come with
>>> different eDP panels. Some of these panels require a regulator to be
>>> enabled for the panel to work, and this is obviously something that
>>> should be in the DT.
>>>
>>> However, we can't really describe the panel itself, since the vendor
>>> uses several of them and just relies on the eDP bus to do its job at
>>> retrieving the EDIDs. A generic panel isn't really working either
>>> since that would mean having a generic behaviour for all the panels
>>> connected to that bus, which isn't there either.
>>>
>>> The connector allows to expose this nicely.
>> As VESA presentation says[1] eDP is based on DP but is much more
>> flexible, it is up to integrator (!!!) how the connection, power
>> up/down, initialization sequence should be performed. Trying to cover
>> every such case in edp-connector seems to me similar to panel-simple
>> attempt failure. Moreover there is no such thing as physical standard
>> eDP connector. Till now I though DT connector should describe physical
>> connector on the device, now I am lost, are there some DT bindings
>> guidelines about definition of a connector?
> This might be semantics but I guess we're in some kind of grey area?
>
> Like, for eDP, if it's soldered I guess we could say that there's no
> connector. But what happens if for some other board, that signal is
> routed through a ribbon?
>
> You could argue that there's no physical connector in both cases, or
> that there's one in both, or one for the ribbon and no connector for
> the one soldered in.


This is not about ribbon vs soldering. It is about usage: this
connection is static across the whole life of the device (except
exceptional things: repair, non-standard usage, etc).

And "the real connector" is (at least for me) something where end-user
can connect/disconnect different things: USB, HDMI, ethernet, etc. And
obviously to be functional it should be somehow standardized. So even if
there could be some grey area, I do not see it here.


>
>> Maybe instead of edp-connector one would introduce integrator's specific
>> connector, for example with compatible "olimex,teres-edp-connector"
>> which should follow edp abstract connector rules? This will be at least
>> consistent with below presentation[1] - eDP requirements depends on
>> integrator. Then if olimex has standard way of dealing with panels
>> present in olimex/teres platforms the driver would then create
>> drm_panel/drm_connector/drm_bridge(?) according to these rules, I guess.
>> Anyway it still looks fishy for me :), maybe because I am not
>> familiarized with details of these platforms.
> That makes sense yes


And what if some panel can be used with this pseudo-connecter and in
some different hw directly? Code duplication? DT overlays?


Regards

Andrzej


>
> Maxime
>
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
