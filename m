From: Brendan Higgins <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 2/3] arm: dts: add Nuvoton NPCM750 device tree
Date: Wed, 6 Sep 2017 01:19:11 -0700
Message-ID: <CAFd5g45s6yo=HSut76YknOkUeKbV8yOXWbivc=EyM2s7R8DOrA@mail.gmail.com>
References: <20170906003016.2159-1-brendanhiggins@google.com>
 <20170906003016.2159-3-brendanhiggins@google.com> <CACPK8Xc0jrnx96=BoGMwQgoT2brgc0UTNU5HMHXDeFfeToVgxA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACPK8Xc0jrnx96=BoGMwQgoT2brgc0UTNU5HMHXDeFfeToVgxA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, avifishman70-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tmaimon77-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Rick Altherr <raltherr-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, OpenBMC Maillist <openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 5, 2017 at 10:23 PM, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org> wrote:
> On Wed, Sep 6, 2017 at 10:00 AM, Brendan Higgins
> <brendanhiggins-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrote:
>> +++ b/Documentation/devicetree/bindings/arm/npcm/npcm.txt
>> @@ -0,0 +1,6 @@
>> +NPCM Platforms Device Tree Bindings
>> +-----------------------------------
>> +NPCM750 SoC
>> +Required root node properties:
>> +       - compatible = "nuvoton,npcm750";
>> +
>
> This is minimal. I assume there will be more content added as more
> support is added?

Yep, that's the plan. They have a number of similar BMCs, both those
based on different ARM cores and some with different peripheral sets,
so we will probably want to have different compat strings for those.

>
> Does it need it's own directory?

Not sure, I saw that some of the other architectures did it, some did
not. I don't feel strongly about it.

>
>
>> diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
>> new file mode 100644
>> index 000000000000..54df32cff21b
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
>
>> +
>> +/dts-v1/;
>> +#include "nuvoton-npcm750.dtsi"
>> +
>> +/ {
>> +       model = "Nuvoton npcm750 Development Board (Device Tree)";
>> +       compatible = "nuvoton,npcm750";
>> +
>> +       chosen {
>> +               stdout-path = &serial3;
>> +               bootargs = "earlyprintk=serial,serial3,115200";
>> +       };
>> +
>> +       memory {
>> +               reg = <0 0x40000000>;
>> +       };
>> +
>> +       cpus {
>> +               enable-method = "nuvoton,npcm7xx-smp";
>> +       };
>> +
>> +       clk: clock-controller@f0801000 {
>> +               status = "okay";
>> +       };
>> +
>> +       apb {
>> +               watchdog1: watchdog@f0009000 {
>> +                       status = "okay";
>> +               };
>
> You've already got the label for the node, is there are reason you
> don't use a phandle to set the status?

Addressed in v4.

>
> &watchdog1 {
>    status = "okay";
> };
>
> Same with the serial nodes below.
>
>> +
>> +               serial0: serial0@f0001000 {
>> +                       status = "okay";
>> +               };
>> +
>> +               serial1: serial1@f0002000 {
>> +                       status = "okay";
>> +               };
>> +
>> +               serial2: serial2@f0003000 {
>> +                       status = "okay";
>> +               };
>> +
>> +               serial3: serial3@f0004000 {
>> +                       status = "okay";
>> +               };
>> +       };
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
