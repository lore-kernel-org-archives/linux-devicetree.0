From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] arm64: dts: apq8016-sbc: Add DT node for the uSD SDHC interface
Date: Thu, 4 Feb 2016 14:44:55 -0800
Message-ID: <CAOi56cWWfJCFyC_ndRqhm6c0QeQF=nXkcK3RCVdCDXTBag=+ow@mail.gmail.com>
References: <1454590402-13507-1-git-send-email-georgi.djakov@linaro.org>
	<7hmvrgb06c.fsf@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7hmvrgb06c.fsf@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, devicetree@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Feb 4, 2016 at 2:06 PM, Kevin Hilman <khilman@baylibre.com> wrote:
> Georgi Djakov <georgi.djakov@linaro.org> writes:
>
>> Add the necessary properties to enable the SD-card on db410c boards.
>>
>> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
>
> I tried this with 2 different SD cards on my dragonboard 410c but it's
> not detecting either card.

To be more precise, I tried this patch on v4.5-rc1 and today's
linux-next using the default defconfig + CONFIG_MMC_SDHCI_MSM=y, and
see the same voltage errors on both.

Kevin
