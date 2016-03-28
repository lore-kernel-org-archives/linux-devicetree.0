From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 09/17] watchdog: qcom: add kpss-standalone to device tree binding
Date: Mon, 28 Mar 2016 12:26:44 -0500
Message-ID: <CAL_JsqJYgHYOSOUAK+Fp6Y_bh=mpt7OdbzW50gUy6ikz5k-j-Q@mail.gmail.com>
References: <1458770712-10880-1-git-send-email-mmcclint@codeaurora.org>
 <1458770712-10880-10-git-send-email-mmcclint@codeaurora.org>
 <20160325141521.GA12357@rob-hp-laptop> <0F389D09-1165-4686-98DF-0265351A086A@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0F389D09-1165-4686-98DF-0265351A086A@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew McClintock <mmcclint@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, qca-upstream.external@qca.qualcomm.com, linux-watchdog@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 28, 2016 at 12:02 PM, Matthew McClintock
<mmcclint@codeaurora.org> wrote:
> On Mar 25, 2016, at 9:15 AM, Rob Herring <robh@kernel.org> wrote:
>>
>> On Wed, Mar 23, 2016 at 05:05:04PM -0500, Matthew McClintock wrote:
>>> Update the compatible string to add new device tree binding
>>>
>>> CC: linux-watchdog@vger.kernel.org
>>> Signed-off-by: Matthew McClintock <mmcclint@codeaurora.org>
>>> ---
>>> Documentation/devicetree/bindings/watchdog/qcom-wdt.txt | 1 +
>>> 1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt b/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
>>> index 60bb2f98..45b37cf 100644
>>> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
>>> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
>>> @@ -6,6 +6,7 @@ Required properties :
>>>
>>>                      "qcom,kpss-timer"
>>>                      "qcom,scss-timer"
>>> +                    "qcom,kpss-standalone"
>>
>> What SoC(s) is this in. Use SoC specific compatible strings please.
>
> So ipq4019 wins the race because we are the first to try to enable watchdog for this block?

Yep, that's how it is supposed to work. Newer chips claim
compatibility with older ones.

> qcom,kpss-ipq4019 ?

Yes, but generally <vendor>,<soc>-<block> is preferred order.

Rob
