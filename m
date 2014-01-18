From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v7 0/2] ohci and ehci-platform clks, phy and
 dt support
Date: Sat, 18 Jan 2014 17:21:08 +0100
Message-ID: <52DAA9F4.2090601@redhat.com>
References: <Pine.LNX.4.44L0.1401171053180.1162-100000@iolanthe.rowland.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDL4X2GMZUKRB66T5KLAKGQE2T723CQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <Pine.LNX.4.44L0.1401171053180.1162-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Tony Prisk <linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-usb <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 01/17/2014 06:12 PM, Alan Stern wrote:
> On Thu, 16 Jan 2014, Florian Fainelli wrote:
>
>> Le mercredi 15 janvier 2014, 15:26:21 Alan Stern a =EF=BF=BDcrit :
>>> On Wed, 15 Jan 2014, Hans de Goede wrote:
>>>> Hi All,
>>>>
>>>> This version of my ohci and ehci-platform clks, phy and dt support
>>>> patch-set, really fixes the 2 small bugs Alan found.
>>>
>>> All okay -- this time I can't find anything to complain about.  :-)
>>
>> There is one minor issue; which is that the ehci binding claims the driv=
er
>> supports the following optional boolean properties:
>>
>> - big-endian-regs : boolean, set this for hcds with big-endian registers
>> - big-endian-desc : boolean, set this for hcds with big-endian descripto=
rs
>> - big-endian : boolean, for hcds with big-endian-regs + big-endian-desc
>>
>> while it does not (yet) so this is misleading. Can we at get that fixed =
before
>> merging? Copy pasting the PPC ehci driver should do the job.
>
> I agree it needs to be fixed.  This can be done in a follow-up patch,
> though.  It doesn't have to be in this one because nobody is using
> ehci-platform with DT yet.
>
> A simple copy from the PPC driver isn't quite enough, because the
> platform data settings would override the DT values.
> ehci_platform_reset has to be changed so that it sets
> ehci->big_endian_desc and _mmio if the pdata flags are set, but
> otherwise leaves them alone.
>
> Hans, would you like to write another patch to take care of this?

I already took a quick look at this, setting the ehci->big_endian* flags is=
 easy,
the problem is that they won't work unless we also define
CONFIG_USB_EHCI_BIG_ENDIAN_DESC and CONFIG_USB_EHCI_BIG_ENDIAN_MMIO

I would like to avoid doing something like the ugliness we've with
USB_OHCI_HCD_PPC_OF_BE and USB_OHCI_HCD_PPC_OF_LE, which means just selecti=
ng these
2 config options whenever USB_EHCI_HCD_PLATFORM is enabled, but I'm not sur=
e if that
is acceptable.

The same goes for the ohci code btw.

Regards,

Hans

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/groups/opt_out.
