From: Laszlo Ersek <lersek-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [kernel PATCH] devicetree: document ARM bindings for QEMU's Firmware
 Config interface
Date: Fri, 28 Nov 2014 14:22:29 +0100
Message-ID: <54787715.6030407@redhat.com>
References: <1417177604-21194-1-git-send-email-lersek@redhat.com> <4081425.dh6XptxTnn@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4081425.dh6XptxTnn@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: peter.maydell-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 11/28/14 13:59, Arnd Bergmann wrote:
> On Friday 28 November 2014 13:26:44 Laszlo Ersek wrote:
>> +Example:
>> +
>> +/ {
>> +       #size-cells = <0x2>;
>> +       #address-cells = <0x2>;
>> +
>> +       fw-cfg@9020000 {
>> +               reg = <0x0 0x9020000 0x0 0x2 0x0 0x9020002 0x0 0x1>;
>> +               compatible = "fw-cfg,mmio";
>> +       };
>> +};
>>
> 
> "fw-cfg" is not a valid vendor string. Are you emulating an actual piece
> of hardware here or is this something that comes from qemu?

It's a made up name.

> How about using "qemu,fwcfg" as the compatible string, and documenting
> "qemu" as an official vendor string in Documentation/devicetree/bindings/vendor-prefixes.txt

I can do that, certainly, but I'm not sure if that implies other QEMU
devices should follow suit.

For example, the virtio-mmio transports that qemu advertises have the
"compatible" property "virtio,mmio". "virtio" is not a vendor prefix
either (according to the above text file).

Here's the full list of compatible strings from the generated DTB:

  compatible = "arm,cortex-a15";
  compatible = "arm,armv7-timer";
  compatible = "arm,cortex-a15-gic";
  compatible = "arm,pl011", "arm,primecell";
  compatible = "arm,pl031", "arm,primecell";
  compatible = "arm,psci-0.2", "arm,psci";
  compatible = "cfi-flash";
  compatible = "fixed-clock";
  compatible = "fw-cfg,mmio";
  compatible = "virtio,mmio";
  compatible = "linux,dummy-virt";

According to
<http://devicetree.org/Device_Tree_Usage#Understanding_the_compatible_Property>,
"cfi-flash" and "fixed-clock" don't even have the correct format
(there's no comma separating <manufacturer> from <model>).

> We don't normally list contiguous registers separately. Maybe just round
> up to one page and make the register property
> 
> 	reg = <0x0 0x9020000 0x0 0x1000>;

The registers are not necessarily placed shoulder to shoulder (it's not
a requirement in the QEMU source).

> Finally, isn't there also an interrupt associated with this virtual device?

No, there is not.

Thanks
Laszlo
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
