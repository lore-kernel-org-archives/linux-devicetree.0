From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 08/21] bindings: display: Add compatible for
 A64 HDMI PHY
Date: Wed, 2 May 2018 07:37:55 -0500
Message-ID: <CAL_JsqK4rUB0M1Ta-HR9Yk+7-VzUhCodBbTfBFo3PcJWHFRVSg@mail.gmail.com>
References: <20180430114058.5061-1-jagan@amarulasolutions.com>
 <20180430114058.5061-9-jagan@amarulasolutions.com> <20180501161909.GA1728@rob-hp-laptop>
 <CAMty3ZBBo41Odbife0WtPG__3qWaHZtkqUfOLTmqhzc_of+iYw@mail.gmail.com>
Reply-To: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDJIP47K7MERBOPCU3LQKGQEUC3E36A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAMty3ZBBo41Odbife0WtPG__3qWaHZtkqUfOLTmqhzc_of+iYw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 2, 2018 at 1:27 AM, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> wrote:
> Hi Rob,
>
> On Tue, May 1, 2018 at 9:49 PM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
>>
>> On Mon, Apr 30, 2018 at 05:10:45PM +0530, Jagan Teki wrote:
>> > HDMI PHY on Allwinner A64 has similar like H3/H5.
>> >
>> > Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
>> > ---
>> >  Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
>> > index 9ea4353caadd..7dcd1d64dfe4 100644
>> > --- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
>> > +++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
>> > @@ -104,6 +104,7 @@ Required properties:
>> >    - compatible: value must be one of:
>> >      * allwinner,sun8i-a83t-hdmi-phy
>> >      * allwinner,sun8i-h3-hdmi-phy
>> > +    * allwinner,sun50i-a64-hdmi-phy
>>
>> This should be one valid combination per line. The dts shows that the h3
>> string is a fallback which should be captured in the binding doc.
>
> The fallback compatible "allwinner,sun8i-h3-hdmi-phy" is already
> documented above, what we need to capture here? or did I miss anything
> here?

The documentation should make it clear which of these is valid in a dts:

"allwinner,sun50i-a64-hdmi-phy", "allwinner,sun8i-h3-hdmi-phy"

or:

"allwinner,sun50i-a64-hdmi-phy"


IOW, your list should look like this:

* "allwinner,sun8i-a83t-hdmi-phy", "allwinner,sun8i-h3-hdmi-phy"
* "allwinner,sun50i-a64-hdmi-phy", "allwinner,sun8i-h3-hdmi-phy"
* "allwinner,sun8i-h3-hdmi-phy"

Depending on whether the a83t is also compatible with h3.

Rob
