From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 2/2] drm/exynos: Add device tree based discovery support
 for G2D
Date: Fri, 01 Feb 2013 09:35:06 -0800
Message-ID: <0c4c01ce00a2$7b826c50$728744f0$@samsung.com>
References: <1359107722-9974-1-git-send-email-sachin.kamat@linaro.org>
 <1359107722-9974-2-git-send-email-sachin.kamat@linaro.org>
 <CAAQKjZNc0xFaoaqtKsLC=Evn60XA5UChtoMLAcgsWqyLNa7ejQ@mail.gmail.com>
 <510987B5.6090509@gmail.com> <050101cdff52$86df3a70$949daf50$%dae@samsung.com>
 <510B02AB.4080908@gmail.com> <0b7501ce0011$3df65180$b9e2f480$@samsung.com>
 <00fd01ce001b$5215a3f0$f640ebd0$%dae@samsung.com>
 <CAK9yfHxqqumg-oqH_Ku8Zkf8biWVknF91Su0VkWJJXjvWQ3Jhw@mail.gmail.com>
 <510B9EC8.6020102@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <510B9EC8.6020102@samsung.com>
Content-language: en-us
Sender: linux-media-owner@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Sachin Kamat' <sachin.kamat@linaro.org>
Cc: 'Inki Dae' <inki.dae@samsung.com>, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree-discuss@lists.ozlabs.org, patches@linaro.org
List-Id: devicetree@vger.kernel.org

Sylwester Nawrocki wrote:
> 
> On 02/01/2013 09:33 AM, Sachin Kamat wrote:
> > On 1 February 2013 06:57, Inki Dae <inki.dae@samsung.com> wrote:
> >>
> >> For example,
> >> If compatible = "samsung,g2d-3.0" is added to exynos4210.dtsi, it'd be
> >> reasonable. But what if that compatible string is added to exynos4.dtsi?.
> >> This case isn't considered for exynos4412 SoC with v4.1.
> >
> > In case of Exynos4 series the base address of G2D ip is different
> > across series. Hence we cannot define it in exynos4.dtsi and need to
> > define the nodes in exynos4xxx.dtsi or specific board files. Thus we
> > can use the version appended compatible string.
> >
> > However even the second option suggested by Sylwester is OK with me or
> > to be even more specific we could go for both SoC as well as version
> > option something like this.
> >
> > compatible = "samsung,exynos3110-g2d-3.0" /* for Exynos3110,
> Exynos4210 */
> > compatible = "samsung,exynos4212-g2d-4.1" /* for Exynos4212,
> Exynos4412 */
> >
> > In any case please let me know the final preferred one so that I can
> > update the code send the revised patches.
> 
> The version with SoC name embedded in it seems most reliable and correct
> to me.
> 
> compatible = "samsung,exynos3110-fimg-2d" /* for Exynos3110 (S5PC110,
> S5PV210),
>                                              Exynos4210 */

If this convention will be used, I hope, the known name, S5PV210 can be used. Why don't you use same SoC name with using in arch/arm/?

> compatible = "samsung,exynos4212-fimg-2d" /* for Exynos4212, Exynos4412
> */
> 
> FIMG stands for Fully Interactive Mobile Graphics, and other multimedia
> IPs follow this naming convention, e.g. FIMG-3D, FIMD (Display Controller),
> FIMC (Camera), etc.
> 
How about MFC?

> This is just my opinion though, and it seems this is a most common scheme
> from greping the device tree bindings documentation.
> 
IMO, you can grep '$ git grep  compatible.*samsung'...or IP name.

> As Stephen pointed out, and I also did in some other mail thread in the
> past, not only an IP revision might be required, but also its integration
> details, specific to an SoC type are important. This actually happens
> to be the case with FIMC, where same version of one instance of the IP
> has more data interfaces routed to other SoC subsystems on one SoC type
> than on other one.
> 
Well, I don't think so. As you know Samsung makes many EXYNOS SoCs and  nowadays the EXYNOS SoCs include many Samsung own IPs such as multimedia. And the IPs are reused on across Samsung SoCs, and I hope on other SoC vendor's SoC. It means Samsung is no longer just SoC vendor and can be called IP vendor. So let's see other IP vendors, ARM, Synopsys and so on. How are their IPs implemented in kernel? Why should Samsung use the SoC name for their IP? And why should we use old SoC name in futre? For example, see the s3c2410-xxx for i2c, wdt, rtc, i2s and so on. Unfortunately, no one didn't know Samsung should prepare some brand name or  future at that time...Just I don't want to undergo trial and error again. I'm still saying why Samsung own IPs cannot be used as IP vendors' ones...

> I think it won't be possible to use a scheme like "samsung-exynos-g2d-3.0"

Hmm...I think, the name, 'EXYNOS' is not a brand name for IP...

> for all IPs. And I would much more like to see a uniform naming convention
> used, rather than living with a chaotic set of compatible properties, that
> has a potential to become even more chaotic in the future.
> 

Thanks.

- Kukjin
