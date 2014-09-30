From: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v7 1/3] mfd: devicetree: bindings: Add Qualcomm RPM DT binding
Date: Tue, 30 Sep 2014 11:02:53 -0500
Message-ID: <2FC56515-E6AF-4A4D-9B04-70B4A8B2C4C7@codeaurora.org>
References: <1411428329-23172-1-git-send-email-bjorn.andersson@sonymobile.com> <1411428329-23172-2-git-send-email-bjorn.andersson@sonymobile.com> <334C6A04-9607-4E97-A7A7-2FEED5986E57@codeaurora.org> <20140930152838.GN28481@sonymobile.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140930152838.GN28481-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <Bjorn.Andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Josh Cartwright <joshc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Sep 30, 2014, at 10:28 AM, Bjorn Andersson <Bjorn.Andersson@sonymobi=
le.com> wrote:

> On Wed 24 Sep 09:39 PDT 2014, Kumar Gala wrote:
>=20
>>=20
>> On Sep 22, 2014, at 6:25 PM, Bjorn Andersson <Bjorn.Andersson@sonymo=
bile.com> wrote:
>>=20
>=20
> [..]
>=20
>>> diff --git a/Documentation/devicetree/bindings/mfd/qcom-rpm.txt b/D=
ocumentation/devicetree/bindings/mfd/qcom-rpm.txt
>=20
> [..]
>=20
>>> +- qcom,ipc:
>>> +     Usage: required
>>> +     Value type: <prop-encoded-array>
>>> +
>>> +     Definition: three entries specifying the outgoing ipc bit use=
d for
>>> +                 signaling the RPM:
>>> +                 - phandle to a syscon node representing the apcs =
registers
>>> +                 - u32 representing offset to the register within =
the syscon
>>> +                 - u32 representing the ipc bit within the registe=
r
>>> +
>>=20
>> Does this really ever differ for the SoCs, and even if it does why d=
o we need
>> to encode it in DT.  Can=92t we determine it via the compatible sett=
ing?
>>=20
>=20
> The two offsets could be hard coded, especially based on the compatib=
le.
>=20
> But I don't know if it's worth respinning this just to get those two =
number out
> of here. Also this is now "symmetric" with the smd use cases, where i=
t
> shouldn't be hard coded.

I do think its worth respinning until the DT is agreed to as we shouldn=
=92t be changing the binding.

I=92m not sure how being =91symmetric=92 with the smd use case maters i=
f we are treating this RPM support vs RPM-SMD as two different things.

- k
--=20
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, host=
ed by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
