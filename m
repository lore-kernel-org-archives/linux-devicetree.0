From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 0/8] MFD: add driver for HiSilicon Hi6421v530 PMIC
Date: Tue, 6 Jun 2017 14:58:29 +0100
Message-ID: <20170606135829.dxi3mf7so4j5ml3q@dell>
References: <20170606085143.13154-1-guodong.xu@linaro.org>
 <CAK8P3a25o6HOFw4MWrsnKjHJf4YuO+UvGk+=f30LREnFHM3QwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAK8P3a25o6HOFw4MWrsnKjHJf4YuO+UvGk+=f30LREnFHM3QwQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Riku Voipio <riku.voipio-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 06 Jun 2017, Arnd Bergmann wrote:

> On Tue, Jun 6, 2017 at 10:51 AM, Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > This patchset adds driver for HiSilicon Hi6421v530 PMIC.
> >
> > Mainline kernel already has driver support to a similar chip, Hi6421.
> > Hi6421 and Hi6421v530 are both from the same vendor, HiSilicon, but
> > they are at different revisions. They both use the same Memory-mapped
> > I/O method to communicate with Main SoC. However, they differ quite a
> > lot in their regulator designs. Eg. they have completely different LDO
> > voltage points.
> >
> > Patch 1 and 2 are hi6421-pmic cleaning up.
> > Patch 3 and 4 extends hi6421-pmic-core.c to support Hi6421v530 revision.
> > Patch 5 add hi6421v530-regulator.c driver for LDO regulators.
> > Patch 6 fixes an issue for hi6421 regulator, which is not related to v530
> >          but it's found in this review.
> > Patch 7 is dts change, it depends on and can be applied to hi3660/hikey960
> >         patchset [1].
> > Patch 8 enables the relevant config items.
> 
> Looks good to me,

Is that an Ack?

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
