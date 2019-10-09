From: Thara Gopinath <thara.gopinath@linaro.org>
Subject: Re: [PATCH 3/5] dt-bindings: thermal: Add generic power domain
 warming device binding
Date: Wed, 9 Oct 2019 08:18:14 -0400
Message-ID: <5D9DD006.8010809@linaro.org>
References: <1568135676-9328-1-git-send-email-thara.gopinath@linaro.org>
 <1568135676-9328-4-git-send-email-thara.gopinath@linaro.org>
 <20190930144205.GA11539@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190930144205.GA11539@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: edubezval@gmail.com, rui.zhang@intel.com, ulf.hansson@linaro.org, daniel.lezcano@linaro.org, bjorn.andersson@linaro.org, agross@kernel.org, amit.kucheria@verdurent.com, mark.rutland@arm.com, rjw@rjwysocki.net, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob,
Thanks for the review

On 09/30/2019 10:42 AM, Rob Herring wrote:
> On Tue, Sep 10, 2019 at 01:14:34PM -0400, Thara Gopinath wrote:
>> Add binding to define power domains as thermal warming
>> devices.
>>
>> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
>> ---
>>  .../bindings/thermal/pwr-domain-warming.txt        | 32 ++++++++++++++++++++++
>>  1 file changed, 32 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/thermal/pwr-domain-warming.txt
>>
>> diff --git a/Documentation/devicetree/bindings/thermal/pwr-domain-warming.txt b/Documentation/devicetree/bindings/thermal/pwr-domain-warming.txt
>> new file mode 100644
>> index 0000000..25fc568
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/thermal/pwr-domain-warming.txt
>> @@ -0,0 +1,32 @@
>> +* Generic power domain based thermal warming device.
>> +
>> +This binding describes the power domains that can be used as a
>> +thermal warming device.
> 
> This looks like just a gathering of properties and way to instantiate 
> some driver.
> 
> I think this all belongs in the power domain provider. Make it a cooling 
> device and you should know which domains are relevant based on the 
> compatible (though perhaps we could consider a list in DT). If you want 
> to instantiate a separate driver to handle this, then make the power 
> domain driver do that.

This sounds fine. A list in DT might be needed though. I have a separate
driver. I should be able to get the genpd provider driver call
into it. I had asked this to Ulf and he seemed to be fine with it as well


> 
> Rob
> 
>

-- 
Regards
Thara
