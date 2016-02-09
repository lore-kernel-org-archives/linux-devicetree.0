From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v2 3/4] iio: ad5755: added full support for devicetree
Date: Tue, 9 Feb 2016 21:30:44 +0100
Message-ID: <56BA4C74.9030503@metafoo.de>
References: <1454509864-32285-1-git-send-email-sean.nyekjaer@prevas.dk>
 <1454509864-32285-2-git-send-email-sean.nyekjaer@prevas.dk>
 <1454509864-32285-3-git-send-email-sean.nyekjaer@prevas.dk>
 <56B9A1B2.6030007@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56B9A1B2.6030007-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Sean_Nyekj=c3=a6r?= <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/09/2016 09:22 AM, Sean Nyekj=E6r wrote:
>=20
> On 2016-02-03 15:31, Sean Nyekjaer wrote:
>> Devicetree can provide platform data
>>
>> Signed-off-by: Sean Nyekjaer <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
> Lars do you have time to look at this before i'm fixing the comments =
from
> Jonathan and Rob :-)

The obvious thing is to use '-' instead of '_' since that is the DT con=
vention.

Other than that this non-trivial. This is the first binding for such a
device and it is always hard to come up with a good ABI without knowing=
 what
other similar devices might need to be supported by the same bindings. =
And
it is also not always clear what is hardware description and what is dr=
iver
policy.

The external resistor configuration should be clear, that's a descripti=
on of
the hardware whether the resistor exists or not.

=46or the others it's not so clear. E.g. the DC-to-DC converter configu=
ration,
this is most certainly not a description of the hardware. But we could =
get
away with it by saying this is a system level design decision and is ma=
de by
the system designer based on the operating parameters of the hardware a=
nd
hence is policy that belongs in the DT. It might make sense to follow w=
hat
the regulator bindings do here, even though the regulator is not expose=
d
externally.

The configuration of the output pin (voltage level, current level, etc)=
 is
certainly influenced by the restrictions of the hardware itself. You do=
n't
want to allow a configuration that can damage the hardware. But on the =
other
hand it is still a valid usecase for some applications to switch betwee=
n two
setups at runtime, which is something you said you need to be able to d=
o.
Here we might want to use something similar to pinctrl where the device=
tree
can offer a selection of valid configurations and the driver can switch
between those configurations.

- Lars

[...]
>> +static struct ad5755_platform_data *ad5755_parse_dt(struct device *=
dev)
>> +{
>> +    struct device_node *np =3D dev->of_node;
>> +    struct device_node *pp;
>> +    struct ad5755_platform_data *pdata;
>> +    unsigned int tmp;
>> +    unsigned int tmparray[3];
>> +    int devnr;
>> +
>> +    pdata =3D devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
>> +    if (!pdata)
>> +        return NULL;
>> +
>> +    pdata->ext_dc_dc_compenstation_resistor =3D
>> +           of_property_read_bool(np,
>> "adi,ext_dc_dc_compenstation_resistor");
>> +
>> +    if (!of_property_read_u32(np, "adi,dc_dc_phase", &tmp))
>> +        pdata->dc_dc_phase =3D tmp;
>> +    else
>> +        pdata->dc_dc_phase =3D AD5755_DC_DC_PHASE_ALL_SAME_EDGE;
>> +
>> +    if (!of_property_read_u32(np, "adi,dc_dc_freq", &tmp))
>> +        pdata->dc_dc_freq =3D tmp;
>> +    else
>> +        pdata->dc_dc_freq =3D AD5755_DC_DC_FREQ_410kHZ;
>> +
>> +    if (!of_property_read_u32(np, "adi,dc_dc_maxv", &tmp))
>> +        pdata->dc_dc_maxv =3D tmp;
>> +    else
>> +        pdata->dc_dc_maxv =3D AD5755_DC_DC_MAXV_23V;
>> +
>> +    devnr =3D 0;
>> +    for_each_child_of_node(np, pp) {
>> +        if (devnr > AD5755_NUM_CHANNELS) {
>> +            dev_err(dev, "There is to many channels defined in DT\n=
");
>> +            goto error_out;
>> +        }
>> +
>> +        if (!of_property_read_u32(pp, "adi,mode", &tmp))
>> +            pdata->dac[devnr].mode =3D tmp;
>> +        else
>> +            pdata->dac[devnr].mode =3D AD5755_MODE_CURRENT_4mA_20mA=
;
>> +
>> +        pdata->dac[devnr].ext_current_sense_resistor =3D
>> +               of_property_read_bool(pp, "adi,ext_current_sense_res=
istor");
>> +
>> +        pdata->dac[devnr].enable_voltage_overrange =3D
>> +            of_property_read_bool(pp, "adi,enable_voltage_overrange=
");
>> +        if (!of_property_read_u32_array(pp, "adi,slew", tmparray, 3=
)) {
>> +            pdata->dac[devnr].slew.enable =3D tmparray[0];
>> +            pdata->dac[devnr].slew.rate =3D tmparray[1];
>> +            pdata->dac[devnr].slew.step_size =3D tmparray[2];
>> +        } else {
>> +            pdata->dac[devnr].slew.enable =3D false;
>> +            pdata->dac[devnr].slew.rate =3D AD5755_SLEW_RATE_64k;
>> +            pdata->dac[devnr].slew.step_size =3D AD5755_SLEW_STEP_S=
IZE_1;
>> +        }
>> +
>> +        devnr++;
>> +    }
>> +
>> +    return pdata;

[...]
