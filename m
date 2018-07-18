From: Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 00/18] arm64: allwinner: Add A64 DE2 HDMI support
Date: Wed, 18 Jul 2018 18:26:43 +0530
Message-ID: <CAD6G_RQQyS=zeqvhBP8vVf5sHZgLwqX1SP0SKLHea_L4Od3woQ@mail.gmail.com>
References: <20180718105458.22304-1-jagan@amarulasolutions.com> <20180718124448.2s2b3jxbsqt46cgu@flea>
Reply-To: jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCV4FV5N34IRBDHSXTNAKGQEMQI7EWA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180718124448.2s2b3jxbsqt46cgu@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 18, 2018 at 6:14 PM, Maxime Ripard
<maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org> wrote:
> On Wed, Jul 18, 2018 at 04:24:40PM +0530, Jagan Teki wrote:
>> Allwinner A64 has display engine pipeline like other Allwinner SOC's A83T/H3/H5.
>>
>> A64 behaviour similar to Allwinner A83T where
>> Mixer0 => TCON0 => LVDS/RGB/MIPI-DSI
>> Mixer1 => TCON1 => HDMI
>> as per Display System Block Diagram from Allwinner_A64_User_Manual_V1.1.pdf
>>
>> This is third patch-set followed with previous RFC[1], first and second
>> series[2][3] and merely concentrated on HDMI pipeline through TCON1 and
>> rest will add eventually.
>>
>> This series fixed previous version comments
>> - Rebasing on linux-next
>> - sqash all pipeline components in one patch
>> - Enable all pipeline components in board dts
>> - about documenting fallback compatibles
>> - adding new compatible for mixer1
>
> You still haven't figured out the SRAM parts. We asked you to fix this
> in the v1 and the v2 already, and we're not going to merge this
> without those bits figured out properly.

Sorry I'm not sure what I'm trying to do on SRAM here because the last
mail, I have waited for Icenowy changes about simple_fb with sram_c on
ccu node and those are merged. can you elaborate please.

>
>> Log:
>> [    1.450984] Jagan: sun8i_mixer_probe
>> [    1.464981] sun4i-drm display-engine: bound 1200000.mixer (ops sun8i_mixer_ops)
>> [    1.472572] sun4i-drm display-engine: bound 1c0d000.lcd-controller (ops sun4i_tcon_ops)
>> [    1.480676] sun8i-dw-hdmi 1ee0000.hdmi: Linked as a consumer to regulator.10
>> [    1.488738] sun8i-dw-hdmi 1ee0000.hdmi: Detected HDMI TX controller v1.32a with HDCP (sun8i_dw_hdmi_phy)
>> [    1.498879] sun8i-dw-hdmi 1ee0000.hdmi: registered DesignWare HDMI I2C bus driver
>> [    1.507372] sun4i-drm display-engine: bound 1ee0000.hdmi (ops sun8i_dw_hdmi_ops)
>> [    1.514778] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
>> [    1.521398] [drm] No driver support for vblank timestamp query.
>> [    1.684611] random: fast init done
>> [    2.011575] Console: switching to colour frame buffer device 180x56
>> [    2.049858] sun4i-drm display-engine: fb0: DRM emulated frame buffer device
>> [    2.057268] [drm] Initialized sun4i-drm 1.0.0 20150629 for display-engine on minor 0
>>
>> Note:
>> Pine64 boards are unable to get edid by default like other A64 boards,
>> but forcing 'video=HDMI-A-1:1920x1080@60D' kernel command line can
>> create edid with display on penel
>
> Then that needs to be figured out before it's enabled, instead of
> having a hack that barely works.

Any suggestion to work.
