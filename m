From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 2/9] drm/sun4i: tcon: Move SoC specific
 quirks to a DT matched data structure
Date: Tue, 11 Oct 2016 17:16:21 +0800
Message-ID: <CAGb2v67vZLCtUOaqBwtAnHmCMpoxmh3pxjtD5TL2nWp3Lm-Pzg@mail.gmail.com>
References: <20161006160629.11198-1-wens@csie.org> <20161006160629.11198-3-wens@csie.org>
 <20161007083853.GH4684@lukather>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBB7W36K7QKGQEYZSEXIQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20161007083853.GH4684@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 7, 2016 at 4:38 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Hi,
>
> On Fri, Oct 07, 2016 at 12:06:22AM +0800, Chen-Yu Tsai wrote:
>> +struct sun4i_tcon_quirks {
>> +     bool    is_sun5i;       /* sun5i has undocumented mux */
>> +     bool    has_channel_1;  /* a33 does not have channel 1 */
>> +     bool    has_bypass_src; /* has separate input bypassing CEU */
>> +     bool    has_dma_src;    /* has DMA input */
>> +};
>> +
>
> I'd really prefer to keep the has_mux quirk name. is_sun5i doesn't
> really relate to what we're doing there, is redundant with the
> compatible, and render the other quirks name useless, since we could
> just have is_sun.i quirks and deal with that (which is essentially
> what we were doing before).

Lets call it has_unknown_mux then. has_mux would be confusing with
the HDMI and MIPI DSI muxes on sun6i.

ChenYu
