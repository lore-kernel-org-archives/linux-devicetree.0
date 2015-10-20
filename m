From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH v2 0/6] Switch to generic syscon regmap based drivers
Date: Tue, 20 Oct 2015 12:29:12 +0200
Message-ID: <56261778.8060400@osg.samsung.com>
References: <1445333085-22837-1-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1445333085-22837-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: kgene@kernel.org, k.kozlowski@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello Alim,

On 10/20/2015 11:24 AM, Alim Akhtar wrote:
> Now we have a nice way to reboot/poweroff system using a generic
> syscon regmap based drivers, this series moves exynos SoCs to
> make use of the same.
> 

I tested this series on an Exynos5800 Peach Pi and an Exynos5422 Odroid XU.
Reboot and poweroff are working correctly on both boards with these patches.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
