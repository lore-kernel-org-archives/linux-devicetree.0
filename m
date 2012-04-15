From: Dong Aisheng <dongas86@gmail.com>
Subject: Re: [PATCH 3/3] ARM: imx6q: switch to use pinctrl driver
Date: Sun, 15 Apr 2012 12:03:16 +0800
Message-ID: <CAA+hA=QhSUZg0bWTss_4ROwZ--OOQfcP=mpt+MP7-ZKPkEwXyA@mail.gmail.com>
References: <1334333915-1174-1-git-send-email-b29396@freescale.com>
	<1334333915-1174-3-git-send-email-b29396@freescale.com>
	<20120414135331.GB3852@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120414135331.GB3852@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Dong Aisheng <b29396@freescale.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linus.walleij@stericsson.com, swarren@wwwdotorg.org, shawn.guo@freescale.com, kernel@pengutronix.de, grant.likely@secretlab.ca, rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

On Sat, Apr 14, 2012 at 9:53 PM, Sascha Hauer <s.hauer@pengutronix.de> =
wrote:
> On Sat, Apr 14, 2012 at 12:18:35AM +0800, Dong Aisheng wrote:
>> From: Dong Aisheng <dong.aisheng@linaro.org>
>>
>> ---
>> This patch is used for test the new pinctrl driver.
>
> Then please test it with i.MX35, i.MX5...
>
>>
>> + =A0 =A0 imx_data->p =3D pinctrl_get_select_default(&pdev->dev);
>> + =A0 =A0 if (IS_ERR(imx_data->p)) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 err =3D PTR_ERR(imx_data->p);
>> + =A0 =A0 =A0 =A0 =A0 =A0 goto pin_err;
>> + =A0 =A0 }
>> +
>
> ... which will fail here.
Sorry, it will not work, it's not a formal patch.
I just sent it quickly for users to try on imx6q.
=46or MX3 and MX5, before their pinctrl driver are available, user may
need to define a dummy in dt to avoid such an error.

Regards
Dong Aisheng
