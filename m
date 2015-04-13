From: "Ivan T. Ivanov" <ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] usb: chipidea: Use extcon framework for VBUS and ID detection
Date: Mon, 13 Apr 2015 10:08:28 +0300
Message-ID: <ECE2E8CC-8833-4D40-A2EE-6DAD8E7683B0@linaro.org>
References: <1428568418-22508-1-git-send-email-ivan.ivanov@linaro.org> <20150413035345.GA1341@shlinux2>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150413035345.GA1341@shlinux2>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


> On Apr 13, 2015, at 6:53 AM, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wr=
ote:
>=20
> On Thu, Apr 09, 2015 at 11:33:38AM +0300, Ivan T. Ivanov wrote:
>> On recent Qualcomm platforms VBUS and ID lines are not routed to
>> USB PHY LINK controller. Use extcon framework to receive connect
>> and disconnect ID and VBUS notification.
>>=20
>>=20

<snip>

>>=20
>> +Optional properties:
>> +- extcon:       phandles to external connector devices. First phand=
le
>> +                should point to external connector, which provide "=
USB"
>> +                cable events, the second should point to external c=
onnector
>> +                device, which provide "USB-HOST" cable events. If o=
ne of
>> +                the external connector devices is not required empt=
y <0>
>> +                phandle should be specified.
>=20
> You mean if id connector is not needed, we write dts like below:
> extcon =3D <&usb_vbus>, <0>;
>=20
> If it is, you may miss ',' between "required" and "empty <0>=E2=80=9D=
=2E

Yes. Will fix it.

>> u32 hw_read_otgsc(struct ci_hdrc *ci, u32 mask)
>> {
>> -	return hw_read(ci, OP_OTGSC, mask);
>> +	u32 val =3D hw_read(ci, OP_OTGSC, mask);
>> +
>> +	if ((mask & OTGSC_BSV) && ci->vbus.conn.edev) {
>=20
> You may use "||" since you can't get vbus and id value from
> cpu register (otgsc).

The idea is to not rely on the register content for these
bits if user have defined these DT bindings.

Will fix rest of the comments and resend.

Thank you,
Ivan--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
