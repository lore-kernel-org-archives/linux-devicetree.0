From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v2 1/5] soundwire: Add compute_params
 callback
Date: Wed, 4 Sep 2019 08:36:46 -0500
Message-ID: <f4a4c2d6-ebc9-f4e3-b725-1158a93a4ba2@linux.intel.com>
References: <20190813083550.5877-1-srinivas.kandagatla@linaro.org>
 <20190813083550.5877-2-srinivas.kandagatla@linaro.org>
 <20190904092846.GO2672@vkoul-mobl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190904092846.GO2672@vkoul-mobl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: broonie@kernel.org, bgoswami@codeaurora.org, plai@codeaurora.org, robh+dt@kernel.org, devicetree@vger.kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, spapothi@codeaurora.org
List-Id: devicetree@vger.kernel.org

On 9/4/19 4:28 AM, Vinod Koul wrote:
> On 13-08-19, 09:35, Srinivas Kandagatla wrote:
>> From: Vinod Koul <vkoul@kernel.org>
>>
>> This callback allows masters to compute the bus parameters required.
> 
> Applied this to help manage cross dependencies with various folks better, thanks

Meh. doesn't really help, see my earlier comment, it's missing a call to 
compute_params in deprepare() so not sure this is works...
