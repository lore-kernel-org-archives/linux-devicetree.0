From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] mfd: sec-core: Fix uninitialized 'regmap_rtc' on S2MPA01
Date: Wed, 19 Mar 2014 09:41:13 +0100
Message-ID: <1395218473.18730.6.camel@AMDC1943>
References: <20140318110947.GR25478@lee--X1>
 <1395148286-32002-1-git-send-email-k.kozlowski@samsung.com>
 <CAK9yfHwNmN+M8ncSGjUwnfXs1p-e7pCy5Y-K7uX6JV5JyWYhEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CAK9yfHwNmN+M8ncSGjUwnfXs1p-e7pCy5Y-K7uX6JV5JyWYhEg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, 2014-03-19 at 13:57 +0530, Sachin Kamat wrote:
> On 18 March 2014 18:41, Krzysztof Kozlowski <k.kozlowski@samsung.com> wrote:
> > Initialize the 'regmap_rtc' on S2MPA01 to some sane value. Sane at least
> > for S5M87X chipsets, not S2MPS/S2MPA but it won't be used because
> > rtc-s5m driver does not support S2MPA01.
> >
> > This fixes following error:
> > drivers/mfd/sec-core.c:342:45: warning: 'regmap_rtc' may be used uninitialized in this function [-Wuninitialized]
> >
> > Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 
> From the point of suppressing this warning and considering how it is
> done for S2MPS11,
> Acked-by: Sachin Kamat <sachin.kamat@linaro.org>
> 
> However, shouldn't we be making this RTC handling conditional/optional
> depending upon
> whether the h/w or s/w supports/implements it?

I think the rtc-s5m driver should instantiate his regmap on its own. The
same with i2c dummy device. This would remove problems with unsupported
chipsets by rtc-s5m driver.


Best regards,
Krzysztof
