From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 0/6] ARM64: meson: GXBaby (S905) and Vega S95 enablement
Date: Wed, 23 Mar 2016 09:06:23 +0100
Message-ID: <CAOQ7t2aB6X5gS+0RfyB1PjTpJnUFnF95ejXwhYXgxEmXSq0KFQ@mail.gmail.com>
References: <1456886101-22967-1-git-send-email-afaerber@suse.de>
	<CAOi56cXFEUZuu0bJknUYNhfR2jL=LYUTbpnX9diZw2B5JfTaEQ@mail.gmail.com>
	<56F1AB26.8050200@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56F1AB26.8050200-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-meson <linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>, Nicolas Saenz <nicolassaenzj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 22, 2016 at 9:29 PM, Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>=
 wrote:
> Am 21.03.2016 um 23:36 schrieb Kevin Hilman:
>> On Tue, Mar 1, 2016 at 6:34 PM, Andreas F=C3=A4rber <afaerber@suse.d=
e> wrote:
>>
>>> Note: On the Vega S95 I need to change TEXT_OFFSET as follows,
>>> in order to avoid the vendor U-Boot overwriting itself (fwiu);
>>> for the Mini Mx that's reportedly not necessary.
>>
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

I wonder if we can add this kind of information in Documentation/arm/me=
son/.
Probably it could be handy until we have a proper u-boot porting.

--=20
Carlo Caione
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
