From: Inki Dae <inki.dae@samsung.com>
Subject: RE: [PATCH v2 2/2] drm/exynos: Add device tree based discovery support
 for G2D
Date: Wed, 06 Feb 2013 17:51:56 +0900
Message-ID: <02af01ce0447$37c26940$a7473bc0$%dae@samsung.com>
References: <1360128584-23167-1-git-send-email-sachin.kamat@linaro.org>
 <1360128584-23167-2-git-send-email-sachin.kamat@linaro.org>
 <02a301ce043c$1b12d150$513873f0$%dae@samsung.com>
 <CAK9yfHyZrwdJV-Ct8Fby0uX1htHpAmJvCnX3VRYJSsey=L5HFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <CAK9yfHyZrwdJV-Ct8Fby0uX1htHpAmJvCnX3VRYJSsey=L5HFA@mail.gmail.com>
Content-language: ko
Sender: linux-media-owner@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree-discuss@lists.ozlabs.org, k.debski@samsung.com, s.nawrocki@samsung.com, kgene.kim@samsung.com, patches@linaro.org, 'Ajay Kumar' <ajaykumar.rs@samsung.com>, kyungmin.park@samsung.com, sw0312.kim@samsung.com, jy0922.shim@samsung.com
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Sachin Kamat [mailto:sachin.kamat@linaro.org]
> Sent: Wednesday, February 06, 2013 5:03 PM
> To: Inki Dae
> Cc: linux-media@vger.kernel.org; dri-devel@lists.freedesktop.org;
> devicetree-discuss@lists.ozlabs.org; k.debski@samsung.com;
> s.nawrocki@samsung.com; kgene.kim@samsung.com; patches@linaro.org; Ajay
> Kumar
> Subject: Re: [PATCH v2 2/2] drm/exynos: Add device tree based discovery
> support for G2D
> 
> On 6 February 2013 13:02, Inki Dae <inki.dae@samsung.com> wrote:
> >
> > Looks good to me but please add document for it.
> 
> Yes. I will. I was planning to send the bindings document patch along
> with the dt patches (adding node entries to dts files).
> Sylwester had suggested adding this to
> Documentation/devicetree/bindings/media/ which contains other media
> IPs.

I think that it's better to go to gpu than media and we can divide Exynos
IPs into the bellow categories,

Media : mfc
GPU : g2d, g3d, fimc, gsc
Video : fimd, hdmi, eDP, MIPI-DSI

And I think that the device-tree describes hardware so possibly, all
documents in .../bindings/drm/exynos/* should be moved to proper place also.
Please give  me any opinions.

Thanks,
Inki Dae

> 
> >
> > To other guys,
> > And is there anyone who know where this document should be added to?
> > I'm not sure that the g2d document should be placed in
> > Documentation/devicetree/bindings/gpu, media, drm/exynos or arm/exynos.
> At
> > least, this document should be shared with the g2d hw relevant drivers
> such
> > as v4l2 and drm. So is ".../bindings/gpu" proper place?
> >
> 
> 
> --
> With warm regards,
> Sachin
