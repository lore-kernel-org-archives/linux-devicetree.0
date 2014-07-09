From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: a case for a common efuse API?
Date: Wed, 09 Jul 2014 22:42:25 +0200
Message-ID: <53BDA931.5010600@gmail.com>
References: <53BC4DD7.20906@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <53BC4DD7.20906@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

On 08.07.2014 22:00, Stephen Boyd wrote:
> Hi,
> 
> On MSM chips we have some efuses (called qfprom) where we store things
> like calibration data, speed bins, etc. We need to read out data from
> the efuses in various drivers like the cpufreq, thermal, etc. This
> essentially boils down to a bunch of readls on the efuse from a handful
> of different drivers.

We have similar thing on Exynos SoCs as well. If you're interested in
looking at our use cases, then there was an RFC series posted quite a
long time ago [1], but then things stalled.

[1] https://lkml.org/lkml/2013/11/15/155

Best regards,
Tomasz
