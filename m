From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 19/19] ARM: sun6i: a31s: Enable HDMI display
 output on the MSI Primo81 tablet
Date: Sat, 10 Jun 2017 00:08:31 +0800
Message-ID: <CAGb2v64uxmxptf9VgHO8tT=AbPc+VtDhtG+rVd3Nwf9bEGr8pg@mail.gmail.com>
References: <20170602101024.18940-1-wens@csie.org> <20170602101024.18940-20-wens@csie.org>
 <20170602194219.hiajr7dt2oikm52q@flea.lan> <20170607223625.aofk3cba3w4cvlys@rob-hp-laptop>
 <CAKb7UvgKhgCpeNzUX1ecFPuF6j+KvAWW3vprZ9nnVMBBJFi_zQ@mail.gmail.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBF4Q5PEQKGQEEYFHOQY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAKb7UvgKhgCpeNzUX1ecFPuF6j+KvAWW3vprZ9nnVMBBJFi_zQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 8, 2017 at 6:47 AM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
> On Wed, Jun 7, 2017 at 6:36 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>> On Fri, Jun 02, 2017 at 09:42:19PM +0200, Maxime Ripard wrote:
>>> On Fri, Jun 02, 2017 at 06:10:24PM +0800, Chen-Yu Tsai wrote:
>>> > The MSI Primo81 tablet has a micro HDMI connector at the bottom.
>>> > This is connected to the SoCs HDMI output.
>>> >
>>> > Enable the display pipeline and the HDMI output.
>>> >
>>> > Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>>> > ---
>>> >  arch/arm/boot/dts/sun6i-a31s-primo81.dts | 25 +++++++++++++++++++++++++
>>> >  1 file changed, 25 insertions(+)
>>> >
>>> > diff --git a/arch/arm/boot/dts/sun6i-a31s-primo81.dts b/arch/arm/boot/dts/sun6i-a31s-primo81.dts
>>> > index f3712753fa42..26154b2f87a3 100644
>>> > --- a/arch/arm/boot/dts/sun6i-a31s-primo81.dts
>>> > +++ b/arch/arm/boot/dts/sun6i-a31s-primo81.dts
>>> > @@ -52,17 +52,42 @@
>>> >  / {
>>> >     model = "MSI Primo81 tablet";
>>> >     compatible = "msi,primo81", "allwinner,sun6i-a31s";
>>> > +
>>> > +   hdmi-connector {
>>> > +           compatible = "hdmi-connector";
>>> > +           type = "c";
>>>
>>> Should we add a connector type for this one?
>>
>> c as in USB Type C? I'd prefer to see a new compatible string. Is type
>> even documented?

Indeed it is:

http://elixir.free-electrons.com/linux/latest/source/Documentation/devicetree/bindings/display/connector/hdmi-connector.txt#L6

> Probably as in HDMI Type C (there are Type A, C, and D connectors, aka
> "regular", "mini", and "micro").

Correct.

ChenYu
