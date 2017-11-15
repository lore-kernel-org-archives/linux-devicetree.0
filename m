From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 02/10] drm/sun4i: tcon: Add support for A10 TCON
Date: Wed, 15 Nov 2017 10:37:02 +0800
Message-ID: <CAGb2v660aAWC8aCNMMmEOEbJ0rc2vT4ir_UUwuAkfc3Mvm2ROQ@mail.gmail.com>
References: <20171017121807.2994-1-wens@csie.org> <20171017121807.2994-3-wens@csie.org>
 <20171024160102.fjonpvkykyijxmow@rob-hp-laptop>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBB2OQV3IAKGQEZPMMFUA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20171024160102.fjonpvkykyijxmow@rob-hp-laptop>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 25, 2017 at 12:01 AM, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Oct 17, 2017 at 08:17:59PM +0800, Chen-Yu Tsai wrote:
>> From: Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> The A10 has two TCONs that are similar to the ones found on other SoCs.
>> Like the A31, TCON0 has a register used to mux the TCON outputs to the
>> downstream encoders. The bit fields are slightly different.
>>
>> Signed-off-by: Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> [wens-jdAy2FN1RRM@public.gmane.org: Reworked for A10 and fixed up commit message]
>> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> ---
>>  .../bindings/display/sunxi/sun4i-drm.txt           |  1 +
>>  drivers/gpu/drm/sun4i/sun4i_drv.c                  |  3 ++-
>>  drivers/gpu/drm/sun4i/sun4i_tcon.c                 | 30 ++++++++++++++++++++++
>>  3 files changed, 33 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
>> index 46df3b78ae9e..b2c08af73a95 100644
>> --- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
>> +++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
>> @@ -86,6 +86,7 @@ The TCON acts as a timing controller for RGB, LVDS and TV interfaces.
>>
>>  Required properties:
>>   - compatible: value must be either:
>> +   * allwinner,sun4i-a10-tcon
>>     * allwinner,sun5i-a13-tcon
>>     * allwinner,sun6i-a31-tcon
>>     * allwinner,sun6i-a31s-tcon
>> diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
>> index b5879d4620d8..b8089ac6feef 100644
>> --- a/drivers/gpu/drm/sun4i/sun4i_drv.c
>> +++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
>> @@ -184,7 +184,8 @@ static bool sun4i_drv_node_is_frontend(struct device_node *node)
>>
>>  static bool sun4i_drv_node_is_tcon(struct device_node *node)
>>  {
>> -     return of_device_is_compatible(node, "allwinner,sun5i-a13-tcon") ||
>> +     return of_device_is_compatible(node, "allwinner,sun4i-a10-tcon") ||
>> +             of_device_is_compatible(node, "allwinner,sun5i-a13-tcon") ||
>
> This would be better written with of_match_node. Since there's already a
> match table in sun4i_tcon.c, it would be better to use it.

Tried this and it looks good. I'll send a patch after the merge window.

ChenYu

> Otherwise,
>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
