From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH 2/2] usb: phy: msm: fix connect/disconnect bug for dragonboard OTG port
Date: Fri, 20 Nov 2015 18:58:59 -0600
Message-ID: <87mvu8b224.fsf@saruman.tx.rr.com>
References: <1447202811-3429-1-git-send-email-tim.bird@sonymobile.com> <1447202811-3429-2-git-send-email-tim.bird@sonymobile.com> <20151111031445.GA8826@shlinux2> <56437F50.6050006@sonymobile.com> <20151112091349.GA3402@shlinux2> <877flhn9mh.fsf@saruman.tx.rr.com> <564FA087.5050807@sonymobile.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-="; micalg=pgp-sha1;
	protocol="application/pgp-signature"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <564FA087.5050807@sonymobile.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Tim Bird <tim.bird@sonymobile.com>, Peter Chen <peter.chen@freescale.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, =?utf-8?Q?And?= =?utf-8?Q?ersson=2C_Bj=C3=B6rn?= <Bjorn.Andersson@sonymobile.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tbird20d@gmail.com" <tbird20d@gmail.com>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Tim Bird <tim.bird@sonymobile.com> writes:
> On 11/16/2015 09:21 AM, Felipe Balbi wrote:
>>=20
>> Hi,
>>=20
>> Peter Chen <peter.chen@freescale.com> writes:
>>> On Wed, Nov 11, 2015 at 09:48:00AM -0800, Tim Bird wrote:
>>>>
>>>>
>>>> On 11/10/2015 07:14 PM, Peter Chen wrote:
>>>>> On Tue, Nov 10, 2015 at 04:46:51PM -0800, Tim Bird wrote:
>>>>>> This fixes a bug where if you disconnect and re-connect the USB cabl=
e,
>>>>>> the gadget driver stops working.
>>>>>>
>>>>>> Add support for async_irq to wake up driver from low power mode.
>>>>>> Without this, the power management code never calls resume.
>>>>>> Also, have the phy driver kick the gadget driver (chipidea otg)
>>>>>> by having the chipidea driver register with it, for vbus connect
>>>>>> notifications.
>>>>>>
>>>>>> Signed-off-by: Tim Bird <tim.bird@sonymobile.com>
>>>>>> ---
>>>>>>  drivers/usb/chipidea/udc.c    |  6 ++++++
>>>>>>  drivers/usb/phy/phy-msm-usb.c | 16 ++++++++++++++++
>>>>>>  include/linux/usb/msm_hsusb.h |  1 +
>>>>>>  3 files changed, 23 insertions(+)
>>=20
>> I just wanna know how you guys want this to be handled ? Through my tree
>> or chipidea's ? Or do we break the dependencies between the changes ?
>
> I'm fine with splitting it up.  I'm sending a new series with 3 patches
> right after this message.  Do both trees go to linux-next?

I have my fixes and next branches both on next. Not sure about chipidea.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWT8HUAAoJEIaOsuA1yqREYLAP/0u5vOv+bc3lkOlI8AGooPA/
17TdDcn+kFyHNGoL6yL9UVKLVE3fYlosnEH53seI5HKfj1vqEVLtZ2ycdSFRIq3N
vJCcQOP6l9fv5SIx6Nt6BdZrhiSSdgXJpvZLY26QChDErWgClJfQw9xf+AXq0EhU
gv1tjbfNC6TNSIyzL83WYl9/SOgzHO/cos2uXSP4zE9edapsXk3OFaNM0/D3vvZ5
mfyMxLdFVQ2SxRuCajKJraGHpGJmaPR1yXXBcj1fwaVVtKeNM+iaoo7cGRs111px
OEn6UVF6wSIYLCpwc27TgLNbog+8AYbIWcXkMvJ/PcJJoV8k/5UCr1thFcNqKdjR
29SW/wmspGUYuCOqW2kf1NNuN0snc1DowCrKGS+Jc3uY6wzirgmz9dTpEgYA+Xwd
uFpSxgQ9qr7nRojvLH69ghPuS+uwK5PMrEoYuuLvL3ffuoJePJivgYqN74NbyjMl
UaooYPwYhOSpQVWpDzdkQ2fqAZdFra6rt+zzvRgGAqex8/HsIOaoZcgPL/YdD7W6
h/YII6fgsfEJIBAYnxZ3Mwd1gXRIYI93VZB+q7vPSFzdwHQPPXw+JKdxGddsQqwk
HEdbd9M+irOK3kAEYXp25Qx1nHMMAdfMYeyR4rrWxrzr2CrQcWZ2g5+IZh1qr3cn
kS7hH2IM6hhbU8TWEFtX
=FKrP
-----END PGP SIGNATURE-----
--=-=-=--
