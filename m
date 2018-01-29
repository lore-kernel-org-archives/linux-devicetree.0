From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v7 2/2] media: V3s: Add support for Allwinner CSI.
Date: Tue, 30 Jan 2018 00:12:56 +0100
Message-ID: <CAK8P3a1W2VC3CEUvPLKoE7FGU1Osm53YQ-F892wqNekn-h8m1A@mail.gmail.com>
References: <1517217696-17816-1-git-send-email-yong.deng@magewell.com> <c86097d7-dade-01e5-3826-3f22f9ca4b4f@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c86097d7-dade-01e5-3826-3f22f9ca4b4f-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hugues Fruchet <hugues.fruchet-qxv4g6HH51o@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rick Chang <rick.chang@medi>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 29, 2018 at 10:49 PM, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org> wrote:
> On 01/29/2018 01:21 AM, Yong Deng wrote:
>> Allwinner V3s SoC features two CSI module. CSI0 is used for MIPI CSI-2
>> interface and CSI1 is used for parallel interface. This is not
>> documented in datasheet but by test and guess.
>>
>> This patch implement a v4l2 framework driver for it.
>>
>> Currently, the driver only support the parallel interface. MIPI-CSI2,
>> ISP's support are not included in this patch.
>>
>> Tested-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> Signed-off-by: Yong Deng <yong.deng-+3dxTMOEIRNWk0Htik3J/w@public.gmane.org>
>> ---
>
>
> A previous version (I think v6) had a build error with the use of
> PHYS_OFFSET, so Kconfig was modified to depend on ARM and ARCH_SUNXI
> (one of which seems to be overkill).  As is here, the COMPILE_TEST piece is
> meaningless for all arches except ARM.  If you care enough for COMPILE_TEST
> (and I would), then you could make COMPILE_TEST useful on any arch by
> removing the "depends on ARM" (the ARCH_SUNXI takes care of that) and by
> having an alternate value for PHYS_OFFSET, like so:
>
> +#if defined(CONFIG_COMPILE_TEST) && !defined(PHYS_OFFSET)
> +#define PHYS_OFFSET    0
> +#endif
>
> With those 2 changes, the driver builds for me on x86_64.

I think the PHYS_OFFSET really has to get removed from the driver, it's
wrong on ARM as well.

      Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
