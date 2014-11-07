From: =?windows-1252?Q?DATACOM_-_=C9rico_Nunes?=
	<erico.nunes-rCUF4CxDseZknzVnJbg3IA@public.gmane.org>
Subject: Re: Creating a new platform_bus inside a spi_driver
Date: Fri, 07 Nov 2014 14:37:26 -0200
Message-ID: <545CF546.8090703@datacom.ind.br>
References: <545BD3EC.6050503@datacom.ind.br> <707686811.tbHdnxXMgE@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <707686811.tbHdnxXMgE@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Arnd and all,

On 11/07/2014 08:04 AM, Arnd Bergmann wrote:
> On Thursday 06 November 2014 18:02:52 DATACOM - =C9rico Nunes wrote:
>> The idea is that "fpga-spi" is a spi_driver which instantiates all o=
f the
>> "fpga-deviceN" as platform_devices, through the use of
>> of_platform_populate(dev->of_node, NULL, NULL, dev).
>>
>> The visible problem we're facing with this approach is that, as the =
internal
>> platform_devices have a "reg" property, of_platform_populate() event=
ually
>> triggers an address translation which is apparently trying to transl=
ate the
>> addresses of the internal platform_bus to addresses of the processor=
 memory
>> map.
>> This translation is however not part of our intention, as we intend =
to have an
>> internal bus with its own memory map.
>> This fails when __of_translate_address() reaches the spi-master boun=
dary
>> because (as it seems to make sense) it isn't possible to translate t=
hem past
>> that.
>> A KERN_ERR rated message like
>> "prom_parse: Bad cell count for /soc@f0000000/spi@2000/fpga@1"
>> is thrown by __of_translate_address() and later it is not possible t=
o obtain
>> the "reg" address with platform_get_resource().
>>
>> On this scenario, we have a few questions and, depending on the outc=
ome of
>> these, possibly a patch.
>>
>> 1. Is it possible to have an internal platform_bus with a different =
memory map
>> as we intended? Or are platform_busses and platform_devices supposed=
 to always
>> be mapped on the processor memory map?
> It's inconsistent. We have some code that assumes that platform devic=
es
> are always memory mapped, and some other code that breaks this assump=
tion.

By this I take that the platform subsystem could be made generic so it =
can be
used in both ways (mapped to processor memory map or mapped to a privat=
e memory
map). There seems to be no strict requirement enforcing it to be proces=
sor
memory map.

Is this correct?

>> 2. If platform_bus and platform_device were actually designed to alw=
ays be
>> mappable to the processor memory map, what would be a different appr=
oach to
>> this problem?  One alternative considered was to define a new "fpga_=
bus" and
>> "fpga_device" but that seemed as an overkill approach to the problem=
=2E
> I think the existing mfd framework should do what you need, when you =
call
> mfd_add_devices() and pass a table of cells with the compatible strin=
gs
> for your devices, it should create the platform devices you want. If =
not,
> that can probably be fixed in the mfd core code.
>
>

Thanks for the tip, we were not aware of the purpose of this mfd framew=
ork and
we will take a look at this framework now.
However I'm thinking now that eventually it would fall in the same case=
 of
trying to translate the address of any "reg" dts property to the proces=
sor
memory map, and fail with the same error for the SPI case.

Considering this and taking the answer to the first question, do you th=
ink a
patch fixing the "error" report by the translation function would be
acceptable?
We can prepare/test that under our platform and submit it.

Thanks!


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
