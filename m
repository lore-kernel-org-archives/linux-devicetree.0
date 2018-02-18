Return-Path: <SRS0=YrF9=FM=vger.kernel.org=devicetree-owner@kernel.org>
Received: from fed1rmwml106.cox.net ([68.230.241.176]:51487 "EHLO
        fed1rmwml106.cox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751337AbeBRPXN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 18 Feb 2018 10:23:13 -0500
Received: from eastrmimpo110.cox.net ([68.230.241.223])
          by eastrmfepo102.cox.net
          (InterMail vM.8.01.05.28 201-2260-151-171-20160122) with ESMTP
          id <20180218151345.OLWG14605.eastrmfepo102.cox.net@eastrmimpo110.cox.net>
          for <devicetree@vger.kernel.org>; Sun, 18 Feb 2018 10:13:45 -0500
Date: Sun, 18 Feb 2018 10:13:44 -0500
Subject: Re: Issue with dt_to_config with dts files that include headers from
 dt-bindings
From: Chris Wyse <chris.wyse@cox.net>
Message-ID: <BE4972C9-BC58-4950-8073-ADA3B25F6FC2@cox.net>
Mime-version: 1.0
Content-type: text/plain;
        charset="UTF-8"
Content-transfer-encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 11/07/16 10:51, Frank Rowand wrote:
> On 11/05/16 13:56, Gaurav Minocha wrote:
>> On Nov 4, 2016 1:19 PM, "Peter Robinson" <pbrobinson@xxxxxxxxx> wrote:
>>>
>>> Hi Gaurav, Rob and Frank,
>>>
>>> I've just discovered the dt_to_config script (awesome thanks!) but it
>>> errors out when a dts(i) includes a header file from dt-bindings. EG
>>>
>>> ./scripts/dtc/dt_to_config arch/arm/boot/dts/am335x-boneblack.dts
>>> In file included from arch/arm/boot/dts/am335x-boneblack.dts:10:0:
>>> arch/arm/boot/dts/am33xx.dtsi:11:35: error: no include path in which
>>> to search for dt-bindings/gpio/gpio.h
>>>  #include <dt-bindings/gpio/gpio.h>
>>>                                    ^
>>> arch/arm/boot/dts/am33xx.dtsi:12:40: error: no include path in which
>>> to search for dt-bindings/pinctrl/am33xx.h
>>>  #include <dt-bindings/pinctrl/am33xx.h>
>>>                                         ^
>>> arch/arm/boot/dts/am335x-boneblack.dts:12:41: error: no include path
>>> in which to search for dt-bindings/display/tda998x.h
>>>  #include <dt-bindings/display/tda998x.h>
>>>                                          ^
>>> Error: arch/arm/boot/dts/am335x-bone-common.dtsi:33.23-24 syntax error
>>> FATAL ERROR: Unable to parse input tree
>>>
>> 
>> In bash do, export ARCH=arm
>> 
>> Works for me!
>> 
>>>
>>> Regards,
>>> Peter
>> 
>
>Were there any other error messages reported? There should have
>been a message suggesting that $ARCH was not set (if it wasn't)
>and that it did not have the value of "arm".
>
>If that message did not exist, I would like to understand why.
>
>If the message did exist, but was not clear, how could the
>message change to be more helpful?
>
>-Frank
>--

I just tried using this utility from inside a Yocto devshell, with a 4.1.15 kernel.  
It didn't have dtx_diff or dt_to_config, so I copied them from the master branch.
I received the same errors about the missing include path.  The ARCH environment
variable was properly defined as 'arm'.  I resolved the problem by modifying the 
dtx_diff script to use ${srctree}/include in its include path when using both dtc
and gcc.

>From dtx_diff:
    cpp_flags="\
            -nostdinc                                  \
            -I${srctree}/scripts/dtc/include-prefixes  \
            -I${srctree}/include                       \
            -undef -D__DTS__"

    DTC="\
            ${DTC}                                     \
            -i ${srctree}/scripts/dtc/include-prefixes \
            -I${srctree}/include                       \
            -O dts -qq -f ${dtc_sort} -o -"

Chris


