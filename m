Return-Path: <erico.nunes@datacom.ind.br>
Message-ID: <54676FDD.3090703@datacom.ind.br>
Date: Sat, 15 Nov 2014 13:23:09 -0200
From: DATACOM - Erico Nunes <erico.nunes@datacom.ind.br>
MIME-Version: 1.0
Subject: Re: Creating a new platform_bus inside a spi_driver
References: <545BD3EC.6050503@datacom.ind.br>	<707686811.tbHdnxXMgE@wuerfel> <545CF546.8090703@datacom.ind.br>	<2501338.EAyTJJ482M@wuerfel> <20141111110757.3DFFAC40D48@trevor.secretlab.ca> <54647133.1030801@mm-sol.com>
In-Reply-To: <54647133.1030801@mm-sol.com>
Content-Type: multipart/alternative;
 boundary="------------080009050804090207070402"
To: Stanimir Varbanov <svarbanov@mm-sol.com>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, sameo@linux.intel.com, lee.jones@linaro.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------080009050804090207070402
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit


On 11/13/2014 06:52 AM, Stanimir Varbanov wrote:
> Hi Grant, Arnd and Erico
>
> On 11/11/2014 01:07 PM, Grant Likely wrote:
>> On Fri, 07 Nov 2014 18:04:35 +0100
>> , Arnd Bergmann <arnd@arndb.de>
>>  wrote:
>>> On Friday 07 November 2014 14:37:26 DATACOM - Érico Nunes wrote:
>>>> Hello Arnd and all,
>>>>
>>>> On 11/07/2014 08:04 AM, Arnd Bergmann wrote:
>>>>> On Thursday 06 November 2014 18:02:52 DATACOM - Érico Nunes wrote:
>>>>>> The idea is that "fpga-spi" is a spi_driver which instantiates all of the
>>>>>> "fpga-deviceN" as platform_devices, through the use of
>>>>>> of_platform_populate(dev->of_node, NULL, NULL, dev).
>>>>>>
>>>>>> The visible problem we're facing with this approach is that, as the internal
>>>>>> platform_devices have a "reg" property, of_platform_populate() eventually
>>>>>> triggers an address translation which is apparently trying to translate the
>>>>>> addresses of the internal platform_bus to addresses of the processor memory
>>>>>> map.
>>>>>> This translation is however not part of our intention, as we intend to have an
>>>>>> internal bus with its own memory map.
>>>>>> This fails when __of_translate_address() reaches the spi-master boundary
>>>>>> because (as it seems to make sense) it isn't possible to translate them past
>>>>>> that.
>>>>>> A KERN_ERR rated message like
>>>>>> "prom_parse: Bad cell count for /soc@f0000000/spi@2000/fpga@1"
>>>>>> is thrown by __of_translate_address() and later it is not possible to obtain
>>>>>> the "reg" address with platform_get_resource().
>>>>>>
>>>>>> On this scenario, we have a few questions and, depending on the outcome of
>>>>>> these, possibly a patch.
>>>>>>
>>>>>> 1. Is it possible to have an internal platform_bus with a different memory map
>>>>>> as we intended? Or are platform_busses and platform_devices supposed to always
>>>>>> be mapped on the processor memory map?
>>>>> It's inconsistent. We have some code that assumes that platform devices
>>>>> are always memory mapped, and some other code that breaks this assumption.
>>>>
>>>> By this I take that the platform subsystem could be made generic so it can be
>>>> used in both ways (mapped to processor memory map or mapped to a private memory
>>>> map). There seems to be no strict requirement enforcing it to be processor
>>>> memory map.
>>>>
>>>> Is this correct?
>>>
>>> It could be, but I'm sure if that is a good idea or not. It might complicate
>>> things elsewhere, so it would at least need careful testing and consensus
>>> among a broader group of developers.
>>
>> I don't think it is a good idea. I would prefer to make the behaviour of
>> of_platform_populate() generic so it could work for multiple bus
>> types rather than reusing/abusing platform_device in this way.
>>
>> If the devices on the FPGA were memory mapped, it would be a different
>> situation, but being behind an SPI bus where the access to those devices
>> must always be mediated by the SPI controller, it would be better to
>> have a separate bus type and a separate pool of drivers for those
>> devices.
>>

Grant,
could you please elaborate a little on "making the behaviour of
of_platform_populate() generic so it could work for multiple bus types
without reusing/abusing platform_device"?

Initially we thought of having a separate bus type, but that felt such a
duplication of a platform_bus that we decided to try to reuse.

On the other thread line about the patch posted in my opening comment,
it was suggested that we could change __of_translate_address(), for
example to allow a translation end-point to be passed it. This seems
like a good idea to me, however with this comment here it is still not
clear to me whether this change would be likely accepted or not.

>
> This is exactly the same problem that we have on Qualcomm SPMI PMIC mfd
> driver. We had a discussion at [1] where we tried to solve it by
> IORESOURCE_REG. Unfortunately there is no conclusion yet.
>
> I'm glad to see that someone else have the same issue, maybe it is time
> to restart the discussion. The last proposal from Grant was to implement
> dev_get_localbus_address() API in drivers/base.

I took the time to read through your thread and indeed a lot of this
discussion is common. It is now clear that we should not be using
IORESOURCE_MEM as it was assumed in the original patch, which was one of
my original questions.
We are still not using the mfd framework because of the need to maintain
the table of "compatible" drivers in code, and this requires double
maintenance of code instead of adding a new device to the dts.
Nevertheless, I tested your "RFC: add function for localbus address"
patch, and your solution worked right away for my case too (without mfd)
by just changing my drivers to get IORESOURCE_REG instead.



--------------080009050804090207070402
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    On 11/13/2014 06:52 AM, Stanimir Varbanov wrote:<br>
    <span style="white-space: pre;">&gt; Hi Grant, Arnd and Erico<br>
      &gt;<br>
      &gt; On 11/11/2014 01:07 PM, Grant Likely wrote:<br>
      &gt;&gt; On Fri, 07 Nov 2014 18:04:35 +0100<br>
      &gt;&gt; , Arnd Bergmann <a class="moz-txt-link-rfc2396E" href="mailto:arnd@arndb.de">&lt;arnd@arndb.de&gt;</a><br>
      &gt;&gt;� wrote:<br>
      &gt;&gt;&gt; On Friday 07 November 2014 14:37:26 DATACOM - Érico
      Nunes wrote:<br>
      &gt;&gt;&gt;&gt; Hello Arnd and all,<br>
      &gt;&gt;&gt;&gt;<br>
      &gt;&gt;&gt;&gt; On 11/07/2014 08:04 AM, Arnd Bergmann wrote:<br>
      &gt;&gt;&gt;&gt;&gt; On Thursday 06 November 2014 18:02:52 DATACOM
      - Érico Nunes wrote:<br>
      &gt;&gt;&gt;&gt;&gt;&gt; The idea is that "fpga-spi" is a
      spi_driver which instantiates all of the<br>
      &gt;&gt;&gt;&gt;&gt;&gt; "fpga-deviceN" as platform_devices,
      through the use of<br>
      &gt;&gt;&gt;&gt;&gt;&gt; of_platform_populate(dev-&gt;of_node,
      NULL, NULL, dev).<br>
      &gt;&gt;&gt;&gt;&gt;&gt;<br>
      &gt;&gt;&gt;&gt;&gt;&gt; The visible problem we're facing with
      this approach is that, as the internal<br>
      &gt;&gt;&gt;&gt;&gt;&gt; platform_devices have a "reg" property,
      of_platform_populate() eventually<br>
      &gt;&gt;&gt;&gt;&gt;&gt; triggers an address translation which is
      apparently trying to translate the<br>
      &gt;&gt;&gt;&gt;&gt;&gt; addresses of the internal platform_bus to
      addresses of the processor memory<br>
      &gt;&gt;&gt;&gt;&gt;&gt; map.<br>
      &gt;&gt;&gt;&gt;&gt;&gt; This translation is however not part of
      our intention, as we intend to have an<br>
      &gt;&gt;&gt;&gt;&gt;&gt; internal bus with its own memory map.<br>
      &gt;&gt;&gt;&gt;&gt;&gt; This fails when __of_translate_address()
      reaches the spi-master boundary<br>
      &gt;&gt;&gt;&gt;&gt;&gt; because (as it seems to make sense) it
      isn't possible to translate them past<br>
      &gt;&gt;&gt;&gt;&gt;&gt; that.<br>
      &gt;&gt;&gt;&gt;&gt;&gt; A KERN_ERR rated message like<br>
      &gt;&gt;&gt;&gt;&gt;&gt; "prom_parse: Bad cell count for
      /soc@f0000000/spi@2000/fpga@1"<br>
      &gt;&gt;&gt;&gt;&gt;&gt; is thrown by __of_translate_address() and
      later it is not possible to obtain<br>
      &gt;&gt;&gt;&gt;&gt;&gt; the "reg" address with
      platform_get_resource().<br>
      &gt;&gt;&gt;&gt;&gt;&gt;<br>
      &gt;&gt;&gt;&gt;&gt;&gt; On this scenario, we have a few questions
      and, depending on the outcome of<br>
      &gt;&gt;&gt;&gt;&gt;&gt; these, possibly a patch.<br>
      &gt;&gt;&gt;&gt;&gt;&gt;<br>
      &gt;&gt;&gt;&gt;&gt;&gt; 1. Is it possible to have an internal
      platform_bus with a different memory map<br>
      &gt;&gt;&gt;&gt;&gt;&gt; as we intended? Or are platform_busses
      and platform_devices supposed to always<br>
      &gt;&gt;&gt;&gt;&gt;&gt; be mapped on the processor memory map?<br>
      &gt;&gt;&gt;&gt;&gt; It's inconsistent. We have some code that
      assumes that platform devices<br>
      &gt;&gt;&gt;&gt;&gt; are always memory mapped, and some other code
      that breaks this assumption.<br>
      &gt;&gt;&gt;&gt;<br>
      &gt;&gt;&gt;&gt; By this I take that the platform subsystem could
      be made generic so it can be<br>
      &gt;&gt;&gt;&gt; used in both ways (mapped to processor memory map
      or mapped to a private memory<br>
      &gt;&gt;&gt;&gt; map). There seems to be no strict requirement
      enforcing it to be processor<br>
      &gt;&gt;&gt;&gt; memory map.<br>
      &gt;&gt;&gt;&gt;<br>
      &gt;&gt;&gt;&gt; Is this correct?<br>
      &gt;&gt;&gt;<br>
      &gt;&gt;&gt; It could be, but I'm sure if that is a good idea or
      not. It might complicate<br>
      &gt;&gt;&gt; things elsewhere, so it would at least need careful
      testing and consensus<br>
      &gt;&gt;&gt; among a broader group of developers.<br>
      &gt;&gt;<br>
      &gt;&gt; I don't think it is a good idea. I would prefer to make
      the behaviour of<br>
      &gt;&gt; of_platform_populate() generic so it could work for
      multiple bus<br>
      &gt;&gt; types rather than reusing/abusing platform_device in this
      way.<br>
      &gt;&gt;<br>
      &gt;&gt; If the devices on the FPGA were memory mapped, it would
      be a different<br>
      &gt;&gt; situation, but being behind an SPI bus where the access
      to those devices<br>
      &gt;&gt; must always be mediated by the SPI controller, it would
      be better to<br>
      &gt;&gt; have a separate bus type and a separate pool of drivers
      for those<br>
      &gt;&gt; devices.<br>
      &gt;&gt;</span><br>
    <br>
    Grant,<br>
    could you please elaborate a little on "making the behaviour of<br>
    of_platform_populate() generic so it could work for multiple bus
    types<br>
    without reusing/abusing platform_device"?<br>
    <br>
    Initially we thought of having a separate bus type, but that felt
    such a<br>
    duplication of a platform_bus that we decided to try to reuse.<br>
    <br>
    On the other thread line about the patch posted in my opening
    comment,<br>
    it was suggested that we could change __of_translate_address(), for<br>
    example to allow a translation end-point to be passed it. This seems<br>
    like a good idea to me, however with this comment here it is still
    not<br>
    clear to me whether this change would be likely accepted or not.<br>
    <br>
    <span style="white-space: pre;">&gt;<br>
      &gt; This is exactly the same problem that we have on Qualcomm
      SPMI PMIC mfd<br>
      &gt; driver. We had a discussion at [1] where we tried to solve it
      by<br>
      &gt; IORESOURCE_REG. Unfortunately there is no conclusion yet.<br>
      &gt;<br>
      &gt; I'm glad to see that someone else have the same issue, maybe
      it is time<br>
      &gt; to restart the discussion. The last proposal from Grant was
      to implement<br>
      &gt; dev_get_localbus_address() API in drivers/base.</span><br>
    <br>
    I took the time to read through your thread and indeed a lot of this<br>
    discussion is common. It is now clear that we should not be using<br>
    IORESOURCE_MEM as it was assumed in the original patch, which was
    one of<br>
    my original questions.<br>
    We are still not using the mfd framework because of the need to
    maintain<br>
    the table of "compatible" drivers in code, and this requires double<br>
    maintenance of code instead of adding a new device to the dts.<br>
    Nevertheless, I tested your "RFC: add function for localbus address"<br>
    patch, and your solution worked right away for my case too (without
    mfd)<br>
    by just changing my drivers to get IORESOURCE_REG instead.<br>
    <br>
    <br>
  </body>
</html>

--------------080009050804090207070402--
