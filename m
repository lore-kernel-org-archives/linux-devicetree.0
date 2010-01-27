From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 08/11] powerpc/mpc5121: add USB host support
Date: Wed, 27 Jan 2010 09:52:27 -0700
Message-ID: <fa686aa41001270852s57e0fa64l3c7067cf211a1d1f@mail.gmail.com>
References: <1263932653-3634-1-git-send-email-agust@denx.de>
	<1263932653-3634-9-git-send-email-agust@denx.de> <fa686aa41001210943i3739f693uecf0c05ef0a81c1@mail.gmail.com>
	<20100125180024.1a850578@wker>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100125180024.1a850578@wker>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Cc: linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, dzu-ynQEQJNshbs@public.gmane.org, wd-ynQEQJNshbs@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 25, 2010 at 10:00 AM, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org> wr=
ote:
> On Thu, 21 Jan 2010 10:43:34 -0700
> Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
>
>> > diff --git a/Documentation/powerpc/dts-bindings/fsl/usb.txt b/Docu=
mentation/powerpc/dts-bindings/fsl/usb.txt
>> > index b001524..9050154 100644
>> > --- a/Documentation/powerpc/dts-bindings/fsl/usb.txt
>> > +++ b/Documentation/powerpc/dts-bindings/fsl/usb.txt
>> > @@ -33,6 +33,14 @@ Recommended properties :
>> > =A0- interrupt-parent : the phandle for the interrupt controller t=
hat
>> > =A0 =A0services interrupts for this device.
>> >
>> > +Optional properties :
>>
>> > + - big-endian-regs : boolean; if defined, indicates the USB host
>> > + =A0 controller registers format is big endian.
>>
>> Rather than testing for this explicitly, add fsl,mpc5121-usb2-dr to
>> the match table and use the .data pointer for setting device specifi=
c
>> quirks.

Still, don't use a new property to describe this.  The regs being
big-endian is all wrapped up in the definition of what
fsl,mpc5121-usb2-dr means.  You should also drop fsl-usb2-dr from the
compatible list in the .dts file since this device is *not* compatible
with it due to the endian difference.  Test for fsl,mpc5121-usb2-dr
explicitly, and adapt the driver behaviour accordingly.

g.

--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
