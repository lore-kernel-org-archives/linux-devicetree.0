From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: enable pinctrl for Broadcom NS2 SoC
Date: Sat, 30 Apr 2016 10:55:04 -0700
Message-ID: <5724F178.20509@gmail.com>
References: <1461934299-14774-1-git-send-email-yendapally.reddy@broadcom.com>
 <1461934299-14774-3-git-send-email-yendapally.reddy@broadcom.com>
 <CACRpkdbsti48b+G8uHfzJvFPzUD8HivE8Fp57CBp_7eGF5wX5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbsti48b+G8uHfzJvFPzUD8HivE8Fp57CBp_7eGF5wX5Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Pramod Kumar <pramodku@broadcom.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Le 30/04/2016 04:13, Linus Walleij a =C3=A9crit :
> On Fri, Apr 29, 2016 at 2:51 PM, Yendapally Reddy Dhananjaya Reddy
> <yendapally.reddy@broadcom.com> wrote:
>=20
>> This enables the pinctrl support for Broadcom NS2 SoC
>>
>> Signed-off-by: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@b=
roadcom.com>
>> Reviewed-by: Ray Jui <ray.jui@broadcom.com>
>=20
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>=20
> Please take this in through the apropriate BCM tree to ARM SoC.

Applied to devicetree-arm64/next, there was a small conflict due to the
crmu node removal while switching to PSCI, Dhanajay, please double chec=
k
the result here:

https://github.com/Broadcom/stblinux/commit/8eab685dda30fb15e74d6be07ba=
a9d430a75b8ca
--=20
=46lorian
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
