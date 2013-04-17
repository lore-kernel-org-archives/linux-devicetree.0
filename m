From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 1/2] gpio: samsung: Remove OF support for s3c24xx
Date: Wed, 17 Apr 2013 12:48:13 +0200
Message-ID: <516E7DED.8090905@samsung.com>
References: <1366134094-23140-1-git-send-email-s.nawrocki@samsung.com>
 <201304162013.45134.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <201304162013.45134.heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
Cc: linus.walleij@linaro.org, grant.likely@secretlab.ca, kyungmin.park@samsung.com, kgene.kim@samsung.com, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Thomas Abraham <thomas.abraham@linaro.org>
List-Id: devicetree@vger.kernel.org

On 04/16/2013 08:13 PM, Heiko St=C3=BCbner wrote:
> Am Dienstag, 16. April 2013, 19:41:34 schrieb Sylwester Nawrocki:
>> There is no users of this code and there is already a pinctrl
>> driver written for s3c24xx which is going to be used on any
>> s3c24xx DT platforms. Hence this has been effectively a dead
>> code in mainline.
>>
>> This reverts commit 172c6a13653ac8cd6a231293b87c93821e90c1d6
>> gpio: samsung: add devicetree init for s3c24xx arches
>>
>> Cc: Heiko St=C3=BCbner <heiko@sntech.de>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>=20
> This patch stems from a time where I thought pinctrl on s3c24xx would=
 be ages=20
> away :-D, so

Heh, I just thought I would clean this up a bit. And now we have
a nice pinctrl driver for s3c24xx.=20

As a side note, I've tried it on s3c2440, together with your patch=20
series adding dt support for s3c2416. Need to resolve a couple more
issues and hopefully will have a booting system soon.

> Acked-by: Heiko Stuebner <heiko@sntech.de>

Thanks.

I abstained with posting the second patch, which removes Exynos4/5 OF=20
support from the gpio-samsung driver. Now when those platforms have=20
proper pinctrl driver it is not possible to support simultaneously=20
the old (pre-eliminary) DT bindings and the standard GPIO bindings=20
implemented by the pinctrl driver. Anyway I have it prepared so I'll
post it, at least it might be a starting point for a discussion.


Thanks,
Sylwester
