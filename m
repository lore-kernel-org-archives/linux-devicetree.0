From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH v2 1/8] doc: DT: vidc: binding document for Qualcomm video
 driver
Date: Mon, 26 Sep 2016 22:42:32 +0300
Message-ID: <b2a1db9d-02d6-56ee-1884-72ab1a4720f4@linaro.org>
References: <1473248229-5540-1-git-send-email-stanimir.varbanov@linaro.org>
 <1473248229-5540-2-git-send-email-stanimir.varbanov@linaro.org>
 <20160916141939.GA2320@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20160916141939.GA2320@rob-hp-laptop>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

Thanks for the review!

On 09/16/2016 05:19 PM, Rob Herring wrote:
> On Wed, Sep 07, 2016 at 02:37:02PM +0300, Stanimir Varbanov wrote:
>> Adds binding document for vidc video encoder/decoder driver
>>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> ---
>>  .../devicetree/bindings/media/qcom,vidc.txt        | 61 ++++++++++++++++++++++
>>  1 file changed, 61 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/media/qcom,vidc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,vidc.txt b/Documentation/devicetree/bindings/media/qcom,vidc.txt
>> new file mode 100644
>> index 000000000000..0d50a7b2e3ed
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/qcom,vidc.txt
>> @@ -0,0 +1,61 @@
>> +* Qualcomm video encoder/decoder accelerator
>> +
>> +- compatible:
>> +	Usage: required
>> +	Value type: <stringlist>
>> +	Definition: Value should contain
> 
> ... one of:
> 
>> +			- "qcom,vidc-msm8916"
>> +			- "qcom,vidc-msm8996"
>> +- reg:
>> +	Usage: required
>> +	Value type: <prop-encoded-array>
>> +	Definition: Register ranges as listed in the reg-names property
>> +
>> +- interrupts:
>> +	Usage: required
>> +	Value type: <prop-encoded-array>
>> +	Definition:
> 
> How many interrupts?

It is one, thanks for the catch.

> 
>> +
>> +- power-domains:
>> +	Usage: required
>> +	Value type: <prop-encoded-array>
>> +	Definition: A phandle and power domain specifier pairs to the
>> +		    power domain which is responsible for collapsing
>> +		    and restoring power to the peripheral
> 
> How many power domains?

Good question, for vidc-msm8916 it is one power-domain, for vidc-msm8996
the power domains should be 3. Here the problem is that the genpd
doesn't permit more than one power-domain per device.

> 
>> +
>> +- clocks:
>> +	Usage: required
>> +	Value type: <prop-encoded-array>
>> +	Definition: List of phandle and clock specifier pairs as listed
>> +		    in clock-names property
>> +- clock-names:
>> +	Usage: required
>> +	Value type: <stringlist>
>> +	Definition: Should contain the following entries
>> +			- "core"  Core video accelerator clock
>> +			- "iface" Video accelerator AHB clock
>> +			- "bus"	  Video accelerator AXI clock
>> +- rproc:
>> +	Usage: required
>> +	Value type: <prop-encoded-array>
>> +	Definition: A phandle to remote processor responsible for
>> +		    firmware loading
>> +
>> +- iommus:
>> +	Usage: required
>> +	Value type: <prop-encoded-array>
>> +	Definition: A list of phandle and IOMMU specifier pairs
>> +
>> +* An Example
>> +	qcom,vidc@1d00000 {
> 
> node names should be generic: video-codec@

correct, will update it in next version.

-- 
regards,
Stan
