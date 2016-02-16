From: Matthew McClintock <mmcclint@codeaurora.org>
Subject: Re: [PATCH v3 1/6] pinctrl: qcom: ipq4019: Add IPQ4019 pinctrl support
Date: Tue, 16 Feb 2016 10:31:15 -0600
Message-ID: <B4F61534-3D9E-4474-81AD-3C048E048846@codeaurora.org>
References: <1447975173-29485-1-git-send-email-mmcclint@qca.qualcomm.com> <1447975173-29485-2-git-send-email-mmcclint@qca.qualcomm.com> <CACRpkdZQTN+X=kWS7-5tzts=AGem2W+Od_ap1oy04Fm5i0y4fg@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZQTN+X=kWS7-5tzts=AGem2W+Od_ap1oy04Fm5i0y4fg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Matthew McClintock <mmcclint@qca.qualcomm.com>, Andy Gross <agross@codeaurora.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Varadarajan Narayanan <varada@codeaurora.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, qca-upstream.external@qca.qualcomm.com, Sricharan R <sricharan@codeaurora.org>, Mathieu Olivari <mathieu@codeaurora.org>
List-Id: devicetree@vger.kernel.org


> On Feb 16, 2016, at 8:54 AM, Linus Walleij <linus.walleij@linaro.org>=
 wrote:
>=20
> On Fri, Nov 20, 2015 at 12:19 AM, Matthew McClintock
> <mmcclint@qca.qualcomm.com> wrote:
>=20
>> From: Varadarajan Narayanan <varada@codeaurora.org>
>>=20
>> Add pinctrl driver support for IPQ4019 platform
>>=20
>> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
>> Signed-off-by: Mathieu Olivari <mathieu@codeaurora.org>
>> Signed-off-by: Varadarajan Narayanan <varada@codeaurora.org>
>> Signed-off-by: Matthew McClintock <mmcclint@codeaurora.org>
>> ---
>>=20
>> v3
>> - update example with actual values from dts
>> - add missing pins 71-99
>> - drop many functions and stick to basic functionality
>=20
> Patch applied with all the ACKs and stuff, and dropped the .owner
> assignment as indicated by Bj=C3=B6rn in the process.

Thanks folks, do plan to add more pinctrl bits once things are validate=
d!

Cheers,
-M--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
