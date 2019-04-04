From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 0/5] nvmem: sunxi-sid: add SID controller support for
 H6
Date: Thu, 4 Apr 2019 12:00:57 +0100
Message-ID: <265346db-0039-3a66-2f3a-a4595a42078f@linaro.org>
References: <20190402154514.11284-1-tiny.windzz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190402154514.11284-1-tiny.windzz@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Yangtao Li <tiny.windzz@gmail.com>, robh+dt@kernel.org, mark.rutland@arm.com, maxime.ripard@bootlin.com, wens@csie.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 02/04/2019 16:45, Yangtao Li wrote:
> Add SID support for H6, and do some cleanup.
> For endianness issue, add a new ref_read func.
> 
> Yangtao Li (5):
>    nvmem: sunxi-sid: fix wrong description in kernel doc
>    nvmem: sunxi-sid: add binding for H6's SID controller
>    nvmem: sunxi-sid: convert to SPDX license tags

Applied first 3 patches, please resend last two patches after rebase on 
top of next.

Thanks,
srini
