From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/2] drivercore: Fix unregistration path of platform devices
Date: Wed, 10 Jun 2015 20:12:14 +0300
Message-ID: <B19CEA07-E9B2-4DEA-9FC5-C441F0B4804C@konsulko.com>
References: <1433686811-12303-1-git-send-email-grant.likely@linaro.org> <1433686811-12303-3-git-send-email-grant.likely@linaro.org> <CAPybu_30jTDuwEW_WTGuu6pWwv86p6OqV0eRE1GbCwUVtBm7KA@mail.gmail.com> <20150608184713.446B7C406AA@trevor.secretlab.ca> <CAPybu_0FfD9dv55SLmy7905yMCV6Kqrr-v2aPUCx6sSikrF7gQ@mail.gmail.com> <20150609110044.61031C40580@trevor.secretlab.ca> <CAMAWPa_CURGm5YTc0OgBD_T3fwaBDskfUKEn+awxW8P6oQYceA@mail.gmail.com> <CAPybu_24X0zZJv6D9i4YM_r7azdnjYrRH=V+p_ong2cFKNrF1w@mail.gmail.com> <CAMAWPa-bGwVCnmv=H=8Zo-NCw-nOFBj3-XcVvb-0m0sNYtPO7g@mail.gmail.com> <CAPybu_2dpcpjPvn-kXaW-yC2OmkNPna+G8PLO-gP1cMBOcU_ew@mail.gmail.com> <20150610154031.GB22214@kroah.com> <CACxGe6ti6Kpski-Q3nv8kAHB4mr=pkQwco4WPJeaUFD1HNjaeg@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6ti6Kpski-Q3nv8kAHB4mr=pkQwco4WPJeaUFD1HNjaeg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Grant,

> On Jun 10, 2015, at 20:11 , Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wr=
ote:
>=20
> On Wed, Jun 10, 2015 at 4:40 PM, Greg Kroah-Hartman
> <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> wrote:
>> On Wed, Jun 10, 2015 at 04:46:33PM +0200, Ricardo Ribalda Delgado wr=
ote:
>>> Hello Greg
>>>=20
>>> On Wed, Jun 10, 2015 at 4:38 PM, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> =
wrote:
>>>> On Wed, Jun 10, 2015 at 12:11 AM, Ricardo Ribalda Delgado
>>>=20
>>>> At this stage of the cycle (merge window opening soon, maintainers
>>>> trying to stabilize their stuff for Linus) we want to see linux-ne=
xt
>>>> approaching some level of stability.
>>>=20
>>> Please revert
>>>=20
>>> base/platform: Only insert MEM and IO resources
>>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/co=
mmit/?id=3D36d4b29260753ad78b1ce4363145332c02519adc
>>> base/platform: Continue on insert_resource() error
>>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/co=
mmit/?id=3De50e69d1ac4232af0b6890f16929bf5ceee81538
>>> of/platform: Use platform_device interface
>>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/co=
mmit/?id=3Db6d2233f2916fa9338786aeab2e936c5a07e4d0c
>>> base/platform: Remove code duplication
>>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/co=
mmit/?id=3D6d9d4b1469b0d9748145e168fc9ec585e1f3f4b0
>>=20
>> Now reverted.
>>=20
>>> This patch from Grant needs to be applied:
>>>=20
>>> [PATCH 2/2] drivercore: Fix unregistration path of platform devices
>>=20
>> I need some acks before I apply anything else as this is a total mes=
s.
>=20
> Yes please. Rob, Pantelis, Wolfram. Can you test my patch and provide=
s acks?
>=20

Will do.

> g.

Regards

=E2=80=94 Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
