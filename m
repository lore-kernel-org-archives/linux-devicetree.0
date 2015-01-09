From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH v3] ARM: dts: Add dts file for odroid XU3 board
Date: Fri, 09 Jan 2015 09:10:24 -0800
Message-ID: <7htwzzvq0v.fsf@deeprootsystems.com>
References: <1420671228-24692-1-git-send-email-sjoerd.simons@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1420671228-24692-1-git-send-email-sjoerd.simons@collabora.co.uk>
	(Sjoerd Simons's message of "Wed, 7 Jan 2015 23:53:48 +0100")
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tyler Baker <tyler.baker@linaro.org>, Heesub Shin <heesub.shin@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Sjoerd Simons <sjoerd.simons@collabora.co.uk> writes:

> Add DTS for the Hardkernel Odroid XU3. The name of the DTS file is kept the
> same as the vendors naming, which means it's prefixed with exynos5422
> instead of exynos5800 as the SoC name even though it includes the
> exyno5800 dtsi.
>
> Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>

Boot tested on top of next-20150109 (with and without my hack for
bringing up 8 cores.)

Tested-by: Kevin Hilman <khilman@linaro.org>

Kevin
