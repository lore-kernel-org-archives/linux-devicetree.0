From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v7 1/2] ohci-platform: Add support for
 devicetree instantiation
Date: Tue, 21 Jan 2014 18:10:07 +0100
Message-ID: <52DEA9EF.2090509@redhat.com>
References: <1389813883-567-1-git-send-email-hdegoede@redhat.com> <1389813883-567-2-git-send-email-hdegoede@redhat.com> <52DEB57C.8080700@cogentembedded.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDL4X2GMZUKRB5XI7KLAKGQEKX5J7NY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <52DEB57C.8080700-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 01/21/2014 06:59 PM, Sergei Shtylyov wrote:
> Hello.
>
> On 01/15/2014 10:24 PM, Hans de Goede wrote:
>
>> Add support for ohci-platform instantiation from devicetree, including
>> optionally getting clks and a phy from devicetree, and enabling / disabl=
ing
>> those on power_on / off.
>
>> This should allow using ohci-platform from devicetree in various cases.
>> Specifically after this commit it can be used for the ohci controller fo=
und
>> on Allwinner sunxi SoCs.
>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> Acked-by: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
> [...]
>
>    Have only found time to fully read the patches just now...
>
>> diff --git a/Documentation/devicetree/bindings/usb/usb-ohci.txt b/Docume=
ntation/devicetree/bindings/usb/usb-ohci.txt
>> new file mode 100644
>> index 0000000..f9d6c73
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/usb-ohci.txt
>> @@ -0,0 +1,22 @@
>> +USB OHCI controllers
>> +
>> +Required properties:
>> +- compatible : "usb-ohci"
>> +- reg : ohci controller register range (address and length)
>> +- interrupts : ohci controller interrupt
>> +
>> +Optional properties:
>> +- clocks : a list of phandle + clock specifier pairs
>> +- phys : phandle + phy specifier pair
>> +- phy-names : "usb"
>> +
>> +Example:
>> +
>> +    ohci0: ohci@0x01c14400 {
>
>     Two minor nits: there should be no "0x" in the address part of the no=
de name. And according to ePAPR [1], "the name of a node should be somewhat=
 generic, reflecting the function of the device and not its precise program=
ming model. If appropriate, the name should be one of the following choices=
:
> [...]
> - usb".
>
>     Same comments for "usb-ehci" binding.

You're right on both accounts, I'll do a v8 tomorrow, including a re-spin o=
f the
big-endian patches.

Regards,

Hans

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/groups/opt_out.
