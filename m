From: =?UTF-8?Q?Sean_Nyekj=c3=a6r?= <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
Subject: Re: [PATCH v2 3/4] iio: ad5755: added full support for devicetree
Date: Tue, 16 Feb 2016 14:46:14 +0100
Message-ID: <56C32826.7060507@prevas.dk>
References: <1454509864-32285-1-git-send-email-sean.nyekjaer@prevas.dk>
 <1454509864-32285-2-git-send-email-sean.nyekjaer@prevas.dk>
 <1454509864-32285-3-git-send-email-sean.nyekjaer@prevas.dk>
 <56B9A1B2.6030007@prevas.dk> <56BA4C74.9030503@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56BA4C74.9030503-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



On 2016-02-09 21:30, Lars-Peter Clausen wrote:
> On 02/09/2016 09:22 AM, Sean Nyekj=E6r wrote:
>> On 2016-02-03 15:31, Sean Nyekjaer wrote:
>>> Devicetree can provide platform data
>>>
>>> Signed-off-by: Sean Nyekjaer <sean.nyekjaer-rjjw5hvvQKZaa/9Udqfwiw@public.gmane.org>
>> Lars do you have time to look at this before i'm fixing the comments=
 from
>> Jonathan and Rob :-)
> The obvious thing is to use '-' instead of '_' since that is the DT c=
onvention.
I'm removing the defines in from the DT doc.
>
> Other than that this non-trivial. This is the first binding for such =
a
> device and it is always hard to come up with a good ABI without knowi=
ng what
> other similar devices might need to be supported by the same bindings=
=2E And
> it is also not always clear what is hardware description and what is =
driver
> policy.
I was hoping we could cooperate on enabling this feature. It's not the
majority of linux devices that are using board files any more.
>
> The external resistor configuration should be clear, that's a descrip=
tion of
> the hardware whether the resistor exists or not.
>
> For the others it's not so clear. E.g. the DC-to-DC converter configu=
ration,
> this is most certainly not a description of the hardware. But we coul=
d get
> away with it by saying this is a system level design decision and is =
made by
> the system designer based on the operating parameters of the hardware=
 and
> hence is policy that belongs in the DT. It might make sense to follow=
 what
> the regulator bindings do here, even though the regulator is not expo=
sed
> externally.
>
> The configuration of the output pin (voltage level, current level, et=
c) is
> certainly influenced by the restrictions of the hardware itself. You =
don't
> want to allow a configuration that can damage the hardware. But on th=
e other
> hand it is still a valid usecase for some applications to switch betw=
een two
> setups at runtime, which is something you said you need to be able to=
 do.
I can't why enabling configuration of the DAC from the DT is posing a=20
greater
risk of damaging hardware than the previous way of editing the board fi=
le.
> Here we might want to use something similar to pinctrl where the devi=
cetree
> can offer a selection of valid configurations and the driver can swit=
ch
> between those configurations.
>
> - Lars
>
> [...]
I'll submit an PATCH v3 where i have removed the defines from the DT do=
c=20
and introduce checks for the values passed from DT.

/Sean
>>> +static struct ad5755_platform_data *ad5755_parse_dt(struct device =
*dev)
>>> +{
>>> +    struct device_node *np =3D dev->of_node;
>>> +    struct device_node *pp;
>>> +    struct ad5755_platform_data *pdata;
>>> +    unsigned int tmp;
>>> +    unsigned int tmparray[3];
>>> +    int devnr;
>>> +
>>> +    pdata =3D devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
>>> +    if (!pdata)
>>> +        return NULL;
>>> +
>>> +    pdata->ext_dc_dc_compenstation_resistor =3D
>>> +           of_property_read_bool(np,
>>> "adi,ext_dc_dc_compenstation_resistor");
>>> +
>>> +    if (!of_property_read_u32(np, "adi,dc_dc_phase", &tmp))
>>> +        pdata->dc_dc_phase =3D tmp;
>>> +    else
>>> +        pdata->dc_dc_phase =3D AD5755_DC_DC_PHASE_ALL_SAME_EDGE;
>>> +
>>> +    if (!of_property_read_u32(np, "adi,dc_dc_freq", &tmp))
>>> +        pdata->dc_dc_freq =3D tmp;
>>> +    else
>>> +        pdata->dc_dc_freq =3D AD5755_DC_DC_FREQ_410kHZ;
>>> +
>>> +    if (!of_property_read_u32(np, "adi,dc_dc_maxv", &tmp))
>>> +        pdata->dc_dc_maxv =3D tmp;
>>> +    else
>>> +        pdata->dc_dc_maxv =3D AD5755_DC_DC_MAXV_23V;
>>> +
>>> +    devnr =3D 0;
>>> +    for_each_child_of_node(np, pp) {
>>> +        if (devnr > AD5755_NUM_CHANNELS) {
>>> +            dev_err(dev, "There is to many channels defined in DT\=
n");
>>> +            goto error_out;
>>> +        }
>>> +
>>> +        if (!of_property_read_u32(pp, "adi,mode", &tmp))
>>> +            pdata->dac[devnr].mode =3D tmp;
>>> +        else
>>> +            pdata->dac[devnr].mode =3D AD5755_MODE_CURRENT_4mA_20m=
A;
>>> +
>>> +        pdata->dac[devnr].ext_current_sense_resistor =3D
>>> +               of_property_read_bool(pp, "adi,ext_current_sense_re=
sistor");
>>> +
>>> +        pdata->dac[devnr].enable_voltage_overrange =3D
>>> +            of_property_read_bool(pp, "adi,enable_voltage_overrang=
e");
>>> +        if (!of_property_read_u32_array(pp, "adi,slew", tmparray, =
3)) {
>>> +            pdata->dac[devnr].slew.enable =3D tmparray[0];
>>> +            pdata->dac[devnr].slew.rate =3D tmparray[1];
>>> +            pdata->dac[devnr].slew.step_size =3D tmparray[2];
>>> +        } else {
>>> +            pdata->dac[devnr].slew.enable =3D false;
>>> +            pdata->dac[devnr].slew.rate =3D AD5755_SLEW_RATE_64k;
>>> +            pdata->dac[devnr].slew.step_size =3D AD5755_SLEW_STEP_=
SIZE_1;
>>> +        }
>>> +
>>> +        devnr++;
>>> +    }
>>> +
>>> +    return pdata;
> [...]
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
