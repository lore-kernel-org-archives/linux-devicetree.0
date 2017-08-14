From: matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Subject: Re: [PATCH 1/2] dt-bindings: mtd: Altera ASMI Parallel II IP Core
Date: Mon, 14 Aug 2017 09:38:30 -0700 (PDT)
Message-ID: <alpine.DEB.2.20.1708140931290.11426@mgerlach-VirtualBox>
References: <1502043844-3626-1-git-send-email-matthew.gerlach@linux.intel.com> <1502043844-3626-2-git-send-email-matthew.gerlach@linux.intel.com> <20170810203502.5s2evtamkbolluae@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170810203502.5s2evtamkbolluae@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: vndao-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


Hi Rob,

Thanks for the feedback.  Please see my comments in line.

Matthew Gerlach

On Thu, 10 Aug 2017, Rob Herring wrote:

> On Sun, Aug 06, 2017 at 11:24:02AM -0700, matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org wrote:
>> From: Matthew Gerlach <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>>
>> Device Tree bindinds for Altera ASMI Parallel II IP Core.
>
> s/bindinds/bindings/
>
>>
>> Signed-off-by: Matthew Gerlach <matthew.gerlach-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
>> ---
>>  .../devicetree/bindings/mtd/altera-asmip2.txt      | 22 ++++++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/mtd/altera-asmip2.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/altera-asmip2.txt b/Documentation/devicetree/bindings/mtd/altera-asmip2.txt
>> new file mode 100644
>> index 0000000..3380366
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/altera-asmip2.txt
>> @@ -0,0 +1,22 @@
>> +* Altera ASMI Parallel II IP Core
>> +
>> +Required properties:
>> +- compatible : Should be "altr,asmi_parallel2".
>
> s/_/-/
>
>> +- reg : A tuple consisting of a physical address and length.
>> +
>> +Optional subnodes:
>> +Subnodes of the Altera ASMI Paralllel II IP Core are spi slave nodes.
>
> But this is not a general purpose SPI controller?


The component is a general pupose SPI controller, but this driver
expects a spi-nor device to be connected to it.  As such I wonder if the
compatible string should be "altr,asmi-parallel2-spi-nor".


>
>> +- reg : chip select value
>> +- label : optional user friendly label
>> +
>> +Example:
>> +
>> +qspi: spi@a0001000 {
>> +	compatible = "altr,asmi_parallel2";
>> +	reg = <0xa0001000 0x10>;
>> +
>> +	flash@0 {
>
> This should have a compatible.
>
>> +		reg = <0>;
>> +		label = "FPGA Image";
>> +	};

Since I have no way to test multiple flash chips, it might
be simpler to not specify any subnodes.

>> +};
>> --
>> 2.7.4
>>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
