From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 2/4] nvmem: meson-efuse: bindings: add peripheral clock
Date: Tue, 13 Nov 2018 09:05:57 +0000
Message-ID: <60b49b47-67d6-ef78-0e0b-78d28da1be6e@linaro.org>
References: <20181030102231.4851-1-jbrunet@baylibre.com>
 <20181030102231.4851-3-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181030102231.4851-3-jbrunet@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 30/10/18 10:22, Jerome Brunet wrote:
> The efuse found in gx SoC requires a peripheral clock to properly operate.
> We have been able to work without it until now because the clock was on by
> default, and left on by the CCF. Soon, it will not be the case anymore, so
> the device needs to claim the clock it needs
> 
> Signed-off-by: Jerome Brunet<jbrunet@baylibre.com>
> ---
>   Documentation/devicetree/bindings/nvmem/amlogic-efuse.txt | 3 +++
>   1 file changed, 3 insertions(+)

Applied, thanks,

--
Srini
