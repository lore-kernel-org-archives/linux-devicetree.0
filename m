From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v2 2/2] drm/exynos: Add device tree based discovery
 support for G2D
Date: Wed, 6 Feb 2013 17:11:13 +0530
Message-ID: <CAK9yfHzUje9tyyZB8-p1hX_tX-U4hzxTNb275nu77rgDZknN1Q@mail.gmail.com>
References: <1360128584-23167-1-git-send-email-sachin.kamat@linaro.org>
	<1360128584-23167-2-git-send-email-sachin.kamat@linaro.org>
	<02a301ce043c$1b12d150$513873f0$%dae@samsung.com>
	<CAK9yfHyZrwdJV-Ct8Fby0uX1htHpAmJvCnX3VRYJSsey=L5HFA@mail.gmail.com>
	<02af01ce0447$37c26940$a7473bc0$%dae@samsung.com>
	<51123D34.5020404@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <51123D34.5020404@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree-discuss@lists.ozlabs.org, k.debski@samsung.com, kgene.kim@samsung.com, patches@linaro.org, Ajay Kumar <ajaykumar.rs@samsung.com>, kyungmin.park@samsung.com, sw0312.kim@samsung.com, jy0922.shim@samsung.com
List-Id: devicetree@vger.kernel.org

On 6 February 2013 16:53, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
> On 02/06/2013 09:51 AM, Inki Dae wrote:
> [...]

> So I propose following classification, which seems less inaccurate:
>
> GPU:   g2d, g3d
> Media: mfc, fimc, fimc-lite, fimc-is, mipi-csis, gsc
> Video: fimd, hdmi, eDP, mipi-dsim

Thanks Inki and Sylwester for your inputs.
We need to figure out some sensible location for these drivers'
documentation though I liked what you have proposed for now.
I will add g2d document to gpu directory as both of you suggest the same.
If there are better opinions will move it later.

-- 
With warm regards,
Sachin
