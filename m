From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH 19/19] ARM: sun6i: a31s: Enable HDMI display output on the
 MSI Primo81 tablet
Date: Wed, 7 Jun 2017 18:47:53 -0400
Message-ID: <CAKb7UvgKhgCpeNzUX1ecFPuF6j+KvAWW3vprZ9nnVMBBJFi_zQ@mail.gmail.com>
References: <20170602101024.18940-1-wens@csie.org> <20170602101024.18940-20-wens@csie.org>
 <20170602194219.hiajr7dt2oikm52q@flea.lan> <20170607223625.aofk3cba3w4cvlys@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20170607223625.aofk3cba3w4cvlys@rob-hp-laptop>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, devicetree <devicetree@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-sunxi@googlegroups.com, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Wed, Jun 7, 2017 at 6:36 PM, Rob Herring <robh@kernel.org> wrote:
> On Fri, Jun 02, 2017 at 09:42:19PM +0200, Maxime Ripard wrote:
>> On Fri, Jun 02, 2017 at 06:10:24PM +0800, Chen-Yu Tsai wrote:
>> > The MSI Primo81 tablet has a micro HDMI connector at the bottom.
>> > This is connected to the SoCs HDMI output.
>> >
>> > Enable the display pipeline and the HDMI output.
>> >
>> > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
>> > ---
>> >  arch/arm/boot/dts/sun6i-a31s-primo81.dts | 25 +++++++++++++++++++++++++
>> >  1 file changed, 25 insertions(+)
>> >
>> > diff --git a/arch/arm/boot/dts/sun6i-a31s-primo81.dts b/arch/arm/boot/dts/sun6i-a31s-primo81.dts
>> > index f3712753fa42..26154b2f87a3 100644
>> > --- a/arch/arm/boot/dts/sun6i-a31s-primo81.dts
>> > +++ b/arch/arm/boot/dts/sun6i-a31s-primo81.dts
>> > @@ -52,17 +52,42 @@
>> >  / {
>> >     model = "MSI Primo81 tablet";
>> >     compatible = "msi,primo81", "allwinner,sun6i-a31s";
>> > +
>> > +   hdmi-connector {
>> > +           compatible = "hdmi-connector";
>> > +           type = "c";
>>
>> Should we add a connector type for this one?
>
> c as in USB Type C? I'd prefer to see a new compatible string. Is type
> even documented?

Probably as in HDMI Type C (there are Type A, C, and D connectors, aka
"regular", "mini", and "micro").
