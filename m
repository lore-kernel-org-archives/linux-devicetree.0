From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 2/2] clk: max77620: Add clock driver for MAX77620/MAX20024
Date: Fri, 10 Jun 2016 19:01:57 +0530
Message-ID: <575AC14D.4080907@nvidia.com>
References: <1465553536-23838-1-git-send-email-ldewangan@nvidia.com>	<1465553536-23838-2-git-send-email-ldewangan@nvidia.com>	<CABxcv=mrmN5Mzt595ZFgGbOoHJWQMwQ1wiCvcHEiWh_79EbJqQ@mail.gmail.com>	<575ABD10.60208@nvidia.com> <CABxcv==7=PZ2HDtryNZHW0CcLaCAkBBT+XWJ0TJRS4uX48k_=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <CABxcv==7=PZ2HDtryNZHW0CcLaCAkBBT+XWJ0TJRS4uX48k_=w@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: devicetree@vger.kernel.org

+ Krzysztof,

On Friday 10 June 2016 07:02 PM, Javier Martinez Canillas wrote:
> Hello Laxman,
>
> On Fri, Jun 10, 2016 at 9:13 AM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
>> So until I change it too generic, it will not be possible.
>> Also if it is require then what about all max77686/max77802 and max77620 in
>> single file, the way we did for RTC.
>> We dont need 4 files for the similar driver then.
>>
> Indeed, probably is better to have a single driver to handle all these
> IP variants since they seem to be quite similar.
>
>
Yaah, single driver will be very clean approach. But it needs some 
testing on max77802 and max77686 based platform as I do not have any driver.
I will need help on this from you.





