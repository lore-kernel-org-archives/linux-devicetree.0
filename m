From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Patch v5 08/13] ARM: imx6q: add config-on-boot gpios
Date: Wed, 20 Jun 2012 09:29:39 -0500
Message-ID: <4FE1DE53.4070202@gmail.com>
References: <1339590863-10564-1-git-send-email-richard.zhao@freescale.com> <1339590863-10564-9-git-send-email-richard.zhao@freescale.com> <4FD8AD42.6010702@gmail.com> <20120613152841.GA23590@richard-laptop> <4FD8C4DB.4020908@gmail.com> <20120614013343.GD29684@b20223-02.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120614013343.GD29684-iWYTGMXpHj9ITqJhDdzsOjpauB2SiJktrE5yTffgRl4@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Richard Zhao <linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/13/2012 08:33 PM, Richard Zhao wrote:
> On Wed, Jun 13, 2012 at 11:50:35AM -0500, Rob Herring wrote:
>> On 06/13/2012 10:28 AM, Richard Zhao wrote:
>>> On Wed, Jun 13, 2012 at 10:09:54AM -0500, Rob Herring wrote:
>>>> On 06/13/2012 07:34 AM, Richard Zhao wrote:
>>>>> Sometimes, boards have gpios that don't own by any driver or owner
>>>>> by a generic driver that don't like hacks. Such gpios is normally
>>>>> output and need setup once on boot. So I introduce the config-on-boot
>>>>> gpios.
>>>>>
>>>>> Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
>>>>> Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>>>> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
>>>>> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>>>>> ---
>>>>>  .../devicetree/bindings/arm/config-on-boot.txt     |   12 +++++++
>>>>>  arch/arm/boot/dts/imx6q-sabrelite.dts              |    7 ++++
>>>>>  arch/arm/mach-imx/mach-imx6q.c                     |   35 ++++++++++++++++++++
>>>>>  3 files changed, 54 insertions(+)
>>>>>  create mode 100644 Documentation/devicetree/bindings/arm/config-on-boot.txt
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/arm/config-on-boot.txt b/Documentation/devicetree/bindings/arm/config-on-boot.txt
>>>>> new file mode 100644
>>>>> index 0000000..f98ed74
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/arm/config-on-boot.txt
>>>>> @@ -0,0 +1,12 @@
>>>>> +* Configure on Boot
>>>>> +
>>>>> +Node name: config-on-boot
>>>>> +  It must be in root node. config-on-boot means to describe settings that needs
>>>>> +  to be set one time on boot but aren't owned by any driver, or the owned driver
>>>>> +  is too generic to handle such settings. For example, usb hub uses generic
>>>>> +  driver in usb core code, a on-board usb may need deassert reset pin.
>>>>
>>>> NAK. This is not a h/w description
>>> It's misc things, but is hw description.
>>
>> You are defining something based on whether linux has a driver or not.
>> That should not matter to DT. That's backwards.
> I just define the board needs some misc settings. If you think
> config-on-boot is not good, we can name it like config-misc.

Even worse.

>>
>>>> and should be solved within the
>>>> kernel or bootloader. Either fix this in u-boot,
>>> Kernel might be better not to depend on uboot.
>>>> the platform code, or
>>> How do I get gpio in platfrom code without dts description?
>>>> make the generic driver support this in a generic way.
>>> It's called just after populate devices. It's hard for generic driver to
>>> decide when it's called.
>>
>> You need to describe that you have a hub on the usb bus and add the gpio
>> line to that node. Just like PCI is probe-able, you still need DT nodes
>> sometimes for cases like this.
> PCI has dev id and may add quirks. But for embedded, I don't know how
> to connect a of node to a hub device enumerated by usb core code. And
> it may also pollute the usb core code.

USB also uses device and manufacturer ids. One of the main reasons for
putting pci devices into dts is to describe out of band signals just
like this.

Creating a binding and support code for full usb bus topology would be a
lot of work which is why I propose a simpler approach below.

>> A simpler approach would be to just add
>> the gpio to the ehci controller node, but that's not exactly correct.
> That's exactly why this patch comes out.

I mean just something like "fsl,hub-reset-gpios" in the ehci device
node. It's at least under a usb node. Whether the ehci driver handles
this or you just have a separate piece of code to find this property and
setup the gpio is up to you.

Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
