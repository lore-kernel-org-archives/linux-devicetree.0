From: Matthew McClintock <mmcclint@codeaurora.org>
Subject: Re: [PATCH 09/17] watchdog: qcom: add kpss-standalone to device tree binding
Date: Mon, 28 Mar 2016 12:02:47 -0500
Message-ID: <0F389D09-1165-4686-98DF-0265351A086A@codeaurora.org>
References: <1458770712-10880-1-git-send-email-mmcclint@codeaurora.org> <1458770712-10880-10-git-send-email-mmcclint@codeaurora.org> <20160325141521.GA12357@rob-hp-laptop>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20160325141521.GA12357@rob-hp-laptop>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: andy.gross@linaro.org, linux-arm-msm@vger.kernel.org, qca-upstream.external@qca.qualcomm.com, linux-watchdog@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mar 25, 2016, at 9:15 AM, Rob Herring <robh@kernel.org> wrote:
> 
> On Wed, Mar 23, 2016 at 05:05:04PM -0500, Matthew McClintock wrote:
>> Update the compatible string to add new device tree binding
>> 
>> CC: linux-watchdog@vger.kernel.org
>> Signed-off-by: Matthew McClintock <mmcclint@codeaurora.org>
>> ---
>> Documentation/devicetree/bindings/watchdog/qcom-wdt.txt | 1 +
>> 1 file changed, 1 insertion(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt b/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
>> index 60bb2f98..45b37cf 100644
>> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
>> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
>> @@ -6,6 +6,7 @@ Required properties :
>> 
>> 			"qcom,kpss-timer"
>> 			"qcom,scss-timer"
>> +			"qcom,kpss-standalone"
> 
> What SoC(s) is this in. Use SoC specific compatible strings please.

So ipq4019 wins the race because we are the first to try to enable watchdog for this block?

qcom,kpss-ipq4019 ?

-M