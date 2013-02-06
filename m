From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v2 2/2] drm/exynos: Add device tree based discovery
 support for G2D
Date: Wed, 6 Feb 2013 13:32:34 +0530
Message-ID: <CAK9yfHyZrwdJV-Ct8Fby0uX1htHpAmJvCnX3VRYJSsey=L5HFA@mail.gmail.com>
References: <1360128584-23167-1-git-send-email-sachin.kamat@linaro.org>
	<1360128584-23167-2-git-send-email-sachin.kamat@linaro.org>
	<02a301ce043c$1b12d150$513873f0$%dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <02a301ce043c$1b12d150$513873f0$%dae@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree-discuss@lists.ozlabs.org, k.debski@samsung.com, s.nawrocki@samsung.com, kgene.kim@samsung.com, patches@linaro.org, Ajay Kumar <ajaykumar.rs@samsung.com>
List-Id: devicetree@vger.kernel.org

On 6 February 2013 13:02, Inki Dae <inki.dae@samsung.com> wrote:
>
> Looks good to me but please add document for it.

Yes. I will. I was planning to send the bindings document patch along
with the dt patches (adding node entries to dts files).
Sylwester had suggested adding this to
Documentation/devicetree/bindings/media/ which contains other media
IPs.

>
> To other guys,
> And is there anyone who know where this document should be added to?
> I'm not sure that the g2d document should be placed in
> Documentation/devicetree/bindings/gpu, media, drm/exynos or arm/exynos. At
> least, this document should be shared with the g2d hw relevant drivers such
> as v4l2 and drm. So is ".../bindings/gpu" proper place?
>


-- 
With warm regards,
Sachin
