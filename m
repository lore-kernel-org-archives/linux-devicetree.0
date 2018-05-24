Return-Path: <SRS0=IpBQ=IL=codeaurora.org=rnayak@kernel.org>
Subject: Re: [PATCH v6 4/5] arm64: dts: sdm845: Add serial console support
References: <1522429700-13083-1-git-send-email-kramasub@codeaurora.org>
 <1522429700-13083-5-git-send-email-kramasub@codeaurora.org>
 <ebe4515d-a26f-a825-0353-666b0b5ad9f5@codeaurora.org>
 <CAD=FV=WwVjMKDoL29fqdzSmi5SRQOxk_mV2=7br8HUK_hUc+XQ@mail.gmail.com>
From: Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <ae894880-33e8-dc12-e69c-218db6d7b251@codeaurora.org>
Date: Thu, 24 May 2018 07:53:19 +0530
MIME-Version: 1.0
In-Reply-To: <CAD=FV=WwVjMKDoL29fqdzSmi5SRQOxk_mV2=7br8HUK_hUc+XQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Doug Anderson <dianders@chromium.org>
Cc: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wolfram Sang <wsa@the-dreams.de>, linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, Evan Green <evgreen@chromium.org>, acourbot@chromium.org, Stephen Boyd <swboyd@chromium.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-ID: <devicetree@vger.kernel.org>


On 05/23/2018 08:43 PM, Doug Anderson wrote:
> Rajendra,
> 
> On Tue, May 22, 2018 at 11:30 PM, Rajendra Nayak <rnayak@codeaurora.org> wrote:
>>
>>
>> On 03/30/2018 10:38 PM, Karthikeyan Ramasubramanian wrote:
>>> From: Rajendra Nayak <rnayak@codeaurora.org>
>>>
>>> Add the qup uart node and geni se instance needed to
>>> support the serial console on the MTP.
>>>
>>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>>> Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
>>> ---
>>
>> Andy, is it possible to pull this one in for 4.18?
>> Sorry, I only realized we somehow missed this after looking at your pull request.
>>
>> This is the only patch that prevents linux-next from booting up my sdm845 MTP
>> to a minimal console shell.
> 
> It was in Andy's tree but then got dropped.  Unfortunately the clock
> bindings didn't land early enough so it's a bit difficult to land any
> device tree changes that use the clock bindings until the next kernel
> revision...

ah, okay, did not realize that. Thanks for clarifying.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
