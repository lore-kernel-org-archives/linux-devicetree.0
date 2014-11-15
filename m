From: DATACOM - Erico Nunes <erico.nunes@datacom.ind.br>
Subject: Re: Creating a new platform_bus inside a spi_driver
Date: Sat, 15 Nov 2014 13:32:07 -0200
Message-ID: <546771F7.1000805@datacom.ind.br>
References: <545BD3EC.6050503@datacom.ind.br>	<707686811.tbHdnxXMgE@wuerfel> <545CF546.8090703@datacom.ind.br>	<2501338.EAyTJJ482M@wuerfel> <20141111110757.3DFFAC40D48@trevor.secretlab.ca> <54647133.1030801@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54647133.1030801@mm-sol.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stanimir Varbanov <svarbanov@mm-sol.com>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, sameo@linux.intel.com, lee.jones@linaro.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 11/13/2014 06:52 AM, Stanimir Varbanov wrote:
> Hi Grant, Arnd and Erico
>=20
> On 11/11/2014 01:07 PM, Grant Likely wrote:
>> On Fri, 07 Nov 2014 18:04:35 +0100
>> , Arnd Bergmann <arnd@arndb.de>
>>  wrote:
>>> On Friday 07 November 2014 14:37:26 DATACOM - =C3=89rico Nunes wrot=
e:
>>>> Hello Arnd and all,
>>>>
>>>> On 11/07/2014 08:04 AM, Arnd Bergmann wrote:
>>>>> On Thursday 06 November 2014 18:02:52 DATACOM - =C3=89rico Nunes =
wrote:
>>>>>> The idea is that "fpga-spi" is a spi_driver which instantiates a=
ll of the
>>>>>> "fpga-deviceN" as platform_devices, through the use of
>>>>>> of_platform_populate(dev->of_node, NULL, NULL, dev).
>>>>>>
>>>>>> The visible problem we're facing with this approach is that, as =
the internal
>>>>>> platform_devices have a "reg" property, of_platform_populate() e=
ventually
>>>>>> triggers an address translation which is apparently trying to tr=
anslate the
>>>>>> addresses of the internal platform_bus to addresses of the proce=
ssor memory
>>>>>> map.
>>>>>> This translation is however not part of our intention, as we int=
end to have an
>>>>>> internal bus with its own memory map.
>>>>>> This fails when __of_translate_address() reaches the spi-master =
boundary
>>>>>> because (as it seems to make sense) it isn't possible to transla=
te them past
>>>>>> that.
>>>>>> A KERN_ERR rated message like
>>>>>> "prom_parse: Bad cell count for /soc@f0000000/spi@2000/fpga@1"
>>>>>> is thrown by __of_translate_address() and later it is not possib=
le to obtain
>>>>>> the "reg" address with platform_get_resource().
>>>>>>
>>>>>> On this scenario, we have a few questions and, depending on the =
outcome of
>>>>>> these, possibly a patch.
>>>>>>
>>>>>> 1. Is it possible to have an internal platform_bus with a differ=
ent memory map
>>>>>> as we intended? Or are platform_busses and platform_devices supp=
osed to always
>>>>>> be mapped on the processor memory map?
>>>>> It's inconsistent. We have some code that assumes that platform d=
evices
>>>>> are always memory mapped, and some other code that breaks this as=
sumption.
>>>>
>>>> By this I take that the platform subsystem could be made generic s=
o it can be
>>>> used in both ways (mapped to processor memory map or mapped to a p=
rivate memory
>>>> map). There seems to be no strict requirement enforcing it to be p=
rocessor
>>>> memory map.
>>>>
>>>> Is this correct?
>>>
>>> It could be, but I'm sure if that is a good idea or not. It might c=
omplicate
>>> things elsewhere, so it would at least need careful testing and con=
sensus
>>> among a broader group of developers.
>>
>> I don't think it is a good idea. I would prefer to make the behaviou=
r of
>> of_platform_populate() generic so it could work for multiple bus
>> types rather than reusing/abusing platform_device in this way.
>>
>> If the devices on the FPGA were memory mapped, it would be a differe=
nt
>> situation, but being behind an SPI bus where the access to those dev=
ices
>> must always be mediated by the SPI controller, it would be better to
>> have a separate bus type and a separate pool of drivers for those
>> devices.
>>

Grant,
could you please elaborate a little on "making the behaviour of
of_platform_populate() generic so it could work for multiple bus types
without reusing/abusing platform_device"?

Initially we thought of having a separate bus type, but that felt such =
a
duplication of a platform_bus that we decided to try to reuse.

On the other thread line about the patch posted in my opening comment,
it was suggested that we could change __of_translate_address(), for
example to allow a translation end-point to be passed it. This seems
like a good idea to me, however with this comment here it is still not
clear to me whether this change would be likely accepted or not.

>=20
> This is exactly the same problem that we have on Qualcomm SPMI PMIC m=
fd
> driver. We had a discussion at [1] where we tried to solve it by
> IORESOURCE_REG. Unfortunately there is no conclusion yet.
>=20
> I'm glad to see that someone else have the same issue, maybe it is ti=
me
> to restart the discussion. The last proposal from Grant was to implem=
ent
> dev_get_localbus_address() API in drivers/base.

I took the time to read through your thread and indeed a lot of this
discussion is common. It is now clear that we should not be using
IORESOURCE_MEM as it was assumed in the original patch, which was one o=
f
my original questions.
We are still not using the mfd framework because of the need to maintai=
n
the table of "compatible" drivers in code, and this requires double
maintenance of code instead of adding a new device to the dts.
Nevertheless, I tested your "RFC: add function for localbus address"
patch, and your solution worked right away for my case too (without mfd=
)
by just changing my drivers to get IORESOURCE_REG instead.
