From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [PATCH 07/10] [media] tvp5150: Add device tree binding document
Date: Mon, 4 Jan 2016 13:16:18 -0300
Message-ID: <568A9AD2.2010702@osg.samsung.com>
References: <1451910332-23385-1-git-send-email-javier@osg.samsung.com>
 <1451910332-23385-8-git-send-email-javier@osg.samsung.com>
 <20160104140748.GA10797@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160104140748.GA10797@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Enrico Butera <ebutera-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Enric Balletbo i Serra <eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Eduard Gavin <egavinc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Rob,

Thanks a lot for your feedback.

On 01/04/2016 11:07 AM, Rob Herring wrote:
> On Mon, Jan 04, 2016 at 09:25:29AM -0300, Javier Martinez Canillas wrote:
>> Add a Device Tree binding document for the TVP5150 video decoder.
>>
>> Signed-off-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
>> ---
>>
>>  .../devicetree/bindings/media/i2c/tvp5150.txt      | 35 ++++++++++++++++++++++
>>  1 file changed, 35 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/media/i2c/tvp5150.txt
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/tvp5150.txt b/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
>> new file mode 100644
>> index 000000000000..bf0b3f3128ce
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
>> @@ -0,0 +1,35 @@
>> +* Texas Instruments TVP5150 and TVP5151 video decoders
>> +
>> +The TVP5150 and TVP5151 are video decoders that convert baseband NTSC and PAL
>> +(and also SECAM in the TVP5151 case) video signals to either 8-bit 4:2:2 YUV
>> +with discrete syncs or 8-bit ITU-R BT.656 with embedded syncs output formats.
>> +
>> +Required Properties:
>> +- compatible: value must be "ti,tvp5150"
> 
> What about the 5151? The driver never needs to know if SECAM is 
> supported or not?
>

The device ID can be detected at runtime by reading the TVP5150_MSB_DEV_ID
and TVP5150_LSB_DEV_ID registers in both tvp5150 and tvp5151 (see patch #2
in this series). So I thought there was no need to have another compatible
string for "ti,tvp5151".
 
>> +- reg: I2C slave address
>> +
>> +Optional Properties:
>> +- powerdown-gpios: phandle for the GPIO connected to the PDN pin, if any.
>> +- reset-gpios: phandle for the GPIO connected to the RESETB pin, if any.
>> +
>> +The device node must contain one 'port' child node for its digital output
>> +video port, in accordance with the video interface bindings defined in
>> +Documentation/devicetree/bindings/media/video-interfaces.txt.
>> +
>> +Example:
>> +
>> +&i2c2 {
>> +	...
>> +	tvp5150@5c {
>> +			compatible = "ti,tvp5150";
> 
> Too much indentation here.
>

Right, I copied the example from a DTS that had another level of indentation
but it seems that I forgot to fix all lines, sorry about that. I will in v2.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
