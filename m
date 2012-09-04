From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v4 0/2] Add device tree and clock support for G-Scaler
Date: Wed, 05 Sep 2012 07:07:00 +0900
Message-ID: <227001cd8ae9$9b76ce40$d2646ac0$%kim@samsung.com>
References: <1344852144-25598-1-git-send-email-shaik.ameer@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1344852144-25598-1-git-send-email-shaik.ameer@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
To: 'Shaik Ameer Basha' <shaik.ameer@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: olofj@google.com, thomas.ab@samsung.com, sylvester.nawrocki@gmail.com, joshi@samsung.com, shaik.samsung@gmail.com
List-Id: devicetree@vger.kernel.org

Shaik Ameer Basha wrote:
> 
> This patch series adds clock support for G-Scaler and device node
>  entries for G-Scaler on exynos5.
> 
> This patch is based on Kukjin Kim's (linux-samsung) for-next branch.
>
https://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> 
> changes since v3:
> - Addressed review comments from Kukjin Kim
>     http://www.mail-archive.com/linux-samsung-
> soc@vger.kernel.org/msg11658.html
>     http://www.mail-archive.com/linux-samsung-
> soc@vger.kernel.org/msg11659.html
> 
> changes since v2:
> - Addressed review comments from Sylwester Nawrocki
>     http://www.mail-archive.com/linux-samsung-
> soc@vger.kernel.org/msg11372.html
> - Addressed review comments from Kukjin Kim and Sunyoung Kang
>     http://www.mail-archive.com/linux-samsung-
> soc@vger.kernel.org/msg11377.html
>     http://www.mail-archive.com/linux-samsung-
> soc@vger.kernel.org/msg11429.html
> 
> changes since v1:
> - Addressed review comments from Sylwester Nawrocki
>     http://www.mail-archive.com/linux-samsung-
> soc@vger.kernel.org/msg11177.html
> - Addressed review comments from Sachin Kamat
>     http://www.mail-archive.com/linux-samsung-
> soc@vger.kernel.org/msg11176.html
>     http://www.mail-archive.com/linux-samsung-
> soc@vger.kernel.org/msg11178.html
> 
> Shaik Ameer Basha (2):
>   ARM: EXYNOS: Add clock support for G-Scaler
>   ARM: EXYNOS: Adds G-Scaler device from Device Tree
> 
>  .../devicetree/bindings/media/exynos5-gsc.txt      |   32 +++++++
>  arch/arm/boot/dts/exynos5250.dtsi                  |   28 +++++++
>  arch/arm/mach-exynos/clock-exynos5.c               |   86
> ++++++++++++++++++++
>  arch/arm/mach-exynos/include/mach/map.h            |    5 +
>  arch/arm/mach-exynos/mach-exynos5-dt.c             |    8 ++
>  5 files changed, 159 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/exynos5-
> gsc.txt

Looks OK, will apply this series.

BTW, just wondering...the sign-chain is right? Hoping you know, if sign-off
has been added without their handling on the patches, it's wrong.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
