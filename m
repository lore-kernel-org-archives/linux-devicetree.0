From: Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Subject: Re: Re: [PATCH v6 14/22] dt-bindings: sun6i-dsi: Add
 A64 DSI compatible (w/ A31 fallback)
Date: Sat, 26 Jan 2019 21:39:00 +0530
Message-ID: <bed39fd2-1f4f-4c6b-afc6-da127326775c@openedev.com>
References: <20190124195900.22620-1-jagan@amarulasolutions.com>
 <20190124195900.22620-15-jagan@amarulasolutions.com>
 <20190125155236.agxwkxvyefmrbvym@flea>
Reply-To: jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Return-path: <linux-sunxi+bncBDH5TZWAZAFBBLUMWLRAKGQERWFB6MA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190125155236.agxwkxvyefmrbvym@flea>
Content-Language: en-US
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 25/01/19 9:22 PM, Maxime Ripard wrote:
> On Fri, Jan 25, 2019 at 01:28:52AM +0530, Jagan Teki wrote:
>> The MIPI DSI controller in Allwinner A64 is similar to A33.
>>
>> But unlike A33, A64 doesn't have DSI_SCLK gating which eventually
>> set the mod clock rate for the controller.
>>
>> So, use the DSI_DPHY gating for the similar purpose of mod clock
>> so-that the controller can operate properly.
>>
>> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
>> Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> ---
>>   Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt b/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
>> index 69e233e8fad1..dbda2e567760 100644
>> --- a/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
>> +++ b/Documentation/devicetree/bindings/display/sunxi/sun6i-dsi.txt
>> @@ -12,6 +12,7 @@ The DSI Encoder generates the DSI signal from the TCON's.
>>   Required properties:
>>     - compatible: value must be one of:
>>       * allwinner,sun6i-a31-mipi-dsi
>> +    * "allwinner,sun50i-a64-mipi-dsi", "allwinner,sun6i-a31-mipi-dsi"
> 
> The other line doesn't have quotes, we should be consistent

You mean to say, remove quotes like this


allwinner,sun50i-a64-mipi-dsi, allwinner,sun6i-a31-mipi-dsi

This make confusion with comma with allwinner vs next compatible string 
isn't it? (In fact I did follow the similar like TCON in sun4i-drm.txt)
