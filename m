From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 2/2] uio: add an of_genirq driver
Date: Tue, 16 Jun 2009 06:46:47 -0600
Message-ID: <fa686aa40906160546q73765b66h204334e3ca081de0@mail.gmail.com>
References: <1244765062-14144-1-git-send-email-w.sang@pengutronix.de>
	<1244765062-14144-3-git-send-email-w.sang@pengutronix.de>
	<fa686aa40906140740m43e9dd8am4d242310f681c95c@mail.gmail.com>
	<20090616090435.GA21321@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754689AbZFPMrT@vger.kernel.org>
In-Reply-To: <20090616090435.GA21321@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <w.sang@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, devicetree-discuss@ozlabs.org, "Hans J. Koch" <hjk@linutronix.de>, Magnus Damm <magnus.damm@gmail.com>, linuxppc-dev@ozlabs.org, Greg KH <gregkh@suse.de>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 16, 2009 at 3:04 AM, Wolfram Sang<w.sang@pengutronix.de> wr=
ote:
>
>> > diff --git a/Documentation/powerpc/dts-bindings/uio-generic.txt b/=
Documentation/powerpc/dts-bindings/uio-generic.txt
>> > new file mode 100644
>> > index 0000000..8ad9861
>> > --- /dev/null
>> > +++ b/Documentation/powerpc/dts-bindings/uio-generic.txt
>> > @@ -0,0 +1,16 @@
>> > +UIO for custom devices
>> > +
>> > +A device which will be mapped using the UIO subsystem.
>> > +
>> > +Properties:
>> > + - compatible : should contain the specific model used, followed =
by
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"generic-uio".
>> > + - reg : address range(s) of the device (up to MAX_UIO_MAPS)
>> > + - interrupts : interrupt of the device
>> > +
>> > +Example:
>> > + =A0 =A0 =A0 =A0c64fpga@0 {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0compatible =3D "ptx,c64fpga001", =
"generic-uio";
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0reg =3D <0x0 0x10000>;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0interrupts =3D <0 0 3>;
>> > + =A0 =A0 =A0 =A0};
>>
>> Hmmm, I'm not happy about this. =A0The device tree describes the
>> hardware, not the way Linux uses the hardware. =A0UIO definitely fal=
ls
>> into the category of Linux implementation detail.
>
> Yes, I am aware of that. I just started with the mechanisms which are=
 available
> today and hoped we could find some compatible-value which will suit a=
ll needs.

Trouble is a value that suits all needs today probably won't a year
from now.  :-)

>> This should be approached from the other way around. =A0Either the
>> generic-uio of_platform driver should contain an explicit list of
>> devices to be handled by UIO,
>
> Well, that could lead to a quite huge match_table over time.
>
>> or the OF infrastructure should be modified to allow things like for=
ce
>> binding of_devices to of_drivers at runtime.
>
> That is an interesting idea. I could imagine something like a 'new_co=
mpatible"
> entry in the sysfs-section of the driver similar to 'new_id' for PCI.=
 After
> writing a new compatible-string into it, matching will triggered agai=
n with the
> new entry added. That could (should?) also be placed at the of-core-l=
evel. Or
> did you have something else in mind?

Yeah, that sounds appropriate.

g.

--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
