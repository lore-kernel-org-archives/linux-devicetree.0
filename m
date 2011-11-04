From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: USB support for device tree
Date: Fri, 4 Nov 2011 14:12:06 -0400
Message-ID: <CACxGe6sYkCSnFvybGcjrkh4cNvtjS=t6fr456be4KFDc3Gre2w@mail.gmail.com>
References: <4EB3A165.8060300@codeaurora.org> <CACxGe6vMCHdB+J8hX1EPW3m35UaKC-FAZULUA4G11J0FUK6tNQ@mail.gmail.com>
 <4EB424DD.4090609@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4EB424DD.4090609-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pavan Kondeti <pkondeti-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 4, 2011 at 1:46 PM, Pavan Kondeti <pkondeti-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>=
 wrote:
> On 11/4/2011 10:15 PM, Grant Likely wrote:
>> The host controller node names as "usb@<adddr>" as you have here is
>> exactly right. =A0The driver doesn't care and will only look at the
>> compatible list. =A0OTG controllers can also use "usb@" as the prefi=
x.
>>
>> Controllers that are only in device mode should probably be called
>> something like "usb-gadget@<addr>" or similar, because "usb@" is use=
d
>> for host controllers.
>>
>
> In our case OTG, gadget and host controllers are part of a single cor=
e
> i.e they all share the same register address space.
>
> If I use usb@addr for OTG controller, then host and OTG device node
> names becomes same. Is that okay? Can two devices have the same devic=
e
> node name in device tree source file?

It is not legal for two device nodes to have overlapping 'reg' regions
(unless one is a child of the other), so by extension it is not okay
for two nodes to have the same 'name@addr'.  However, it is perfectly
acceptable and encouraged for two nodes at different addresses to
start with the same value for 'name@'.  This is called the generic
names recommended practice, and it can also be found in the ePAPR
documentation on node names.

If you want to have both host and device drivers bound to a single
device for OTG mode, then you should use a wrapper driver in Linux
that binds to the single node and instantiates each of the interfaces
as a child device.  For an example take a look at
drivers/usb/host/fsl-mph-dr-of.c.

>
>> The label names (hsusb*-host, hsusb*-device) are completely irreleva=
nt
>> since Linux never sees them. =A0Use whatever you want for the label
>> names.
>>
> Is it a good practice to give label names? I thought, it improves a b=
it
> readability of device tree source file.

Yes, label names are important; the kernel just never sees them so I
don't care much.

g.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
