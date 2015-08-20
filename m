From: Dinh Nguyen <dinguyen-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>
Subject: Re: [PATCHv2] arm64: dts: Add base stratix 10 dtsi
Date: Thu, 20 Aug 2015 13:37:48 -0500
Message-ID: <55D61E7C.40609@opensource.altera.com>
References: <1439308127-7412-1-git-send-email-dinguyen@opensource.altera.com> <20150820172308.GA2711@svinekod>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150820172308.GA2711@svinekod>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <dinh.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org" <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/20/2015 12:23 PM, Mark Rutland wrote:
> Hi,
> 
>> +/ {
>> +	compatible = "altr,socfpga-stratix10";
>> +	#address-cells = <1>;
>> +	#size-cells = <1>;
> 
> I would recommend that you make your root #address-cells and #size-cells equal
> to 2, as that will simplify matters later if/when you need to add anything
> beyond the first 4GB for some particular board.
> 
> If everything in the SoC falls within the first 4GB you can have a ranges
> property on your /soc node and have only one cell below that.
> 

Ok, will update.

> [...]
> 
>> +	intc: intc@ffff8000 {
> 
> The unit-address doesn't match the first address in the reg entry.
> 

Right, according to the GIC-400 r0p1 TRM, section 3.2 register map,
shows that

0x0000 - 0x0fff		Reserved
0x1000 - 0x1fff		Distibutor
...

So even though the GIC address starts at 0xffff8000, the first usable
register is at 0xffff9000. I'll have to ask the hw folks if the
0xffff8000 represents the distributor or the reserved block.

>> +		compatible = "arm,gic-400", "arm,cortex-a15-gic";
>> +		#interrupt-cells = <3>;
>> +		interrupt-controller;
>> +		reg = <0x0 0xffff9000 0x1000>,
>> +		      <0x0 0xffffa000 0x2000>,
>> +		      <0x0 0xffffc000 0x1000>,
>> +		      <0x0 0xffffd000 0x1000>;
>> +	};
> 
> Shouldn't the virtual CPU interface also be 0x2000 long?
> 

Yes, it is. Will update

Thanks for reviewing.

Dinh

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
