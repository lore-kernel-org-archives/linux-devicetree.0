From: Jean-Michel Hautbois <jean-michel.hautbois-JiVWUdsMzBtWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v6] media: spi: Add support for LMH0395
Date: Wed, 10 Feb 2016 09:24:08 +0100
Message-ID: <CAH-u=80EnZvOTUGOW+czW39o_fJG3=Lk7EH1hRegXgiGz74mcA@mail.gmail.com>
References: <1454930424-6030-1-git-send-email-jean-michel.hautbois@veo-labs.com>
 <20160209001540.GA23750@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160209001540.GA23750@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jean-Michel Hautbois <jhautbois-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux Media Mailing List <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, jslaby-IBi9RG/b67k@public.gmane.org, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Thanks a lot for your review !

2016-02-09 1:15 GMT+01:00 Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>:
> On Mon, Feb 08, 2016 at 12:20:24PM +0100, Jean-Michel Hautbois wrote:
>> This device is a SPI based device from TI.
>> It is a 3 Gbps HD/SD SDI Dual Output Low Power
>> Extended Reach Adaptive Cable Equalizer.
>>
>> LMH0395 enables the use of up to two outputs.
>> These can be configured using DT.
>> The name gives the spi bus, and the CS associated.
>> Example : lmh0395-1@spi2
>> LMH0395 is on bus SPI2 with CS number 1.
>>
>> Controls should be accessible from userspace too.
>> This will have to be done later.
>
> Your line wrap should be ~72 columns.

You mean my current line wrap is too short ?

>> Signed-off-by: Jean-Michel Hautbois <jean-michel.hautbois-JiVWUdsMzBtWk0Htik3J/w@public.gmane.org>
>> ---
>> v2: Add DT support
>> v3: Change the bit set/clear in output_type as disabled means 'set the bit'
>> v4: Clearer description of endpoints usage in Doc, and some init changes.
>>     Add a dependency on OF and don't test CONFIG_OF anymore.
>> v5: Change port description in Documentation
>>     Multiple ports : required #address-cells and #size-cells
>>     Alphabetical order for include files
>>     Simplify register set/clear
>>     Check device ID
>>     Implement log_status handler
>> v6: Take Laurent Pinchart remarks into account
>>     Correct register settings
>>     Use next generation MC
>>
>>  .../devicetree/bindings/media/spi/lmh0395.txt      |  51 +++
>>  MAINTAINERS                                        |   6 +
>>  drivers/media/Kconfig                              |   1 +
>>  drivers/media/Makefile                             |   2 +-
>>  drivers/media/spi/Kconfig                          |  15 +
>>  drivers/media/spi/Makefile                         |   1 +
>>  drivers/media/spi/lmh0395.c                        | 477 +++++++++++++++++++++
>>  drivers/media/spi/lmh039x.h                        |  55 +++
>>  8 files changed, 607 insertions(+), 1 deletion(-)
>>  create mode 100644 Documentation/devicetree/bindings/media/spi/lmh0395.txt
>>  create mode 100644 drivers/media/spi/Kconfig
>>  create mode 100644 drivers/media/spi/Makefile
>>  create mode 100644 drivers/media/spi/lmh0395.c
>>  create mode 100644 drivers/media/spi/lmh039x.h
>>
>> diff --git a/Documentation/devicetree/bindings/media/spi/lmh0395.txt b/Documentation/devicetree/bindings/media/spi/lmh0395.txt
>> new file mode 100644
>> index 0000000..5c6ab4a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/spi/lmh0395.txt
>> @@ -0,0 +1,51 @@
>> +* Texas Instruments lmh0395 3G HD/SD SDI equalizer
>> +
>> +"The LMH0395 is an SDI equalizer designed to extend the reach of SDI signals
>> +transmitted over cable by equalizing the input signal and generating clean
>> +outputs. It has one differential input and two differential output that can be
>> +independently controlled."
>> +
>> +Required Properties :
>> +- compatible: Must be "ti,lmh0395"
>
> You don't state this is a SPI device and uses standard SPI device
> properties.

Right, will add a word about this.

>> +
>> +The device node must contain one 'port' child node per device input and output
>> +port, in accordance with the video interface bindings defined in
>> +Documentation/devicetree/bindings/media/video-interfaces.txt.
>> +
>> +The LMH0395 has three ports numbered as follows.
>> +
>> +  Port                       LMH0395
>> +------------------------------------------------------------
>> +  SDI (SDI input)    0
>> +  SDO0 (SDI output 0)        1
>> +  SDO1 (SDI output 1)        2
>> +
>> +Example:
>> +
>> +ecspi@02010000 {
>
> s/ecspi/spi/ and drop the leading 0.
>
> Presumbly the dts you based this on was wrong.

I am using a i.MX6 platform, so yes, I based it on i.MX6 DTS files,
and it stated ecspi.
I will change it to make it more generic.

>> +     ...
>> +     ...
>> +
>> +     lmh0395@1 {
>> +             compatible = "ti,lmh0395";
>> +             reg = <1>;
>> +             spi-max-frequency = <20000000>;
>> +             ports {
>> +                     port@0 {
>> +                             #address-cells = <1>;
>> +                             #size-cells = <0>;
>
> These belong up one level in ports.

Yes, of course !

>> +                             reg = <0>;
>> +                             sdi0_in: endpoint {};
>> +                     };
>> +                     port@1 {
>> +                             reg = <1>;
>> +                             sdi0_out0: endpoint {};
>> +                     };
>> +                     port@2 {
>> +                             reg = <2>;
>> +                             /* endpoint not specified, disable output */
>> +                     };
>> +             };
>> +     };
>> +     ...
>> +};

Thanks,
JM
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
