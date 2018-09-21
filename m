Return-Path: <SRS0=3FRZ=MD=linaro.org=todor.tomov@kernel.org>
Subject: Re: [PATCH v4 2/2] i2c: Add Qualcomm CCI I2C driver
References: <20180820063953.6866-1-vkoul@kernel.org>
 <20180820063953.6866-3-vkoul@kernel.org>
 <153509585617.28926.14526626631390463379@swboyd.mtv.corp.google.com>
 <20180824101635.GO2388@vkoul-mobl>
 <153539758798.129321.2300393649173468216@swboyd.mtv.corp.google.com>
 <20180828033851.GA2388@vkoul-mobl>
 <CAPybu_0Patmox+1rd19mD03qfSbhNzR+6gmaJwsmhu650s36fA@mail.gmail.com>
 <20180921153601.GF2350@vkoul-mobl>
From: Todor Tomov <todor.tomov@linaro.org>
Message-ID: <e5f9a67a-fa04-45b4-9a21-bc42e7e06b4f@linaro.org>
Date: Fri, 21 Sep 2018 08:43:09 -0700
MIME-Version: 1.0
In-Reply-To: <20180921153601.GF2350@vkoul-mobl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Vinod <vkoul@kernel.org>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: swboyd@chromium.org, wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Vinod,

On 21.09.2018 08:36, Vinod wrote:
> Hi Ricardo,
> 
> On 20-09-18, 21:39, Ricardo Ribalda Delgado wrote:
>> Sorry to enter the discussion this late.
>>
>> I have been using this driver with release/qcomlt-4.14 on a db820c and
>> if I try to use the i2c bus before camss is running I get a Timeout
>> error and the bus is unusable after that. I have sent a patch that
>> fixes this issue, in case you want to merge it/add it before this
>> driver goes upstream.
> 
> Thanks for this, I will test and port the fix to upstream and send it
> along.
> 
>> Is there a way to use the i2c bus without using the camera?
> 
> This is Camera specific bus but it is an i2c bus, so theoretically it
> should be possible to do so, Todor do you know if that is doable/done?

I'm not aware of such experiments but yes, if you manage to connect
another i2c hardware it should be possible to control it.

-- 
Best regards,
Todor Tomov
