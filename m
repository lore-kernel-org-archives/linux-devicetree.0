From: Andy Duan <fugang.duan-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH 2/7] ARM: dts: imx6ul: update i.MX 6UltraLite iomux
 headers
Date: Mon, 8 Jan 2018 01:37:32 +0000
Message-ID: <AM4PR0401MB2260424162DA2879389BCB63FF130@AM4PR0401MB2260.eurprd04.prod.outlook.com>
References: <20180102164223.15230-1-stefan@agner.ch>
 <20180102164223.15230-2-stefan@agner.ch>
 <20180105164505.uzv7nu3r6awuyxzu@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180105164505.uzv7nu3r6awuyxzu@rob-hp-laptop>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: "shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> Sent: Saturday, January 06, 2018 12:45 =
AM
>To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
>Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org; Fabio Estevam
><fabio.estevam-3arQi8VN3Tc@public.gmane.org>; mark.rutland-5wv7dgnIgG8@public.gmane.org; linux-arm-
>kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-
>kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Andy Duan <fugang.duan-3arQi8VN3Tc@public.gmane.org>
>Subject: Re: [PATCH 2/7] ARM: dts: imx6ul: update i.MX 6UltraLite iomux
>headers
>
>On Tue, Jan 02, 2018 at 05:42:18PM +0100, Stefan Agner wrote:
>> From: Fugang Duan <fugang.duan-3arQi8VN3Tc@public.gmane.org>
>>
>> Update i.MX 6UltraLite IOMUXC pin defines.
>
>That's obvious reading the diff. The commit message should tell me why.
>They were wrong?
>
Yes, the previous iomux header parts of pin setting were wrong, which was g=
enerated by IOMUX tool during SOC bringup.
The updated header correct the wrong pin setting.

>>
>> Signed-off-by: Fugang Duan <fugang.duan-3arQi8VN3Tc@public.gmane.org>
>> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
