From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v4 00/11] drm/sun4i: hdmi: Support HDMI
 controller on A31
Date: Wed, 11 Oct 2017 16:04:04 +0800
Message-ID: <CAGb2v66B=U5uRvJVcaDSRbNBs+1DAU7=ZmOd4sej=xMeRqX3vg@mail.gmail.com>
References: <20171010032008.682-1-wens@csie.org> <20171011080056.i2eodfsujdhcvxpi@flea.lan>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBDVB67HAKGQEUJCY22A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20171011080056.i2eodfsujdhcvxpi-ZC1Zs529Oq4@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 11, 2017 at 4:00 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Tue, Oct 10, 2017 at 03:19:57AM +0000, Chen-Yu Tsai wrote:
>> Hi everyone,
>>
>> This is v4 of my A31 HDMI support series. The DTS patches depend on
>> the patch "clk: sunxi-ng: sun6i: Export video PLLs" alreay merged.
>> The DRM patches depend on "regmap: add iopoll-like polling macro for
>> regmap_field" already merged on a topic branch in the regmap repository.
>>
>> Changes since v3:
>>
>>     - Renamed sun4i_get_first_tcon() to sun4i_get_tcon0()
>>
>>     - Made sun4i_get_tcon0() return NULL when it fails, and
>>       sun6i_tcon_set_mux() will error out if that happens.
>>
>>     - Removed has_unknown_mux field in tcon_quirks structure,
>>       as its function is replaced by the per-soc muxing function
>>       pointer.
>>
>>     - Dropped clk and regmap patches that were merged.
>>
>> Changes since v2:
>>
>>     - TCON muxing moved into functions for each platform, with pointers
>>       to them in the TCON quirks structure.
>>
>>     - CCU "hdmi-ddc" clock renamed to "ddc".
>>
>>     - Added Maxime's acks.
>>
>> Changes since v1:
>>
>>     - Core changes to sun4i-drm to support two display pipelines
>>       have been merged into drm-misc and thus dropped from this
>>       version
>>
>>     - Reworked DDC variant support onto new exposed I2C interface bits.
>>
>>     - Reworked DDC variant support to use regmap_fields.
>>
>>     - Patches to add variant support to various (TMDS, DDC, HDMI
>>       controller) sub-blocks have been merged into one patch.
>>
>> This series adds support for the HDMI controller found on Allwinner
>> A31/A31s SoCs. It builds upon Maxime's work that added support for
>> the HDMI controller on the Allwinner A10s SoC.
>>
>> The HDMI controllers in the older generation Allwinner SoCs is very
>> similar. The A10/A10s/A20 all have the same hardware block, with the
>> A10 having slightly different initial configuration values. The A31's
>> variant splits out the DDC parent clock, has different formulas for
>> the DDC and TMDS clocks, and a different register layout for the DDC
>> block.
>
> Applied everything, thanks!

Looks like regmap/topic/field (which holds a required patch) was not
merged in. This means there will be some build breakage on drm-misc.

>> Also, it does not expose the CEC pins outside of the SoC, which is
>> unfortunate.
>
> Maybe we shouldn't register the CEC adapter in that case then? Can you
> send an additional patch for that?

My bad. This series started off pre-CEC support. I'll send another patch
for that.

ChenYu

>
> Thanks!
> Maxime
>
> --
> Maxime Ripard, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
