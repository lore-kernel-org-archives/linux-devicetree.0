From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] of: platform: stop accessing invalid dev in
 of_platform_device_destroy
Date: Sat, 2 Jun 2018 00:35:31 +0100
Message-ID: <3f925507-bd67-a73d-586e-0458038a5832@linaro.org>
References: <20180601225822.23439-1-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180601225822.23439-1-srinivas.kandagatla@linaro.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, frowand.list@gmail.com
Cc: linux-arm-msm@vger.kernel.org, bgoswami@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rohkumar@qti.qualcomm.com
List-Id: devicetree@vger.kernel.org



On 01/06/18 23:58, Srinivas Kandagatla wrote:
>   
> -	of_node_clear_flag(dev->of_node, OF_POPULATED);
> -	of_node_clear_flag(dev->of_node, OF_POPULATED_BUS);
This change seems to have a side effect during re-probing. I will dig in 
bit more to see how best it can be fixed.

thanks,
srini
