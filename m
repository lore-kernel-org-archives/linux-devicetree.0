From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 0/4] nvmem: meson: efuse updates
Date: Mon, 12 Nov 2018 13:08:49 +0000
Message-ID: <fe93e6da-e55f-f127-32c2-5f0e46421b7b@linaro.org>
References: <20181030102231.4851-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181030102231.4851-1-jbrunet@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 30/10/18 10:22, Jerome Brunet wrote:
> The first change of this patchset just adds add error message in case
> of failure. If there is problem with the secure monitor, the
> SM_EFUSE_USER_MAX call will be first one to fail so it is better if it
> give us a clue to help debugging, instead af silently failing.
> 
> Next this series adds the peripheral clock missing in this driver.
> Like many other device in amlogic's SoC, the efuse requires a
> peripheral clock to operate. ATM, the clock controller has
> CLK_IGNORE_UNUSED on this clock and we have been lucky enough that the
> bootloader left the clock enabled
> 
> At some point, we would like to remove those CLK_IGNORE_UNUSED, so if a
> driver needs a clock, it needs to properly claim it.
> 
> Srinivas, Kevin,
> The dts change needs to land before the actual driver change, to avoid
> breaking the efuse on our users. If there an agreement on this series,
> Kevin could you provide a tag to Srinivas ?

These are not fixes to any bugs/regressions, so its new material which 
can only go in next dev cycle!

I guess that should also address the patch sequencing issue!

Also I need ack from dt-maintaners on clk bindings to pick patch 2 and 4.

thanks,
srini

> 
> Cheers
> Jerome
