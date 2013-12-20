From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V2 1/2] mfd: AS3722: add dt node properties for system
 power controller
Date: Fri, 20 Dec 2013 09:09:46 -0700
Message-ID: <52B46BCA.1010709@wwwdotorg.org>
References: <1387545840-2844-1-git-send-email-ldewangan@nvidia.com> <20131220134808.GD3709@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20131220134808.GD3709@lee--X1>
Sender: linux-doc-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>
Cc: anton@enomsg.org, dwmw2@infradead.org, mark.rutland@arm.com, rob@landley.net, ijc+devicetree@hellion.org.uk, swarren@nvidia.com, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12/20/2013 06:48 AM, Lee Jones wrote:
> On Fri, 20 Dec 2013, Laxman Dewangan wrote:
> 
>> ams AS3722 device supports the power off by turning off its all rails.
>>
>> Add dt node properties to enable this functionality on this device.
>>
>> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
>> Tested-by: Stephen Warren <swarren@nvidia.com>
> 
> I'm guessing I can use this as an Ack?

You mean for the DT binding? I'm not actually in MAINTAINERS for DT
binding reviews any more, but this binding change is identical to that
which appears in a bunch of other drivers, so I'd tend not to think it
needs an ack.
