From: Vivek Unune <npcomplete13-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: BCM5301X: Add support for Linksys EA9500
Date: Wed, 15 Mar 2017 16:18:20 -0400
Message-ID: <CAChtp75mzHkSg4rVh602vaMotqs6NtaPOD4383Gef8tVPO37FQ@mail.gmail.com>
References: <1489590033-4946-1-git-send-email-npcomplete13@gmail.com>
 <20170315185214.GF21021@lunn.ch> <CAChtp75xk3LN1-DPVvaHT5qEvrdoFFvXEk-daVCcJ=4rYu_vmw@mail.gmail.com>
 <7f5ddeba-6f79-9de5-2c67-a77e6bec0ef9@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7f5ddeba-6f79-9de5-2c67-a77e6bec0ef9-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <florian.fainelli-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org, zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Thanks Florian.

Let me try this out. First I'll try to figure out how to add a mdio node.

Over the weekend I was trying enable DSA driver, but did not see DSA
under network. I'm using LEDE source with kernel 4.9. Nor did I see it
when I tried 'make kernel_menuconfig'

Thanks again.

On Wed, Mar 15, 2017 at 3:49 PM, Florian Fainelli
<florian.fainelli-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
> On 03/15/2017 12:34 PM, Vivek Unune wrote:
>> Andrew,
>>
>> I'm not entirely sure. But here is what I observed.
>>
>> Boot loader sets up both the switches. And I can use all 8 ports of the
>> router when I boot Lede. Only the internal swich is detected and
>> configurable via swconfig tool
>> Internal switch is connected to CPU via port 5 same as Netgear R8000.
>> The other bit here is that I looked through the GPL source and gpio pin
>> 10 is labeled as EA9500_RST2LANSW_GPIO10_PIN/ResetSwitch. So when I
>> performed a robo reset of the pin and 5 (labeled 1 thru 5 on the unit)
>> of the 8 physical ports stopped working (no packets).
>>
>> If the external switch were to be connect via dedicated ethernet
>> interface it should have shown up during the probe. Is in't it?
>
> Not necessarily, and probably not with LEDE which would treat the
> external 53125 as a dumb switch and not even see it. With a mainline
> kernel and the B53 DSA driver you would be able to represent both
> switches in Device Tree and describe how they are cascading from each other.
>
> The potential Device Tree changes could look like this (based on your
> explanation, but I am not sure) for your platform, assuming the 53125 is
> actually exposing the front panel ports and that we did introduce a
> "mdio" node which would be required to expose the external BCM53125 switch.
>
>
> /* There is no MDIO node, there should be one */
> &mdio {
>         status = "okay";
>
>         switch@30 {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 reset-gpios = <&gpio 10>;
>                 reset-names = "robo_reset";
>
>                 ports {
>                         #address-cells = <1>;
>                         #size-cells = <0>;
>
>                         port@0 {
>                                 reg = <0>;
>                                 label = "lan1";
>                         };
>
>                         port@1 {
>                                 reg = <1>;
>                                 label = "lan2";
>                         };
>
>                         port@2 {
>                                 reg = <2>;
>                                 label = "lan3";
>                         };
>
>                         port@3 {
>                                 reg = <3>;
>                                 label = "lan1";
>                         };
>
>                         port@4 {
>                                 reg = <4>;
>                                 label = "wan";
>                         };
>
>                        port@5 {
>                                 reg = <5>;
>                                 label = "cpu";
>                                 ethernet = <&sw0port8>;
>                                 fixed-link {
>                                         speed = <1000>;
>                                         full-duplex;
>                                 };
>                         };
>                 };
>         };
> };
>
> &srab {
>         status = "okay";
>
>         ports {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
>                 port@5 {
>                         reg = <5>;
>                         label = "cpu";
>                         ethernet = <&gmac0>;
>                         fixed-link {
>                                 speed = <1000>;
>                                 full-duplex;
>                         };
>                 };
>
>                 sw0port8: port@8 {
>                         reg = <8>;
>                         label = "extswitch";
>
>                         fixed-link {
>                                 speed = <1000>;
>                                 full-duplex;
>                         };
>                 };
>         };
> };
>
>>
>> Thanks,
>>
>> Vivek
>>
>>
>> On Wed, Mar 15, 2017 at 2:52 PM Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org
>> <mailto:andrew-g2DYL2Zd6BY@public.gmane.org>> wrote:
>>
>>     Hi Vivek
>>
>>     > - It has two switches in order to support 8 lan ports. Internal
>>     switch is
>>     >   BCM53012. The external switch BCM53125 currently works as "dumb
>>     switch"
>>
>>     Do you know how the second switch is connected? Is it cascaded off the
>>     internal switch? Or does it have a dedicated Ethernet interface?
>>
>>     Thanks
>>             Andrew
>>
>
>
> --
> Florian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
