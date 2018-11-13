From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 4/4] nvmem: meson-efuse: add peripheral clock
Date: Tue, 13 Nov 2018 09:06:19 +0000
Message-ID: <256195a8-db8b-0945-090f-a63e5e665b15@linaro.org>
References: <20181030102231.4851-1-jbrunet@baylibre.com>
 <20181030102231.4851-5-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181030102231.4851-5-jbrunet@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 30/10/18 10:22, Jerome Brunet wrote:
> Get and enable the peripheral clock required by the efuse device.
> The driver has been handle to work without it so far because the
> clock was left enabled by default but it won't be the case soon.
> 
> Signed-off-by: Jerome Brunet<jbrunet@baylibre.com>
> ---
>   drivers/nvmem/meson-efuse.c | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)

Applied, thanks,

--
Srini
