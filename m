From: Julian Calaby <julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 07/15] dt-bindings: display: sun4i-drm: Add
 R40 HDMI pipeline
Date: Sun, 20 May 2018 11:50:25 +1000
Message-ID: <CAGRGNgU+PaygxkVkfcxUqMeV1TijJrZRkPkff7b4cxdVY6NQLA@mail.gmail.com>
References: <20180519183127.2718-1-jernej.skrabec@siol.net> <20180519183127.2718-8-jernej.skrabec@siol.net>
Reply-To: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQIP76OUQLBB5VIQPMAKGQE5SBNSFI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180519183127.2718-8-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Mailing List, Arm" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jernej,

On Sun, May 20, 2018 at 4:31 AM, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org> wrote:
> Missing compatibles and descriptions needed to implement R40 HDMI
> pipeline are added.
>
> For mixers only compatibles are added.
>
> TCON description is expanded with R40 TV TCON compatibles. If the SoC
> has TCON TOP unit, phandle to that unit has to be specified. Additional
> clock has to be specified if SoC has TCON TOP and TCON is TV TCON.
>
> New compatible is added for DWC HDMI PHY, which has additional clock
> specified.

There's a bunch of A64 related stuff mixed in here, is the R40
compatible with the A64's parts? If so, you should probably mention
that in the commit log.

> Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
> ---
>  .../bindings/display/sunxi/sun4i-drm.txt         | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> index a099957ab62a..634276f713e8 100644
> --- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> +++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> @@ -111,8 +112,9 @@ Required properties:
>    - resets: phandle to the reset controller driving the PHY
>    - reset-names: must be "phy"
>
> -H3 HDMI PHY requires additional clock:
> +H3 and A64 HDMI PHY requires additional clocks:
>    - pll-0: parent of phy clock
> +  - pll-1: second possible phy clock parent (A64 only)

Maybe split this into two:

H3 HDMI PHY ...
   - pll-0: ...

A64 HDMI PHY ...
   - pll-0: ...
   - pll-1: ...

At the moment a quick reading implies that H3 needs pll-1.

Thanks,

-- 
Julian Calaby

Email: julian.calaby-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Profile: http://www.google.com/profiles/julian.calaby/
