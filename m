From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 1/4] nvmem: meson-efuse: add error message on user_max
 failure.
Date: Mon, 12 Nov 2018 13:08:57 +0000
Message-ID: <419f8f2b-0677-a647-6f01-a1596f2a80cc@linaro.org>
References: <20181030102231.4851-1-jbrunet@baylibre.com>
 <20181030102231.4851-2-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181030102231.4851-2-jbrunet@baylibre.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 30/10/18 10:22, Jerome Brunet wrote:
> Add an explicit error message when SM_EFUSE_USER_MAX command fails
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/nvmem/meson-efuse.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Applied to nvmem for-next branch!

thanks,
srini
