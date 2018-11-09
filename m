From: Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: Add vendor prefix for Smartlabs LLC
Date: Fri, 9 Nov 2018 13:44:01 -0500
Message-ID: <5327F4D2-7348-4D5F-A077-D66D4ACB7553@gmail.com>
References: <1541691207-24768-1-git-send-email-christianshewitt@gmail.com>
 <1541706240-30036-1-git-send-email-christianshewitt@gmail.com>
 <1541706240-30036-2-git-send-email-christianshewitt@gmail.com>
 <ae4a4f99-eecc-7a71-5007-d171449c8619@suse.de>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ae4a4f99-eecc-7a71-5007-d171449c8619@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Jianxin Pan <jianxin.pan@amlogic.com>, Thierry Reding <treding@nvidia.com>, David Lechner <david@lechnology.com>, =?utf-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 9 Nov 2018, at 1:29 pm, Andreas F=C3=A4rber <afaerber@suse.de> wrote:
>=20
>> Smartlabs LLC are a professional integrator of Interactive TV =
solutions
>> and IPTV/VOD devices (https://www.smartlabs.tv/en/about/).
>>=20
>> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
>> ---
>> Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>> 1 file changed, 1 insertion(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt =
b/Documentation/devicetree/bindings/vendor-prefixes.txt
>> index 4b1a2a8..c424fe0 100644
>> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
>> @@ -357,6 +357,7 @@ sirf	SiRF Technology, Inc.
>> sis	Silicon Integrated Systems Corp.
>> sitronix	Sitronix Technology Corporation
>> skyworks	Skyworks Solutions, Inc.
>> +smartlabs	Smartlabs LLC
>=20
> You added the LLC but did not upper-case the L - intentional?

Not intentional. I=E2=80=99ll correct this (and another mention in the =
dts) in v4.

Christian=
