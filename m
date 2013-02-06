From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 2/2] drm/exynos: Add device tree based discovery support
 for G2D
Date: Wed, 06 Feb 2013 12:23:32 +0100
Message-ID: <51123D34.5020404@samsung.com>
References: <1360128584-23167-1-git-send-email-sachin.kamat@linaro.org>
 <1360128584-23167-2-git-send-email-sachin.kamat@linaro.org>
 <02a301ce043c$1b12d150$513873f0$%dae@samsung.com>
 <CAK9yfHyZrwdJV-Ct8Fby0uX1htHpAmJvCnX3VRYJSsey=L5HFA@mail.gmail.com>
 <02af01ce0447$37c26940$a7473bc0$%dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <02af01ce0447$37c26940$a7473bc0$%dae@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree-discuss@lists.ozlabs.org, k.debski@samsung.com, kgene.kim@samsung.com, patches@linaro.org, 'Ajay Kumar' <ajaykumar.rs@samsung.com>, kyungmin.park@samsung.com, sw0312.kim@samsung.com, jy0922.shim@samsung.com
List-Id: devicetree@vger.kernel.org

On 02/06/2013 09:51 AM, Inki Dae wrote:
[...]
> I think that it's better to go to gpu than media and we can divide Exynos
> IPs into the bellow categories,
> 
> Media : mfc
> GPU : g2d, g3d, fimc, gsc

Heh, nice try! :) GPU and FIMC ? FIMC is a camera subsystem (hence 'C' 
in the acronym), so what it has really to do with GPU ? All right, this IP 
has really two functions: camera capture and video post-processing 
(colorspace conversion, scaling), but the main feature is camera capture 
(fimc-lite is a camera capture interface IP only).

Also, Exynos5 GScaler is used as a DMA engine for camera capture data
pipelines, so it will be used by a camera capture driver as well. It
really belongs to "Media" and "GPU", as this is a multifunctional 
device (similarly to FIMC).

So I propose following classification, which seems less inaccurate:

GPU:   g2d, g3d
Media: mfc, fimc, fimc-lite, fimc-is, mipi-csis, gsc
Video: fimd, hdmi, eDP, mipi-dsim

I have already a DT bindings description prepared for fimc [1].
(probably it needs to be rephrased a bit not to refer to the linux
device model). I put it in Documentation/devicetree/bindings/media/soc, 
but likely there is no need for the 'soc' subdirectory...

> Video : fimd, hdmi, eDP, MIPI-DSI
> 
> And I think that the device-tree describes hardware so possibly, all
> documents in .../bindings/drm/exynos/* should be moved to proper place also.
> Please give  me any opinions.

Yes, I agree. If possible, it would be nice to have some Linux API
agnostic locations.

[1] goo.gl/eTGOl

--

Thanks,
Sylwester
