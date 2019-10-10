From: "Shenhar, Talel" <talel@amazon.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: soc: al-pos: Amazon's Annapurna Labs
 POS
Date: Thu, 10 Oct 2019 14:08:00 +0300
Message-ID: <5c3d9e1b-0549-0609-4b4a-5edc312a3873@amazon.com>
References: <1570452435-8505-1-git-send-email-talel@amazon.com>
 <1570452435-8505-2-git-send-email-talel@amazon.com>
 <20191009232927.GA23987@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191009232927.GA23987@bogus>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: maz@kernel.org, mark.rutland@arm.com, arnd@arndb.de, bp@alien8.de, mchehab@kernel.org, james.morse@arm.com, davem@davemloft.net, gregkh@linuxfoundation.org, paulmck@linux.ibm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, dwmw@amazon.co.uk, benh@kernel.crashing.org, hhhawa@amazon.com, ronenk@amazon.com, jonnyc@amazon.com, hanochu@amazon.com, amirkl@amazon.com, barakw@amazon.com
List-Id: devicetree@vger.kernel.org

Thanks for the review

On 10/10/2019 2:29 AM, Rob Herring wrote:
> On Mon, Oct 07, 2019 at 03:47:14PM +0300, Talel Shenhar wrote:
>> Document Amazon's Annapurna Labs POS SoC binding.
>>
>> Signed-off-by: Talel Shenhar <talel@amazon.com>
>> ---
>>   .../bindings/edac/amazon,al-pos-edac.yaml          | 40 ++++++++++++++++++++++
>>   1 file changed, 40 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/edac/amazon,al-pos-edac.yaml
> Please fix errors with 'make dt_binding_check' and resubmit.
>
> Error: Documentation/devicetree/bindings/edac/amazon,al-pos-edac.example.dts:21.28-29 syntax error
> FATAL ERROR: Unable to parse input tree
>
> Hint: You need an include.


Shall add to v6.

By the way, I was not able to see this error by running 'make 
dt_binding_check', but looking in to 'make dtbs_check' I was.
