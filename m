From: Varka Bhadram <varkabhadram@gmail.com>
Subject: Re: [PATCH v3 05/12] phy: add the Berlin USB PHY driver
Date: Wed, 16 Jul 2014 15:20:00 +0530
Message-ID: <53C64AC8.3000709@gmail.com>
References: <1405499166-6726-1-git-send-email-antoine.tenart@free-electrons.com> <1405499166-6726-6-git-send-email-antoine.tenart@free-electrons.com> <53C64389.3050705@gmail.com> <20140716092541.GC28151@kwain> <53C646DA.3020002@gmail.com> <20140716094747.GD28151@kwain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140716094747.GD28151@kwain>
Sender: linux-kernel-owner@vger.kernel.org
To: =?ISO-8859-1?Q?Antoine_T=E9nart?= <antoine.tenart@free-electrons.com>
Cc: sebastian.hesselbarth@gmail.com, Peter.Chen@freescale.com, balbi@ti.com, p.zabel@pengutronix.de, alexandre.belloni@free-electrons.com, thomas.petazzoni@free-electrons.com, zmxu@marvell.com, jszhang@marvell.com, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 07/16/2014 03:17 PM, Antoine T=E9nart wrote:
> On Wed, Jul 16, 2014 at 03:03:14PM +0530, Varka Bhadram wrote:
>> On 07/16/2014 02:55 PM, Antoine T=E9nart wrote:
>>> Hi Varka,
>>>
>>> On Wed, Jul 16, 2014 at 02:49:05PM +0530, Varka Bhadram wrote:
>>>> On 07/16/2014 01:55 PM, Antoine T=E9nart wrote:
>>>>> +static const struct of_device_id phy_berlin_sata_of_match[] =3D =
{
>>>>> +	{
>>>>> +		.compatible =3D "marvell,berlin2-usb-phy",
>>>>> +		.data =3D &phy_berlin_pll_dividers[0],
>>>>> +	},
>>>>> +	{
>>>>> +		.compatible =3D "marvell,berlin2cd-usb-phy",
>>>>> +		.data =3D &phy_berlin_pll_dividers[1],
>>>>> +	},
>>>>> +	{ },
>>>>> +};
>>>>> +MODULE_DEVICE_TABLE(of, phy_berlin_sata_of_match);
>>>>> +
>>>> It looks good if we move this after probe().. So that we can see o=
f_match_table directly...
>>> We use the of match table in the probe, when calling of_match_devic=
e().
>>>
>>>>> +static int phy_berlin_usb_probe(struct platform_device *pdev)
>>>>> +{
>>>>> +	const struct of_device_id *match =3D
>>>>> +		of_match_device(phy_berlin_sata_of_match, &pdev->dev);
>> We are updating of_match_table in platform_driver struct.
> Yes. This is not the same thing. of_match_device() allows to get a
> pointer to the of_device_id that matched, to retrieve its data.
>
>> Every driver follows the concept of giving the of_device_ids
>> above the platform_driver declaration...
> Lots of drivers using of_match_device() declare their of_device_id
> structure before the probe.
>
Yes . I also checked that. Thanks  :-)

--=20
Regards,
Varka Bhadram.
