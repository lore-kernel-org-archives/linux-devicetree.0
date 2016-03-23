From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: Re: [PATCH v2 05/11] dt-bindings: Add bindings for phy-da8xx-usb
Date: Wed, 23 Mar 2016 12:56:39 -0500
Message-ID: <56F2D8D7.5070206@lechnology.com>
References: <1458181615-27782-1-git-send-email-david@lechnology.com>
 <1458181615-27782-6-git-send-email-david@lechnology.com>
 <56F2CD16.9060106@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56F2CD16.9060106-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Bin Liu <b-liu-l0cyMroinI0@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03/23/2016 12:06 PM, Sekhar Nori wrote:
> On Thursday 17 March 2016 07:56 AM, David Lechner wrote:
>> Device tree binding for new phy-da8xx-usb driver.
>>
>> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
>> ---
>>
>> v2 changes: This is new patch in v2.
>>
>>
>>   .../devicetree/bindings/phy/phy-da8xx-usb.txt      | 34 ++++++++++++++++++++++
>>   1 file changed, 34 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/phy/phy-da8xx-usb.txt
>>
>> diff --git a/Documentation/devicetree/bindings/phy/phy-da8xx-usb.txt b/Documentation/devicetree/bindings/phy/phy-da8xx-usb.txt
>> new file mode 100644
>> index 0000000..ed6b710
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/phy-da8xx-usb.txt
>> @@ -0,0 +1,34 @@
>> +TI DaVinci DA8XX USB PHY
>> +
>> +Required properties:
>> + - compatible: must be "ti,da830-usbphy".
>> + - #phy-cells: must be 1.
>> + - reg : Address and length of the CFGCHIP2 register.
>
> I am not sure passing CFGCHIP2 register as reg property to the phy is
> future proof. At some point, we do want to move to common clock
> framework and at that point USB clocks controlled by CFGCHIP2 will be a
> separate driver needing access to the same register.
>
> So I think the CFGCHIP2 access in USB phy driver should happen through a
> syscon phandle. This needs to happen now, not later since we cannot
> break DT backward-compatibility.
>

I think using "syscon" for the CFGCHIP registers makes sense (based on 
my minimal experience). Would we want one "syscon" device node that 
includes all of the CFGCHIP registers or one each?

Something like this?

cfgchip@1417C {
	compatible = "ti,da830-cfgchip", "syscon";
	reg = <1417C 20>;
}

or this?

cfgchip0@1417C {
	compatible = "ti,da830-cfgchip0", "syscon";
	reg = <1417C 4>;
}

cfgchip1@14180 {
	compatible = "ti,da830-cfgchip1", "syscon";
	reg = <14180 4>;
}

etc.



-or-

Would it be OK if the PHY driver registered clocks? I'm guessing this 
falls into the category of "not such a good idea".
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
