From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2 0/6] ARM64: meson: GXBaby (S905) and Vega S95 enablement
Date: Wed, 23 Mar 2016 11:10:06 -0700
Message-ID: <7hoaa5qd4x.fsf@baylibre.com>
References: <1456886101-22967-1-git-send-email-afaerber@suse.de>
	<CAOi56cXFEUZuu0bJknUYNhfR2jL=LYUTbpnX9diZw2B5JfTaEQ@mail.gmail.com>
	<56F1AB26.8050200@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56F1AB26.8050200@suse.de> ("Andreas =?utf-8?Q?F=C3=A4rber=22?=
 =?utf-8?Q?'s?= message of "Tue,
	22 Mar 2016 21:29:26 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Cc: linux-meson <linux-meson@googlegroups.com>, Carlo Caione <carlo@caione.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Matthias Brugger <mbrugger@suse.com>, Nicolas Saenz <nicolassaenzj@gmail.com>, =?utf-8?Q?Andr=C3=A9?= Przywara <andre.przywara@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, devicetree <devicetree@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, LKML <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Andreas F=C3=A4rber <afaerber@suse.de> writes:

> Am 21.03.2016 um 23:36 schrieb Kevin Hilman:
>> On Tue, Mar 1, 2016 at 6:34 PM, Andreas F=C3=A4rber <afaerber@suse.d=
e> wrote:
>>=20
>>> Note: On the Vega S95 I need to change TEXT_OFFSET as follows,
>>> in order to avoid the vendor U-Boot overwriting itself (fwiu);
>>> for the Mini Mx that's reportedly not necessary.
>>=20
>> FYI, the Amlogic P200 dev board also needs this hack with the factor=
y u-boot.
>
> I have meanwhile found that
>
> mkimage -A arm64 -O linux -T kernel -C none -a 0x1080000 -e 0x1080000=
 \
> -n linux-next -d arch/arm64/boot/Image ../uImage
>
> and then using bootm instead of booti works even without the above ha=
ck
> on the Vega S95. Not a satisfactory solution yet, but better than
> patching the kernel in a distro-incompatible way.

Thanks for sharing.  I can confirm this is working for me too.

Kevin
