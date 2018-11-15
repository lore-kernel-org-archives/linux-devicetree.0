From: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH 3/3] ARM: socfpga: dts: document "altr,stratix10-rst-mgr"
 binding
Date: Thu, 15 Nov 2018 08:34:41 -0600
Message-ID: <be901b34-1370-afec-89c6-d7938320bfc2@kernel.org>
References: <20181105200549.17159-1-dinguyen@kernel.org>
 <20181105200549.17159-3-dinguyen@kernel.org>
 <1542274379.4915.3.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542274379.4915.3.camel@pengutronix.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 11/15/18 3:32 AM, Philipp Zabel wrote:
> Hi Dinh,
> 
> On Mon, 2018-11-05 at 14:05 -0600, Dinh Nguyen wrote:
>> "altr,stratix10-rst-mgr" is used for the Stratix10 reset manager.
>>
>> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
>> ---
>>  Documentation/devicetree/bindings/reset/socfpga-reset.txt | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/reset/socfpga-reset.txt b/Documentation/devicetree/bindings/reset/socfpga-reset.txt
>> index 98c9f560e5c5..38fe34fd8b8a 100644
>> --- a/Documentation/devicetree/bindings/reset/socfpga-reset.txt
>> +++ b/Documentation/devicetree/bindings/reset/socfpga-reset.txt
>> @@ -1,7 +1,8 @@
>>  Altera SOCFPGA Reset Manager
>>  
>>  Required properties:
>> -- compatible : "altr,rst-mgr"
>> +- compatible : "altr,rst-mgr" for (Cyclone5/Arria5/Arria10)
>> +	       "altr,stratix10-rst-mgr","altr,rst-mgr" for Stratix10 ARM64 SoC
> 
> git grep '\(altr\|intel\),stratix10'
> 
> currently only shows "intel,stratix10-clkmgr". Should this be
> "intel,stratix10-rst-mgr"? I think keeping "altr," is fine for
> consistency, just wanted to point it out.
> 

Thanks for pointing it out. I think it's okay to keep it "altr".

Dinh
