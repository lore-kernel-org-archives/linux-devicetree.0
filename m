From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: Add Qualcomm USB Super-Speed PHY
 bindings
Date: Fri, 21 Dec 2018 08:37:56 +0100
Message-ID: <14fc8e2e-f3c9-ef87-ec8f-51bdaea90470@linaro.org>
References: <1544176558-7946-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1544176558-7946-2-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <154533751009.79149.13940391507897650993@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <154533751009.79149.13940391507897650993@swboyd.mtv.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>, gregkh@linuxfoundation.org, kishon@ti.com, mark.rutland@arm.com, robh+dt@kernel.org
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, shawn.guo@linaro.org, vkoul@kernel.org
List-Id: devicetree@vger.kernel.org

On 12/20/18 21:25, Stephen Boyd wrote:
> Quoting Jorge Ramirez-Ortiz (2018-12-07 01:55:57)
>> +
>> +- qcom,vdd-voltage-level:
>> +    Value type: <prop-array>
>> +    Definition: This is a list of three integer values <no min max> where
>> +                each value corresponding to voltage corner in uV.
> As far as I'm aware, this isn't how qcom's voltage corners are handled
> or are going to be handled. Can't you hardcode it in the driver for now?
>
>

ok so you mean use a regulator to control the supply (with 
regulator-min-microvolt and max-microvolt properties instead?
I'll look into that

I guess we should pull back on this one as well?
https://lore.kernel.org/patchwork/patch/1026641/
