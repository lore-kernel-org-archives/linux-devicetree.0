From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH v2 10/16] of: Add vendor prefix for MIPS Technologies, Inc.
Date: Mon, 22 Sep 2014 14:01:03 -0500
Message-ID: <1E0E7540-B04F-4E89-91F7-B6FAC3C5D889@codeaurora.org>
References: <1409938218-9026-1-git-send-email-abrestic@chromium.org> <1409938218-9026-11-git-send-email-abrestic@chromium.org> <CAL_JsqKGG3ei9=Od74VSL9Sm_=+vsW4U+WBgXmCEtK3iTDfJ0g@mail.gmail.com> <CAL1qeaGgBpkuGyxu_P9BNdHjncLA1pfPc-yE98UBj9Ot1koLrA@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL1qeaGgBpkuGyxu_P9BNdHjncLA1pfPc-yE98UBj9Ot1koLrA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>
Cc: Rob Herring <robherring2@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Jeffrey Deans <jeffrey.deans@imgtec.com>, Markos Chandras <markos.chandras@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Arnd Bergmann <arnd@arndb.de>, John Crispin <blogic@openwrt.org>, David Daney <ddaney.cavm@gmail.com>, Linux-MIPS <linux-mips@linux-mips.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


On Sep 22, 2014, at 11:28 AM, Andrew Bresticker <abrestic@chromium.org>=
 wrote:

> On Mon, Sep 22, 2014 at 7:23 AM, Rob Herring <robherring2@gmail.com> =
wrote:
>> On Fri, Sep 5, 2014 at 12:30 PM, Andrew Bresticker
>> <abrestic@chromium.org> wrote:
>>> Add the vendor prefix "mti" for MIPS Technologies, Inc.
>>>=20
>>> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
>>> ---
>>> New for v2.
>>> ---
>>> Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>>> 1 file changed, 1 insertion(+)
>>>=20
>>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt =
b/Documentation/devicetree/bindings/vendor-prefixes.txt
>>> index ac7269f..efa5a5b 100644
>>> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
>>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
>>> @@ -86,6 +86,7 @@ microchip     Microchip Technology Inc.
>>> mosaixtech     Mosaix Technologies, Inc.
>>> moxa   Moxa
>>> mpl    MPL AG
>>> +mti    MIPS Technologies, Inc.
>>=20
>> Why not mips as that is more common and the stock ticker.
>=20
> "mti" is already in use, see
> Documentation/devicetree/bindings/mips/cpu_irq.txt,
> arch/mips/mti-sead3/sead3.dts, and arch/mips/ralink/dts/*.dtsi.

Isn=92t mips already used as well:

arch/mips/lantiq/dts/danube.dtsi:			compatible =3D "mips,mips24Kc";
arch/mips/ralink/dts/mt7620a.dtsi:			compatible =3D "mips,mips24KEc";
arch/mips/ralink/dts/rt2880.dtsi:			compatible =3D "mips,mips4KEc";
arch/mips/ralink/dts/rt3050.dtsi:			compatible =3D "mips,mips24KEc";
arch/mips/ralink/dts/rt3883.dtsi:

- k

--=20
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, host=
ed by The Linux Foundation
