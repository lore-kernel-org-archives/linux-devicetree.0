Return-Path: <SRS0=HRK2=J3=zonque.org=daniel@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: add devicetree bindings for
 pxa300-gcu
References: <20180704193502.3805-1-daniel@zonque.org>
 <20180711155234.GA14605@rob-hp-laptop>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <c99b892e-febd-d8ba-752f-1b811ca5fb4a@zonque.org>
Date: Wed, 11 Jul 2018 19:29:06 +0200
MIME-Version: 1.0
In-Reply-To: <20180711155234.GA14605@rob-hp-laptop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh@kernel.org>
Cc: airlied@linux.ie, mark.rutland@arm.com, b.zolnierkie@samsung.com, linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org, robert.jarzmik@free.fr
List-ID: <devicetree@vger.kernel.org>

Hi Bartlomiej,

On Wednesday, July 11, 2018 05:52 PM, Rob Herring wrote:
> On Wed, Jul 04, 2018 at 09:35:01PM +0200, Daniel Mack wrote:
>> This patch adds the binding documentation for the pxa300 gcu.
>>
>> Signed-off-by: Daniel Mack <daniel@zonque.org>
>> ---
>>   .../bindings/display/marvell,pxa300-gcu.txt     | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/display/marvell,pxa300-gcu.txt
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Can we take this through the pxa tree or do you want to merge it?


Thanks,
Daniel
