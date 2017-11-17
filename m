From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Decompiled vs *tmp extended device tree
Date: Thu, 16 Nov 2017 22:34:04 -0500
Message-ID: <7861cc51-29cb-1fa5-e6b1-f403c66736a4@gmail.com>
References: <CAOT_U5bV1cWsXa-d7A5sbd0e+UuhD6NmwsmyjrQcuWceqtus_A@mail.gmail.com>
 <20171116165212.4caconxbvfrmbs4n@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171116165212.4caconxbvfrmbs4n@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alan Martinovic <alan.martinovic-+NedCK/4fiIAvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/16/17 11:52, Rob Herring wrote:
> On Thu, Nov 16, 2017 at 01:12:55PM +0100, Alan Martinovic wrote:
>> Hi,
>> I'm trying to modify a device tree to enable support of the second UART.
>> The actual device tree which is used for the example:
>>
>> https://github.com/getsenic/senic-os-linux/blob/senic/4.13/arch/arm/boot/dts/sun8i-h3-senic-hub.dts
>>
>> The device tree includes and overrides some additional files:
>>
>>     #include "sun8i-h3.dtsi"
>>     #include "sunxi-common-regulators.dtsi"
>>     #include <dt-bindings/gpio/gpio.h>
>>     #include <dt-bindings/input/input.h>
>>     #include <dt-bindings/pinctrl/sun4i-a10.h>
>>
>> I would like to know to what does the extended device tree look like,
>> and use that as my base, because I don't really have the complete picture
>> by just looking at the sun8i-h3-senic-hub.dts
>>
>> In this example I'm interested in where are "uart0_pins_a" defined.
>> sun8i-h3-senic-hub.dts references them but has no definitions,
>> so I'm assuming the definition is somewhere in the included files.
>>
>> To help me out with this task I discovered the device tree decompiler.
>> Am expecting that the decompiled dts contains all the data that
>> end up in the dtb blob, and should, among other, contain all the information
>> available in sun8i-h3-senic-hub.dts.
>>
>>     scripts/dtc/dtc -I dtb -O dts -o expanded-devtree.dts
>> arch/arm/boot/dts/sun8i-h3-senic-hub.dtb
>>
>> But the decompiled extended device tree also seems to have no
>> traces of "uart0_pins_a" at all :
>>
>>     grep uart0_pins_a expanded-devtree.dts
> 
> labels are purely a source level construct (though overlays changes 
> that some) and are lost after compiling. You have to look for 'uart0@0'.
> 
>>
>> I've also discovered the hidden .tmp files:
>>
>>     ⟫ ls arch/arm/boot/dts/.sun8i-h3-*
>>     arch/arm/boot/dts/.sun8i-h3-senic-hub.dtb.cmd
>>     arch/arm/boot/dts/.sun8i-h3-senic-hub.dtb.d.dtc.tmp
>>     arch/arm/boot/dts/.sun8i-h3-senic-hub.dtb.d.pre.tmp
>>     arch/arm/boot/dts/.sun8i-h3-senic-hub.dtb.dts.tmp
>>
>> and in one of them there is a definition to "uart0_pins_a":
>>
>>     ⟫ grep uart0_pins_a  arch/arm/boot/dts/.sun8i-h3-*
>>     arch/arm/boot/dts/.sun8i-h3-senic-hub.dtb.dts.tmp:   uart0_pins_a: uart0@0 {
>>     arch/arm/boot/dts/.sun8i-h3-senic-hub.dtb.dts.tmp: pinctrl-0 =
>> <&uart0_pins_a>;
>>
>> My question is, which one is a more accurate representation
>> of the final device tree that I should use as a basis?
> 
> Compiling dts to dts is mainly useful to get rid of all the C 
> preprocessor and includes to see what the final nodes look like. You do 
> lose some things though.

Some explanation of this stuff is in the slides at:

  https://elinux.org/Device_Tree_Reference#Debugging

  Follow the link to the slides "Solving Device Tree Issues" (updated),
  ELCE October 2015 by Frank Rowand.

Info on why some things in the original source end up in the final
device tree and some don't (note that the tool "dtdiff" in the slides
is now in mainline Linux, as scripts/dtc/dtx_diff):

   slides
     46 - 59
     68 - 75

Info on how to read .sun8i-h3-senic-hub.dtb.dts.tmp to find out
where things in the final device tree came from:

   slides
     80 - 84

A more elegant solution that will provide file names and line numbers
for what dts or dtsi a node or property in the final device tree came
from:

   slides
     85 - 92

   This feature has not yet gotten into dtc, so if you want to use it
   you need to patch the dtc source yourself.  Link to those patches
   is at the same elinux.org page, "Supporting Resources (patches, etc)".

   I am hopeful that someday I or someone else will finish implementing
   this feature properly so that it can be accepted into dtc.


> 
>> Why isn't it correct to expect that everything from sun8i-h3-senic-hub.dts
>> will end up in the final device tree blob?
> 
> That's true for every compiler. After compiling, preprocessor symbols 
> are gone, functions may be inlined, etc.
> 
> Rob
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
