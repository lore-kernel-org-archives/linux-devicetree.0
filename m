From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v5 1/2] mfd: arizona: Update reset pin to use GPIOD
Date: Wed, 28 Mar 2018 12:07:53 +0100
Message-ID: <20180328110753.vqhngsus5gpl6qld@dell>
References: <20180312155201.30108-1-ckeepax@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180312155201.30108-1-ckeepax@opensource.cirrus.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
List-Id: devicetree@vger.kernel.org

On Mon, 12 Mar 2018, Charles Keepax wrote:

> Now GPIOD has support for both pdata systems and for non-standard DT
> bindings the Arizona reset GPIO can be converted to use it. Worth
> noting gpiod_set_raw_value_cansleep is used to match the behaviour
> of the old GPIOs. This is because the part is fairly widely used and
> it is unknown how many DTs are correctly setting active low through
> device tree, so to avoid breaking any existing users it is best to
> match the previous behaviour.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
> 
> Changes since v4:
>  - Don't use a switch statement for handling return values
>  - Add some comments to the handling for the older binding
>  - Use gpiod_set_raw_value_cansleep to avoid potential breakage
> 
> I have also removed Linus's reviewed-by was a bit border line but
> I felt there have probably been enough code changes since he gave
> it that it was probably safer to remove it.
> 
> Thanks,
> Charles
> 
>  drivers/mfd/arizona-core.c        | 53 ++++++++++++++++++++++++++-------------
>  include/linux/mfd/arizona/pdata.h |  3 ++-
>  2 files changed, 37 insertions(+), 19 deletions(-)

Applied with Linus' Ack, thanks

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
