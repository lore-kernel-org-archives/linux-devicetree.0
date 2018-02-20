Return-Path: <SRS0=mrth=FO=codeaurora.org=ilina@kernel.org>
Date: Tue, 20 Feb 2018 15:42:05 +0000
From: Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: introduce Command DB for QCOM SoCs
Message-ID: <20180220154205.GC28504@codeaurora.org>
References: <20180216224614.24037-1-ilina@codeaurora.org>
 <20180216224614.24037-3-ilina@codeaurora.org>
 <20180219203106.mfzmxy42biwo33qj@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20180219203106.mfzmxy42biwo33qj@rob-hp-laptop>
To: Rob Herring <robh@kernel.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, sboyd@codeaurora.org, rnayak@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Mahesh Sivasubramanian <msivasub@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>

On Mon, Feb 19 2018 at 20:31 +0000, Rob Herring wrote:
>On Fri, Feb 16, 2018 at 03:46:14PM -0700, Lina Iyer wrote:
>> From: Mahesh Sivasubramanian <msivasub@codeaurora.org>
>>
>> +The devicetree representation of the command DB driver should be:
>
>Need to state this is a child of /reserved-memory
Yes, ofcourse. Will fix.

>
>> +
>> +PROPERTIES:
>
>Why the yelling? :)
>
Oops.

>> +- compatible:
>> +	Usage: required
>> +	Value type: <string>
>> +	Definition: Should be "qcom,cmd-db"
>
>reg?
>
Yes.

Thanks Rob for the reveiw.
-- Lina
