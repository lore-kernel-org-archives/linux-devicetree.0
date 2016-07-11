From: Wan Zongshun <vw@iommu.org>
Subject: Re: [PATCH v2 06/10] soc: Add SoC specific driver support for nuc900
Date: Mon, 11 Jul 2016 17:07:01 +0800
Message-ID: <578361B5.7010803@iommu.org>
References: <1468135649-19980-1-git-send-email-vw@iommu.org>
 <1468135649-19980-7-git-send-email-vw@iommu.org> <4765191.NGpMC1JR46@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <4765191.NGpMC1JR46@wuerfel>
Sender: linux-clk-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, jason@lakedaemon.net, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, Thomas Gleixner <tglx@linutronix.de>, Wan Zongshun <mcuos.com@gmail.com>
List-Id: devicetree@vger.kernel.org



On 2016=E5=B9=B407=E6=9C=8811=E6=97=A5 16:03, Arnd Bergmann wrote:
> On Sunday, July 10, 2016 3:27:26 PM CEST Wan Zongshun wrote:
>> +       ret =3D of_property_read_string(np, "compatible", &soc_dev_a=
ttr->soc_id);
>> +       if (ret)
>>                return -EINVAL;
>> +
>> +       soc_dev_attr->machine =3D "NUC900EVB";
>> +       soc_dev_attr->family =3D "NUC900";
>> +       soc_dev =3D soc_device_register(soc_dev_attr);
>> +       if (IS_ERR(soc_dev)) {
>> +               kfree(soc_dev_attr);
>> +               return -ENODEV;
>> +       }
>> +
>> +       ret =3D regmap_read(syscon_regmap, GCR_CHIPID, &nuc900_chipi=
d);
>> +       if (ret)
>> +               return -ENODEV;
>> +
>> +       device_create_file(soc_device_to_device(soc_dev), &nuc900_ch=
ipid_attr);
>> +       device_create_file(soc_device_to_device(soc_dev), &nuc900_ve=
rsion_attr);
>> +
>> +       dev_info(&pdev->dev, "Nuvoton Chip ID: 0x%x, Version ID:0x%x=
\n",
>> +                nuc900_chipid & GCR_CHIPID_MASK,
>> +                (nuc900_chipid >> 24) & 0xff);
>
> I'm still a bit unsure about the set of attributes here.
>
> - The "soc_id" is read from the device tree from the field that conta=
ins
>    the board name, I think for consistency you should try to map the
>    GCR_CHIPID to the name of the SoC and assign that here

I will try to get chipid and map it to soc name like: =E2=80=9Cnuc970=E2=
=80=9D, "nuc910".

And I will set this soc name to soc_id, ok?

>
> - The "machine" is hardcoded to "NUC900EVB", which in turn looks like
>    a particular board but not the one you are running on. Maybe read
>    that from the DT instead?

Should I read nuc970-evb.dts's "model" or "compatible" properties?

>
> - The "revision" is not filled at all, I would suggest using somethin=
g
>    derived from the GCR_CHIPID register here
>
> - you have two nonstandard attributes "chipid" and "version", which
>    I'd hope to avoid -- the set of standard attributes is supposed to
>    give enough information about the machine, and platform independen=
t
>    user space will never read those.
>
> 	Arnd
>
>
