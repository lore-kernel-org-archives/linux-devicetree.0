From: Varka Bhadram <varkabhadram-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 05/12] phy: add the Berlin USB PHY driver
Date: Wed, 16 Jul 2014 15:03:14 +0530
Message-ID: <53C646DA.3020002@gmail.com>
References: <1405499166-6726-1-git-send-email-antoine.tenart@free-electrons.com> <1405499166-6726-6-git-send-email-antoine.tenart@free-electrons.com> <53C64389.3050705@gmail.com> <20140716092541.GC28151@kwain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140716092541.GC28151@kwain>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Antoine_T=E9nart?= <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/16/2014 02:55 PM, Antoine T=E9nart wrote:
> Hi Varka,
>
> On Wed, Jul 16, 2014 at 02:49:05PM +0530, Varka Bhadram wrote:
>> On 07/16/2014 01:55 PM, Antoine T=E9nart wrote:
>>> +static const struct of_device_id phy_berlin_sata_of_match[] =3D {
>>> +	{
>>> +		.compatible =3D "marvell,berlin2-usb-phy",
>>> +		.data =3D &phy_berlin_pll_dividers[0],
>>> +	},
>>> +	{
>>> +		.compatible =3D "marvell,berlin2cd-usb-phy",
>>> +		.data =3D &phy_berlin_pll_dividers[1],
>>> +	},
>>> +	{ },
>>> +};
>>> +MODULE_DEVICE_TABLE(of, phy_berlin_sata_of_match);
>>> +
>> It looks good if we move this after probe().. So that we can see of_=
match_table directly...
> We use the of match table in the probe, when calling of_match_device(=
).
>
>>> +static int phy_berlin_usb_probe(struct platform_device *pdev)
>>> +{
>>> +	const struct of_device_id *match =3D
>>> +		of_match_device(phy_berlin_sata_of_match, &pdev->dev);

We are updating of_match_table in platform_driver struct.

Every driver follows the concept of giving the of_device_ids
above the platform_driver declaration...

> Here.
>
> Antoine
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
