From: Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 3/6] DT: PCI: qcom: Document PCIe devicetree bindings
Date: Tue, 24 Nov 2015 11:22:18 +0200
Message-ID: <56542C4A.2070802@linaro.org>
References: <cover.1448270813.git.stanimir.varbanov@linaro.org>
 <8fd3e7d1662f37abe549127d179c315dff3210d8.1448270813.git.stanimir.varbanov@linaro.org>
 <20151123231744.GA14078@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151123231744.GA14078@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pratyush Anand <pratyush.anand-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Thanks for the comments!

On 11/24/2015 01:17 AM, Rob Herring wrote:
> On Mon, Nov 23, 2015 at 11:29:00AM +0200, Stanimir Varbanov wrote:
>> From: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
>>
>> Document Qualcomm PCIe driver devicetree bindings.
>>
>> Signed-off-by: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>  .../devicetree/bindings/pci/qcom,pcie.txt          |  231 ++++++++++++++++++++
>>  1 file changed, 231 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/pci/qcom,pcie.txt
>>
>> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.txt b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
>> new file mode 100644
>> index 000000000000..d7640d45fa31
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
>> @@ -0,0 +1,231 @@
>> +* Qualcomm PCI express root complex
>> +
>> +- compatible:
>> +	Usage: required
>> +	Value type: <stringlist>
>> +	Definition: Value shall include
>> +		    - "qcom,pcie-v0" for apq/ipq8064
>> +		    - "qcom,pcie-v1" for apq8084
> 
> Use chip part numbers, not versions.

Sure.

> 
> Also, shouldn't you have the Designware compatible in addition.
> 
> [...]
> 
>> +
>> +- <name>-gpio:
> 
> Use -gpios

Ok I will.

-- 
regards,
Stan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
