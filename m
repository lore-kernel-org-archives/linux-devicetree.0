From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH v2 1/5] gpio: of: Reflect decoupling of open collector
 and active low/high
Date: Wed, 24 May 2017 14:10:48 +0530
Message-ID: <59254710.30101@nvidia.com>
References: <1495550852-3672-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1495550852-3672-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, linus.walleij@linaro.org
Cc: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, patches@opensource.wolfsonmicro.com, frowand.list@gmail.com
List-Id: devicetree@vger.kernel.org


On Tuesday 23 May 2017 08:17 PM, Charles Keepax wrote:
> Commit 4c0facddb7d8 ("gpio: core: Decouple open drain/source flag with
> active low/high") decoupled the open collector outputs from active
> low/high but did not update the documentation.
>
> Update the device tree documentation to correctly reflect this new
> separation between the two concepts.
>
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---

Acked-by: Laxman Dewangan <ldewangan@nvidia.com>

Thanks,
Laxman

-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------
