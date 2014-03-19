From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH] mfd: sec-core: Fix uninitialized 'regmap_rtc' on S2MPA01
Date: Wed, 19 Mar 2014 13:57:35 +0530
Message-ID: <CAK9yfHwNmN+M8ncSGjUwnfXs1p-e7pCy5Y-K7uX6JV5JyWYhEg@mail.gmail.com>
References: <20140318110947.GR25478@lee--X1>
	<1395148286-32002-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1395148286-32002-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 18 March 2014 18:41, Krzysztof Kozlowski <k.kozlowski@samsung.com> wrote:
> Initialize the 'regmap_rtc' on S2MPA01 to some sane value. Sane at least
> for S5M87X chipsets, not S2MPS/S2MPA but it won't be used because
> rtc-s5m driver does not support S2MPA01.
>
> This fixes following error:
> drivers/mfd/sec-core.c:342:45: warning: 'regmap_rtc' may be used uninitialized in this function [-Wuninitialized]
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

>From the point of suppressing this warning and considering how it is
done for S2MPS11,
Acked-by: Sachin Kamat <sachin.kamat@linaro.org>

However, shouldn't we be making this RTC handling conditional/optional
depending upon
whether the h/w or s/w supports/implements it?

-- 
With warm regards,
Sachin
