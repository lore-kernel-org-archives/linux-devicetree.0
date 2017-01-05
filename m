From: Felipe Balbi <balbi@kernel.org>
Subject: RE: [RFC PATCH] usb: dwc3: add support for OTG driver compilation
Date: Thu, 05 Jan 2017 11:20:30 +0200
Message-ID: <87bmvlx3q9.fsf@linux.intel.com>
References: <1483536181-22356-1-git-send-email-mnarani@xilinx.com>
 <1483536181-22356-2-git-send-email-mnarani@xilinx.com>
 <87r34jvtn5.fsf@linux.intel.com>
 <B2EF86ADE403CA4A85AF1BE1D3A22A06DB2CED@XAP-PVEXMBX01.xlnx.xilinx.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4773194940350808528=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <B2EF86ADE403CA4A85AF1BE1D3A22A06DB2CED@XAP-PVEXMBX01.xlnx.xilinx.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Manish Narani <manish.narani@xilinx.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "michal.simek@xilinx.com" <michal.simek@xilinx.com>, Soren Brinkmann <sorenb@xilinx.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "mathias.nyman@intel.com" <mathias.nyman@intel.com>, "agraf@suse.de" <agraf@suse.de>, Bharat Kumar Gogada <bharatku@xilinx.com>, Punnaiah Choudary Kalluri <punnaia@xilinx.com>, "dhdang@apm.com" <dhdang@apm.com>, "marc.zyngier@arm.com" <marc.zyngier@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org
Cc: Anurag Kumar Vulisha <anuragku@xilinx.com>, Anirudha Sarangi <anirudh@xilinx.com>
List-Id: devicetree@vger.kernel.org

--===============4773194940350808528==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Manish Narani <manish.narani@xilinx.com> writes:
> Hi Felipe,
>
>
>> From: Felipe Balbi [mailto:balbi@kernel.org]
>> Sent: Wednesday, January 04, 2017 7:01 PM
>> Hi,
>>
>> Manish Narani <manish.narani@xilinx.com> writes:
>> > This patch adds support for OTG driver compilation and object file
>> > creation
>> >
>> > Signed-off-by: Manish Narani <mnarani@xilinx.com>
>> > ---
>> >  drivers/usb/dwc3/Makefile | 4 ++++
>> >  1 file changed, 4 insertions(+)
>> >
>> > diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
>> > index ffca340..2d269ad 100644
>> > --- a/drivers/usb/dwc3/Makefile
>> > +++ b/drivers/usb/dwc3/Makefile
>> > @@ -17,6 +17,10 @@ ifneq ($(filter y,$(CONFIG_USB_DWC3_GADGET)
>> $(CONFIG_USB_DWC3_DUAL_ROLE)),)
>> >     dwc3-y                          +=3D gadget.o ep0.o
>> >  endif
>> >
>> > +ifneq ($(CONFIG_USB_DWC3_DUAL_ROLE),)
>> > +   dwc3-y                          +=3D otg.o
>> > +endif
>>
>> you just broke compilation
>
> Should I add new USB_DWC3_OTG macro in Kconfig?

No, no. Reset your tree to this commit and try to compile it. Problem
should be clear.

> This email and any attachments are intended for the sole use of the
> named recipient(s) and contain(s) confidential information that may be
> proprietary, privileged or copyrighted under applicable law. If you
> are not the intended recipient, do not read, copy, or forward this
> email message or any attachments. Delete this email message and any
> attachments immediately.

you should make sure these notes aren't sent to public mailing
lists. I'll delete this email of yours and stop reading them until this
is sorted out.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlhuD94ACgkQzL64meEa
mQa5fRAAnIh8an1sX7UGFAn4Ql8Y3T8JBxU1RDJavS/O4UE33BN8Oog43cvBAz3z
tqYjVH0CW6aHgd9K0Ic8qSraTL0drlNny3LV+kqmhzsTHBohxHt22wEZVJEpIAbH
1Dr/cWxP3lXTQYjR1E7zbn2c2kStr5vUI8kC5yPIYEWUfsrxsi9nb5mPJ7xdQ7S2
dgJDKtGO0xM4NZvU065ohpjnP0WD/otSzFOjL+v6gbF4uS0ptVwxtySkg9jveSeb
3lqy4UQx3KQ2gPZU5n1FG1zPbadjBHZNLPG2btEE0dVI3vAbm0hYgciys4HZNuxV
NuRNxTebfMTyF/wQoHeb/VrwkdNnXVcTGmN+M4IKA4PcJkJDE7F0MyvKFvisSd6L
zzQrhGT80qcRz5qt7JNWaklMMPcQbTrSgIgbfBYE7CwQx1HV/xDwHxbQz2aMhdBq
ssyodeCwolLwDKsts45qPtXea0IBj4bQZAY+l4HJcHqY5K2hs38ESjGmNe5G7F2Z
6fs5azIH9pY4lg6tcIptQ28VVkl6kN13e5uZHLXkP2ROzkqNQSn5SulhvIsqHWaL
7bvXekJiNbu3G7Ah78Xd9ftu3on9RQKoiFXnYYIEfdAgYBR94giAHTe67mTuZ/2y
SFHfD5ux/eRZsSyLNJbPaGG/DibW0u4XV6ibaSnh+6uECoeR6Og=
=h9IE
-----END PGP SIGNATURE-----
--=-=-=--


--===============4773194940350808528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4773194940350808528==--
