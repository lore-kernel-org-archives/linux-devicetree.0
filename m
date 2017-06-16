From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/5] phy: bcm-ns-usb3: add MDIO driver using proper bus layer
Date: Fri, 16 Jun 2017 08:11:26 +0200
Message-ID: <CACna6rwgUpkO+dQjXT-zgxcFgUUQ-0wY7V6RTkWJGtpgOBFmkQ@mail.gmail.com>
References: <20170511132925.14564-1-zajec5@gmail.com> <20170511132925.14564-6-zajec5@gmail.com>
 <a5062fcb-a051-e0a9-9e19-954d4e611780@gmail.com> <50c92818-5f96-0b9a-b631-898cc09c7349@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50c92818-5f96-0b9a-b631-898cc09c7349-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yendapally Reddy Dhananjaya Reddy <yendapally.reddy-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 16 June 2017 at 08:04, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org> wrote:
> On Thursday 11 May 2017 09:59 PM, Florian Fainelli wrote:
>> On 05/11/2017 06:29 AM, Rafa=C5=82 Mi=C5=82ecki wrote:
>>> @@ -297,6 +371,28 @@ static struct platform_driver bcm_ns_usb3_driver =
=3D {
>>>              .of_match_table =3D bcm_ns_usb3_id_table,
>>>      },
>>>  };
>>> -module_platform_driver(bcm_ns_usb3_driver);
>>> +
>>> +static int __init bcm_ns_usb3_module_init(void)
>>> +{
>>> +    int err;
>>> +
>>> +    err =3D mdio_driver_register(&bcm_ns_usb3_mdio_driver);
>>> +    if (err)
>>> +            return err;
>>> +
>>> +    err =3D platform_driver_register(&bcm_ns_usb3_driver);
>>> +    if (err)
>>> +            mdio_driver_unregister(&bcm_ns_usb3_mdio_driver);
>>> +
>>> +    return err;
>>> +}
>>> +module_init(bcm_ns_usb3_module_init);
>>> +
>>> +static void __exit bcm_ns_usb3_module_exit(void)
>>> +{
>>> +    platform_driver_unregister(&bcm_ns_usb3_driver);
>>> +    mdio_driver_unregister(&bcm_ns_usb3_mdio_driver);
>>> +}
>>> +module_exit(bcm_ns_usb3_module_exit)
>>
>> Do we need to keep both platform device and mdio device registration
>> here? Do you have a depreciation time line for when we can entirely
>> switch to mdio device (assuming this is for backwards compatibility)?
>
> I too have the same question.

My plan is to:
1) Get this patch accepted
2) Switch DTS files to use the new binding
3) Maybe wait for LTS release if we care that much
4) Drop old binding support

Not sure if it was noticed, but I added following text to the commit
message after receiving Florian's question:
> For now keep platform device support in place. We may consider dropping
> it once MDIO bindings gets used "everywhere".

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
