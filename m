From: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [linux-sunxi] Re: [PATCH 02/27] arm64: allwinner: h6: add system controller device tree node
Date: Wed, 12 Sep 2018 23:37:24 +0800
Message-ID: <B9D0F336-B0C0-453C-AD56-325DAA9883A0@aosc.io>
References: <20180902072643.4917-1-jernej.skrabec@siol.net> <20180902072643.4917-3-jernej.skrabec@siol.net> <CAGb2v65y1W=52SAFFqyCOnHd80nx+oPHUDeysHWBy7o8_g=eeQ@mail.gmail.com> <9915D9F1-1C60-4AEF-9074-CE040FCD7BF0@aosc.io> <CAGb2v64t40yTbrnkg33N2=jBdnvV45H1XSCF8U230LGAyuVySw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGb2v64t40yTbrnkg33N2=jBdnvV45H1XSCF8U230LGAyuVySw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>, Jernej Skrabec <jernej.skrabec@siol.net>, Andrzej Hajda <a.hajda@samsung.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Mike Turquette <mturquette@baylibre.com>, linux-sunxi <linux-sunxi@googlegroups.com>, Archit Taneja <architt@codeaurora.org>, dri-devel <dri-devel@lists.freedesktop.org>, linux-kernel <linux-kernel@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-clk <linux-clk@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org



于 2018年9月12日 GMT+08:00 下午10:49:12, Chen-Yu Tsai <wens@csie.org> 写到:
>On Tue, Sep 4, 2018 at 4:44 PM Icenowy Zheng <icenowy@aosc.io> wrote:
>>
>>
>>
>> 于 2018年9月4日 GMT+08:00 下午4:40:56, Chen-Yu Tsai <wens@csie.org> 写到:
>> >On Sun, Sep 2, 2018 at 3:27 PM Jernej Skrabec
><jernej.skrabec@siol.net>
>> >wrote:
>> >>
>> >> From: Icenowy Zheng <icenowy@aosc.io>
>> >>
>> >> As we have already binding for the H6 system controller, add its
>node
>> >> to the device tree.
>> >>
>> >> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
>> >> [fixed compatible string]
>> >> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
>> >
>> >Reviewed-by: Chen-Yu Tsai <wens@csie.org>
>>
>> By the way can these patches be applied first? (patches
>> related to syscon).
>>
>> They're also needed for EMAC.
>
>Applied.
>
>BTW, the H6 system control EMAC register also has the internal PHY
>related controls seen on H3/H5. IIRC you previously mentioned that
>they have no effect?

Yes, because the "internal PHY" on H6 is on AC200.

The internal/external mux bit has effect (although it will mux
to a non-existent PHY when switching to "internal", render
EMAC not usable), but it also has effect on A64 (same effect
with H6), on which it's not documented.

>
>ChenYu
>
>_______________________________________________
>linux-arm-kernel mailing list
>linux-arm-kernel@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
