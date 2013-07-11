From: Prabhakar Lad <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v2 2/2] media: i2c: tvp7002: add OF support
Date: Thu, 11 Jul 2013 22:39:10 +0530
Message-ID: <CA+V-a8sW+D8trces5AXu__Lw9F7TO6fCcQW+LGZKRhA41uOEfw@mail.gmail.com>
References: <1371923055-29623-1-git-send-email-prabhakar.csengg@gmail.com>
 <1371923055-29623-3-git-send-email-prabhakar.csengg@gmail.com> <51D05568.3090009@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <51D05568.3090009@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@redhat.com>, LMML <linux-media@vger.kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, DLOS <davinci-linux-open-source@linux.davincidsp.com>, LKML <linux-kernel@vger.kernel.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Sakari Ailus <sakari.ailus@iki.fi>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Rob Landley <rob@landley.net>, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Sylwester,

Thanks for the review.

On Sun, Jun 30, 2013 at 9:27 PM, Sylwester Nawrocki
<sylvester.nawrocki@gmail.com> wrote:
> Hi,
>
>
> On 06/22/2013 07:44 PM, Prabhakar Lad wrote:
>>
>> From: "Lad, Prabhakar"<prabhakar.csengg@gmail.com>
>>
>> add OF support for the tvp7002 driver.
>>
>> Signed-off-by: Lad, Prabhakar<prabhakar.csengg@gmail.com>
>> Cc: Hans Verkuil<hans.verkuil@cisco.com>
>> Cc: Laurent Pinchart<laurent.pinchart@ideasonboard.com>
>> Cc: Mauro Carvalho Chehab<mchehab@redhat.com>
>> Cc: Guennadi Liakhovetski<g.liakhovetski@gmx.de>
>> Cc: Sylwester Nawrocki<s.nawrocki@samsung.com>
>> Cc: Sakari Ailus<sakari.ailus@iki.fi>
>> Cc: Grant Likely<grant.likely@secretlab.ca>
>> Cc: Rob Herring<rob.herring@calxeda.com>
>> Cc: Rob Landley<rob@landley.net>
>> Cc: devicetree-discuss@lists.ozlabs.org
>> Cc: linux-doc@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: davinci-linux-open-source@linux.davincidsp.com

Will take care of this as mentioned in earlier patch.

>> ---
>>   Depends on patch https://patchwork.kernel.org/patch/2765851/
>>
>>   .../devicetree/bindings/media/i2c/tvp7002.txt      |   43 ++++++++=
+++++
>>   drivers/media/i2c/tvp7002.c                        |   67
>> ++++++++++++++++++--
>>   2 files changed, 103 insertions(+), 7 deletions(-)
>>   create mode 100644
>> Documentation/devicetree/bindings/media/i2c/tvp7002.txt
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/tvp7002.txt
>> b/Documentation/devicetree/bindings/media/i2c/tvp7002.txt
>> new file mode 100644
>> index 0000000..9daebe1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/i2c/tvp7002.txt
>> @@ -0,0 +1,43 @@
>> +* Texas Instruments TV7002 video decoder
>> +
>> +The TVP7002 device supports digitizing of video and graphics signal=
 in
>> RGB and
>> +YPbPr color space.
>> +
>> +Required Properties :
>> +- compatible : Must be "ti,tvp7002"
>> +
>> +- hsync-active: HSYNC Polarity configuration for endpoint.
>> +
>> +- vsync-active: VSYNC Polarity configuration for endpoint.
>> +
>> +- pclk-sample: Clock polarity of the endpoint.
>> +
>> +- video-sync: Video sync property of the endpoint.
>> +
>> +- ti,tvp7002-fid-polarity: Active-high Field ID polarity of the end=
point.
>
>
> I thought it was agreed 'field-even-active' would be used instead of
> this device specific property. Did you run into any issues with that =
?
>
>
Argh I some how missed it out, sorry this should be 'field-even-active'

>> +
>> +For further reading of port node refer
>> Documentation/devicetree/bindings/media/
>> +video-interfaces.txt.
>> +
>> +Example:
>> +
>> +       i2c0@1c22000 {
>> +               ...
>> +               ...
>> +               tvp7002@5c {
>> +                       compatible =3D "ti,tvp7002";
>> +                       reg =3D<0x5c>;
>> +
>> +                       port {
>> +                               tvp7002_1: endpoint {
>> +                                       hsync-active =3D<1>;
>> +                                       vsync-active =3D<1>;
>> +                                       pclk-sample =3D<0>;
>> +                                       video-sync
>> =3D<V4L2_MBUS_VIDEO_SYNC_ON_GREEN>;
>> +                                       ti,tvp7002-fid-polarity;
>> +                               };
>> +                       };
>> +               };
>> +               ...
>> +       };
>> diff --git a/drivers/media/i2c/tvp7002.c b/drivers/media/i2c/tvp7002=
=2Ec
>> index b577548..4896024 100644
>> --- a/drivers/media/i2c/tvp7002.c
>> +++ b/drivers/media/i2c/tvp7002.c
>> @@ -35,6 +35,8 @@
>>   #include<media/v4l2-device.h>
>>   #include<media/v4l2-common.h>
>>   #include<media/v4l2-ctrls.h>
>> +#include<media/v4l2-of.h>
>> +
>>   #include "tvp7002_reg.h"
>>
>>   MODULE_DESCRIPTION("TI TVP7002 Video and Graphics Digitizer driver=
");
>> @@ -943,6 +945,48 @@ static const struct v4l2_subdev_ops tvp7002_ops=
 =3D {
>>         .pad =3D&tvp7002_pad_ops,
>>   };
>>
>> +static struct tvp7002_config *
>> +tvp7002_get_pdata(struct i2c_client *client)
>
>
> nit: unnecessary line break
>

Ok

>> +{
>> +       struct v4l2_of_endpoint bus_cfg;
>> +       struct tvp7002_config *pdata;
>> +       struct device_node *endpoint;
>> +       unsigned int flags;
>> +
>> +       if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
>> +               return client->dev.platform_data;
>> +
>> +       endpoint =3D v4l2_of_get_next_endpoint(client->dev.of_node, =
NULL);
>> +       if (!endpoint)
>> +               return NULL;
>> +
>> +       pdata =3D devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KER=
NEL);
>> +       if (!pdata)
>> +               goto done;
>> +
>> +       v4l2_of_parse_endpoint(endpoint,&bus_cfg);
>> +       flags =3D bus_cfg.bus.parallel.flags;
>> +
>> +       if (flags&  V4L2_MBUS_HSYNC_ACTIVE_HIGH)
>>
>> +               pdata->hs_polarity =3D 1;
>> +
>> +       if (flags&  V4L2_MBUS_VSYNC_ACTIVE_HIGH)
>>
>> +               pdata->vs_polarity =3D 1;
>> +
>> +       if (flags&  V4L2_MBUS_PCLK_SAMPLE_RISING)
>>
>> +               pdata->clk_polarity =3D 1;
>> +
>> +       if (flags&  V4L2_MBUS_VIDEO_SYNC_ON_GREEN)
>>
>> +               pdata->sog_polarity =3D 1;
>
>
> This clearly shows that you're using this property for something diff=
erent
> you have defined it for. I asked previously if what you really needed=
 for
> this TVP7002 chip is a DT property indicating sync-on-green _polarity=
_ or
> the sync-on-green _usage_. And you clearly need the polarity informat=
ion.
>
> So I would just define a standard "sync-on-green-active" property and
> V4L2_MBUS_VIDEO_SOG_ACTIVE_{HIGH,LOW} flags. Presumably you don't nee=
d
> anything else, and the extra sync polarity flags would need eventuall=
y
> to be defined anyway, independently of any video sync selection prope=
rty,
> should something like this ever need to be specified by firmware.
>
>
OK

>> +       pdata->fid_polarity =3D of_property_read_bool(endpoint,
>> +
>> "ti,tvp7002-fid-polarity");
>
>
> This could be just:
>
>         if (flags & V4L2_MBUS_FIELD_EVEN_HIGH)
>                 pdata->fid_polarity =3D 1;
>
> if you used standard 'field-even-active' property.
>

Agreed.

> And this is what we find in the TVP7002 datasheet, in the section des=
cribing
> MISC Control 3 (18h) register's FID POL bit (pdata->fid_polarity is w=
ritten
> directly to FID POL):
>
> "FID POL: Active-high Field ID output polarity control. Under normal
> operation,  the field ID output is set to logic 1 for an odd field (f=
ield 1)
> and set to logic 0 for an even field (field 0).
> 0 =3D Normal operation (default)
> 1 =3D FID output polarity inverted
> NOTE: This control bit also affects the polarity of the data enable o=
utput
> when selected (see Test output control [2:0] at subaddress 17h)."
>
>
> And include/media/tvp70002.h:
>
>  * fid_polarity:
>  *                      0 -> the field ID output is set to logic 1 fo=
r an
> odd
>  *                           field (field 1) and set to logic 0 for a=
n even
>  *                           field (field 0).
>  *                      1 -> operation with polarity inverted.
>
>
> Do you know if the chip automatically selects video sync source
> (sync-on-green
> vs. VSYNC/HSYNC) and there is no need to configure this on the analog=
ue
> input
> side ? At least the driver seems to always select the default SOGIN_1=
 input
> (TVP7002_IN_MUX_SEL_1 register is set only at initialization time).
>
Yes the driver is selecting the default SOGIN_1 input.

> Or perhaps it just outputs on SOGOUT, VSOUT, HSOUT lines whatever is =
fed to
> its analogue inputs, and any further processing unit need to determin=
e what
> synchronization signal is present and should be used ?
>

Yes that correct, there is a register (Sync Detect Status) which
detects the sync for
you.

> I suspect that we don't need, e.g. another endpoint node to specify t=
he
> configuration of the TVP7002 analogue input interface, that would con=
tain
> a property like video-sync.
>
>
If I understand correctly you mean if there are two tvp7002 devices con=
nected
we don=92t need to specify video-sync property, but my question how do =
we
specify this property in common then ?

Regards,
--Prabhakar Lad
