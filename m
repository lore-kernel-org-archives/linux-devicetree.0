From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH] ARM: dts: Explicitly set dr_mode on exynos5250-snow
Date: Sat, 15 Nov 2014 10:27:28 +0100
Message-ID: <CABxcv=k6rkatN0NSq-gkGA+ZS1chS-bcXu=Nxk+Uf=WuPrKR5w@mail.gmail.com>
References: <1415994379-29165-1-git-send-email-sjoerd.simons@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1415994379-29165-1-git-send-email-sjoerd.simons@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hello Sjoerd,

On Fri, Nov 14, 2014 at 8:46 PM, Sjoerd Simons
<sjoerd.simons@collabora.co.uk> wrote:
> Explicitly set the dr_mode for the dwc3 controller on the
> Snow board to host mode. This is required to ensure the
> controller is initialized in the right mode if the kernel is
> build with USB gadget support.

The patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Kukjin,

I think $subject is -rc material since this issue is seen after commit
508423b ("ARM: exynos_defconfig: enable USB gadget support") which
landed in 3.18.

Best regards,
Javier
