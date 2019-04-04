From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 4/5] nvmem: sunxi-sid: add new reg_read func
Date: Thu, 4 Apr 2019 11:59:44 +0100
Message-ID: <7dc60dd9-3bbb-f215-4554-a0051c0cfbfd@linaro.org>
References: <20190402154514.11284-1-tiny.windzz@gmail.com>
 <20190402154514.11284-5-tiny.windzz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190402154514.11284-5-tiny.windzz@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Yangtao Li <tiny.windzz@gmail.com>, robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 02/04/2019 16:45, Yangtao Li wrote:
> Because there was an endianness issue. It seems that reg_read
> function which the nvmem the driver currently exposes is wrong.
> So add the new read function, the new function is used when the
> native_endian flag is set.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>

This patch and 5/5 does not apply cleanly on nvmem-next.
Also I would need an ack from Maxime to be able to apply it.

thanks,
srini
