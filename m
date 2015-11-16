From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH 2/2] usb: phy: msm: fix connect/disconnect bug for dragonboard OTG port
Date: Mon, 16 Nov 2015 11:21:10 -0600
Message-ID: <877flhn9mh.fsf@saruman.tx.rr.com>
References: <1447202811-3429-1-git-send-email-tim.bird@sonymobile.com> <1447202811-3429-2-git-send-email-tim.bird@sonymobile.com> <20151111031445.GA8826@shlinux2> <56437F50.6050006@sonymobile.com> <20151112091349.GA3402@shlinux2>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg=pgp-sha1;
	protocol="application/pgp-signature"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20151112091349.GA3402@shlinux2>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Peter Chen <peter.chen@freescale.com>, Tim Bird <tim.bird@sonymobile.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, =?utf-8?Q?Bj?= =?utf-8?Q?=C3=B6rn?= Andersson <bjorn.andersson@sonymobile.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tbird20d@gmail.com" <tbird20d@gmail.com>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Peter Chen <peter.chen@freescale.com> writes:
> On Wed, Nov 11, 2015 at 09:48:00AM -0800, Tim Bird wrote:
>>=20
>>=20
>> On 11/10/2015 07:14 PM, Peter Chen wrote:
>> > On Tue, Nov 10, 2015 at 04:46:51PM -0800, Tim Bird wrote:
>> >> This fixes a bug where if you disconnect and re-connect the USB cable,
>> >> the gadget driver stops working.
>> >>
>> >> Add support for async_irq to wake up driver from low power mode.
>> >> Without this, the power management code never calls resume.
>> >> Also, have the phy driver kick the gadget driver (chipidea otg)
>> >> by having the chipidea driver register with it, for vbus connect
>> >> notifications.
>> >>
>> >> Signed-off-by: Tim Bird <tim.bird@sonymobile.com>
>> >> ---
>> >>  drivers/usb/chipidea/udc.c    |  6 ++++++
>> >>  drivers/usb/phy/phy-msm-usb.c | 16 ++++++++++++++++
>> >>  include/linux/usb/msm_hsusb.h |  1 +
>> >>  3 files changed, 23 insertions(+)

I just wanna know how you guys want this to be handled ? Through my tree
or chipidea's ? Or do we break the dependencies between the changes ?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWShCHAAoJEIaOsuA1yqREn/MP/jnjJ1I9vKBXqhoxgqc4Lws2
opSmKqNNfS9lDCQA64BOzfGDvnt6hQ/PIDDMnlaqDboYzdJjq+H6aa/o6E04TnE0
XcTht60OKfPQTCCeE0wVVP/r50XyFYPIhdEKsP020gMtqT+41OW7ndcMN9Q+/AZ1
TJSEV5xA3/qmgyGk58qxw2JpSsjEFgp5CWRjGVrprDOmEfBzprW99wWikE+/DZft
bO4ZPjd4M7VkhP5+T+pI0HeIDBLkvmDfX2jk7tHHDnq4lzUvWMgNyDYi5+IrnJ/9
U7blx+gLQf/9ZmWzb5AYw8BJA7XmEXCQc4yYl5fomvLCb40MWo3FiaZkfrbEpAit
0yJ5LV0KlSC5Lyt/V50YrcEVmOmGrjnKaFVFEkrUsVgcZh2mAda3nIKwBfqXLNNO
/mMixP+SZtqNzOow3MNJRwefGuiYy5/LcXjgjheFXSAGIBc+wJh2le95DSINs58u
rVC67iSMGAg4fhK2YA2zd6occd5airhLFGjPxpr6AvdRXzMDB6sH4+Rtq05ZLqns
RX1+oU1hlc/Y+LJ6O8+tTZdnf6a/buO4hmakTLteeoNz5eeb/6REidnqkrLmxQQ8
b7TVKDSpml9JM/TSEZNtlbmzScSY/kla0fCebMbIPmnxfQ6ZZfYFz5xgD4Qk5vg6
GlpKLWAKaeSm/EFf93Vv
=VaL7
-----END PGP SIGNATURE-----
--=-=-=--
