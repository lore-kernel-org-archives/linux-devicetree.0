From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: dmaengine: dma-common: Change
 dma-channel-mask to uint32-array
Date: Thu, 19 Sep 2019 11:42:58 +0300
Message-ID: <a1e4bf6a-ad7d-aa72-82c0-5cbb5af5bd0d@ti.com>
References: <20190910114559.22810-1-peter.ujfalusi@ti.com>
 <20190910114559.22810-2-peter.ujfalusi@ti.com> <20190918132835.GA4527@bogus>
 <d76ffc38-8e68-656a-325b-37de9b01e015@ti.com>
 <CAL_JsqLJn4dmnjU=7kVgiosAU=o+fSJNH6578D92fGbdOR8Zfw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqLJn4dmnjU=7kVgiosAU=o+fSJNH6578D92fGbdOR8Zfw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Vinod <vkoul@kernel.org>, "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dan Williams <dan.j.williams@intel.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 18/09/2019 17.21, Rob Herring wrote:
>>>> +          - description: Mask of chnanels X-(X+31)
>>>
>>> Obviously, this was not validated with 'make dt_binding_check'.
>> make dt_bindings_check
>> make: *** No rule to make target 'dt_bindings_check'.  Stop.
> 
> Read Documentation/devicetree/writing-schema.md (or .rst in next).
> 
> Either your config doesn't have DTC enabled or you don't have
> dt-schema installed.

I have reinstalled dt-schema and added $HOME/.local/bin to PATH and now
'make dt_binding_check' is working and passing for dma-common.yaml.

For some reason it did not validate the new dma-domain.yaml from another
series, I guess it need to be added to some list?

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
