From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 3/4] clk: samsung: exynos7: add clocks for audio block
Date: Mon, 22 Dec 2014 16:08:26 +0100
Message-ID: <549833EA.8040506@samsung.com>
References: <1418995427-7712-1-git-send-email-padma.v@samsung.com>
 <1418995427-7712-4-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1418995427-7712-4-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>, devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, mturquette@linaro.org, tomasz.figa@gmail.com
List-Id: devicetree@vger.kernel.org

Hi,

On 19/12/14 14:23, Padmavathi Venna wrote:
> Add required clk support for I2S,PCM amd SPDIF

There is a non-trivial conflict with the MSCL CMU patch, could you
please resend rebased onto my exynos7 branch:

git://linuxtv.org/snawrocki/samsung.git for-v3.20/clk/exynos7 ?

Is exynos7420 documentation applicable to this ?
Would be nice to have someone else who has access to the SoC
documentation replied with a Reviewed-by tag.

-- 
Thanks,
Sylwester
