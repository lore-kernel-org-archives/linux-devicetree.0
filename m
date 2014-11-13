From: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: Re: Creating a new platform_bus inside a spi_driver
Date: Thu, 13 Nov 2014 10:52:03 +0200
Message-ID: <54647133.1030801@mm-sol.com>
References: <545BD3EC.6050503@datacom.ind.br>	<707686811.tbHdnxXMgE@wuerfel> <545CF546.8090703@datacom.ind.br>	<2501338.EAyTJJ482M@wuerfel> <20141111110757.3DFFAC40D48@trevor.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141111110757.3DFFAC40D48-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, =?windows-1252?Q?DATACOM_-_=C9rico_Nunes?= <erico.nunes-rCUF4CxDseZknzVnJbg3IA@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Grant, Arnd and Erico

On 11/11/2014 01:07 PM, Grant Likely wrote:
> On Fri, 07 Nov 2014 18:04:35 +0100
> , Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>  wrote:
>> On Friday 07 November 2014 14:37:26 DATACOM - =C3=89rico Nunes wrote=
:
>>> Hello Arnd and all,
>>>
>>> On 11/07/2014 08:04 AM, Arnd Bergmann wrote:
>>>> On Thursday 06 November 2014 18:02:52 DATACOM - =C3=89rico Nunes w=
rote:
>>>>> The idea is that "fpga-spi" is a spi_driver which instantiates al=
l of the
>>>>> "fpga-deviceN" as platform_devices, through the use of
>>>>> of_platform_populate(dev->of_node, NULL, NULL, dev).
>>>>>
>>>>> The visible problem we're facing with this approach is that, as t=
he internal
>>>>> platform_devices have a "reg" property, of_platform_populate() ev=
entually
>>>>> triggers an address translation which is apparently trying to tra=
nslate the
>>>>> addresses of the internal platform_bus to addresses of the proces=
sor memory
>>>>> map.
>>>>> This translation is however not part of our intention, as we inte=
nd to have an
>>>>> internal bus with its own memory map.
>>>>> This fails when __of_translate_address() reaches the spi-master b=
oundary
>>>>> because (as it seems to make sense) it isn't possible to translat=
e them past
>>>>> that.
>>>>> A KERN_ERR rated message like
>>>>> "prom_parse: Bad cell count for /soc@f0000000/spi@2000/fpga@1"
>>>>> is thrown by __of_translate_address() and later it is not possibl=
e to obtain
>>>>> the "reg" address with platform_get_resource().
>>>>>
>>>>> On this scenario, we have a few questions and, depending on the o=
utcome of
>>>>> these, possibly a patch.
>>>>>
>>>>> 1. Is it possible to have an internal platform_bus with a differe=
nt memory map
>>>>> as we intended? Or are platform_busses and platform_devices suppo=
sed to always
>>>>> be mapped on the processor memory map?
>>>> It's inconsistent. We have some code that assumes that platform de=
vices
>>>> are always memory mapped, and some other code that breaks this ass=
umption.
>>>
>>> By this I take that the platform subsystem could be made generic so=
 it can be
>>> used in both ways (mapped to processor memory map or mapped to a pr=
ivate memory
>>> map). There seems to be no strict requirement enforcing it to be pr=
ocessor
>>> memory map.
>>>
>>> Is this correct?
>>
>> It could be, but I'm sure if that is a good idea or not. It might co=
mplicate
>> things elsewhere, so it would at least need careful testing and cons=
ensus
>> among a broader group of developers.
>=20
> I don't think it is a good idea. I would prefer to make the behaviour=
 of
> of_platform_populate() generic so it could work for multiple bus
> types rather than reusing/abusing platform_device in this way.
>=20
> If the devices on the FPGA were memory mapped, it would be a differen=
t
> situation, but being behind an SPI bus where the access to those devi=
ces
> must always be mediated by the SPI controller, it would be better to
> have a separate bus type and a separate pool of drivers for those
> devices.
>=20

This is exactly the same problem that we have on Qualcomm SPMI PMIC mfd
driver. We had a discussion at [1] where we tried to solve it by
IORESOURCE_REG. Unfortunately there is no conclusion yet.

I'm glad to see that someone else have the same issue, maybe it is time
to restart the discussion. The last proposal from Grant was to implemen=
t
dev_get_localbus_address() API in drivers/base.

regards
Stan

[1] https://lkml.org/lkml/2014/7/29/252
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
