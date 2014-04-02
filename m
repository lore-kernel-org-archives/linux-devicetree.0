From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH 1/2] watchdog: Add Cadence WDT driver
Date: Wed, 02 Apr 2014 07:47:54 +0200
Message-ID: <533BA48A.6040301@monstr.eu>
References: <1396002720-7105-1-git-send-email-harinik@xilinx.com> <533A0937.9030505@roeck-us.net> <533AA0F7.2080304@monstr.eu> <533B5AAA.50707@roeck-us.net>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="BUwk5DcCajPnEjsDNDomLjroC9Ab9oL6K"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <533B5AAA.50707-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Harini Katakam <harinik-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BUwk5DcCajPnEjsDNDomLjroC9Ab9oL6K
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 04/02/2014 02:32 AM, Guenter Roeck wrote:
> On 04/01/2014 04:20 AM, Michal Simek wrote:
>> Hi Guenter,
>>
>>>> +/**
>>>> + * struct cdns_wdt - Watchdog device structure
>>>> + * @regs: baseaddress of device
>>>> + * @rst: reset flag
>>>> + * @clk: struct clk * of a clock source
>>>> + * @prescaler: for saving prescaler value
>>>> + * @ctrl_clksel: counter clock prescaler selection
>>>> + * @io_lock: spinlock for IO register access
>>>> + * @cdns_wdt_device: watchdog device structure
>>>> + * @cdns_wdt_notifier: notifier structure
>>>> + *
>>>> + * Structure containing parameters specific to cadence watchdog.
>>>> + */
>>>> +struct cdns_wdt {
>>>> +    void __iomem        *regs;
>>>> +    u32            rst;
>>>> +    struct clk        *clk;
>>>> +    u32            prescaler;
>>>> +    u32            ctrl_clksel;
>>>> +    spinlock_t        io_lock;
>>>> +    struct watchdog_device    cdns_wdt_device;
>>>> +    struct notifier_block    cdns_wdt_notifier;
>>>> +};
>>>> +
>>>> +/* Write access to Registers */
>>>> +static inline void cdns_wdt_writereg(void __iomem *offset, u32 val)=

>>>> +{
>>>> +    writel_relaxed(val, offset);
>>>> +}
>>>> +
>>>
>>> Not really sure if this function provides any value.
>>
>> I can't see any problem to use this helper IO function
>> but maybe we could do it a little bit differently.
>> Currently implementation is just passing values to writel_relaxed()
>>
>> What about to do it like this?
>>
>> static inline void cdns_wdt_writereg(struct cdns_wdt *wdt, u32 offset,=
 u32 val)
>> {
>>      writel_relaxed(val, wdt->regs + offset);
>> }
>>
> Yes, that would make more sense.

ok good.
Harini: Please use this version instead.

Thanks,
Michal


--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Microblaze cpu - http://www.monstr.eu/fdt/
Maintainer of Linux kernel - Xilinx Zynq ARM architecture
Microblaze U-BOOT custodian and responsible for u-boot arm zynq platform



--BUwk5DcCajPnEjsDNDomLjroC9Ab9oL6K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlM7pIoACgkQykllyylKDCFfzACgmEXewZkGV92r6hzodo36fPNO
kA8AmQFBmOhpM8J/Ad7E3+OYDKTJMb2z
=jifP
-----END PGP SIGNATURE-----

--BUwk5DcCajPnEjsDNDomLjroC9Ab9oL6K--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
