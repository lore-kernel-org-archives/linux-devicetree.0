From: Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
Subject: Re: [PATCH 2/3] iio: potentiometer: mcp4531: Add device tree binding
 documentation
Date: Tue, 21 Jun 2016 09:49:20 +0200
Message-ID: <5768F180.4080601@heig-vd.ch>
References: <1466492137-32683-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1466492137-32683-3-git-send-email-florian.vaussard@heig-vd.ch>
 <f763a2ea-6a82-a8f6-4afb-d09dba240927@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f763a2ea-6a82-a8f6-4afb-d09dba240927-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Cc: Florian Vaussard <florian.vaussard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Slawomir Stepien <sst-IjDXvh/HVVUAvxtiuMwx3w@public.gmane.org>, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Cristina Moraru <cristina.moraru09-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

On 06/21/2016 09:38 AM, Peter Rosin wrote:
> On 2016-06-21 08:55, Florian Vaussard wrote:
>> Add the device tree documentation for all the supported parts. Apart the
>> compatible string and standard I2C binding, no other binding is currently
>> needed.
>>
>> Signed-off-by: Florian Vaussard <florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org>
>> ---
>>  .../bindings/iio/potentiometer/mcp4531.txt         | 84 ++++++++++++++++++++++
>>  1 file changed, 84 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/iio/potentiometer/mcp4531.txt
>>
>> diff --git a/Documentation/devicetree/bindings/iio/potentiometer/mcp4531.txt b/Documentation/devicetree/bindings/iio/potentiometer/mcp4531.txt
>> new file mode 100644
>> index 0000000..b052299
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/iio/potentiometer/mcp4531.txt
>> @@ -0,0 +1,84 @@
>> +* Microchip MCP453X/454X/455X/456X/463X/464X/465X/466X Digital Potentiometer
>> +  driver
>> +
>> +The node for this driver must be a child node of a I2C controller, hence
>> +all mandatory properties for your controller must be specified. See directory:
>> +
>> +        Documentation/devicetree/bindings/i2c
>> +
>> +for more details.
>> +
>> +Required properties:
>> +	- compatible:  	Must be one of the following, depending on the
>> +			model:
>> +			"microchip,mcp4531-502"
>> +			"microchip,mcp4531-103"
>> +			"microchip,mcp4531-503"
> 
> *snip*
> 
> I'm not directly opposed, but I have used the following and DT booting
> works like a charm here.
> 
> 		mcp4651-104@28 {
> 			compatible = "mcp4651-104";
> 			reg = <0x28>;
> 		};
> 

I was not aware that the i2c subsystem had a facility to match the compatible
string against i2c_device_id. Good to know.

> But, I suppose some DT documentation is not bad, and my understanding of
> the device instantiation process and the i2c/dt interactions are not
> complete, so my DT snippet might be an abomination? I'll leave the
> decision if this is needed to someone with more experience on how other
> drivers handle this.
> 

Your compatible string is missing the vendor ID (microchip). This is the only
objection that I can see to your proposition. Let's wait to hear from a DT
maintainer.

Thanks,
Florian
