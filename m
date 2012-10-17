From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3 2/6] dts: exynos: add device tree support for exynos5
 mixer
Date: Wed, 17 Oct 2012 20:32:09 +0900
Message-ID: <006201cdac5b$0b7cebb0$2276c310$%kim@samsung.com>
References: <1350343834-23992-1-git-send-email-rahul.sharma@samsung.com>
 <1350343834-23992-3-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1350343834-23992-3-git-send-email-rahul.sharma@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
To: 'Rahul Sharma' <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: t.stanislaws@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, kyungmin.park@samsung.com, thomas.ab@samsung.com, prashanth.g@samsung.com, joshi@samsung.com, s.shirish@samsung.com, r.sh.open@gmail.com
List-Id: devicetree@vger.kernel.org

Rahul Sharma wrote:
> 
> This patch adds support for device tree based discovery for exynos5
> mixer. Mixer node is also renamed with "exynos5-mixer".
> 
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>  .../devicetree/bindings/drm/exynos/mixer.txt       |   15 +++++++++++++++
>  arch/arm/boot/dts/exynos5250.dtsi                  |    6 ++++++
>  arch/arm/mach-exynos/include/mach/map.h            |    1 +
>  arch/arm/mach-exynos/mach-exynos5-dt.c             |    2 ++
>  4 files changed, 24 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/drm/exynos/mixer.txt
> 
Basically, same comments on your 1/6 patch.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
