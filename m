From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: dts: Fix compatible value of pinctrl module on
 EXYNOS5440
Date: Thu, 17 Jan 2013 19:40:51 -0800
Message-ID: <009901cdf52d$a0dcf0e0$e296d2a0$@samsung.com>
References: <1357172423-8217-1-git-send-email-kgene.kim@samsung.com>
 <CACRpkdYCw8pyR2hGkMT_uMCyHUU_fCF4Zn9DhXPyuF+74JLfAg@mail.gmail.com>
 <50F8B257.1090108@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <50F8B257.1090108@gmail.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
To: 'Rob Herring' <robherring2@gmail.com>, 'Linus Walleij' <linus.walleij@linaro.org>
Cc: 'Grant Likely' <grant.likely@secretlab.ca>, 'Stephen Warren' <swarren@wwwdotorg.org>, linux-samsung-soc@vger.kernel.org, 'Thomas Abraham' <thomas.ab@samsung.com>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Rob Herring wrote:

[...]

> 
> As long as we're consistently inconsistent... What about 4210 and 4x12?
> Hopefully, the reason was to avoid breaking them.
> 
> This creates horrible incompatibilities between dts and kernel versions
> by changing both. Any prior kernel will not work with this dts or later.
> And more importantly this kernel version or newer will not work with
> existing dtb's. We've been pretty lax on this as DT support has been
> under heavy development, but things need to start tightening up. That
> being said, if this isn't yet a concern for this platform, then I don't
> really care.
> 

I think, this can be applied for v3.8 and this two fixes should be harmless
for DT compatibility of Samsung stuff.

If there is no other concerns, let me pick up with Linus Walleij's ack.

Thanks.

- Kukjin
