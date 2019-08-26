From: Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH v3 00/15] Improvements and fixes for mxsfb DRM driver
Date: Mon, 26 Aug 2019 19:19:17 +0000
Message-ID: <VI1PR04MB70233374E91F85119FD21FD5EEA10@VI1PR04MB7023.eurprd04.prod.outlook.com>
References: <1566382555-12102-1-git-send-email-robert.chiras@nxp.com>
 <20190826120548.GA14316@bogon.m.sigxcpu.org>
 <3bd35686e046048d35cd4987567a13cf@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>, Robert Chiras <robert.chiras@nxp.com>
Cc: =?iso-8859-1?Q?Guido_G=FCnther?= <agx@sigxcpu.org>, Marek Vasut <marex@denx.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 26.08.2019 17:35, Stefan Agner wrote:=0A=
> On 2019-08-26 14:05, Guido G=FCnther wrote:=0A=
>> Hi,=0A=
>> On Wed, Aug 21, 2019 at 01:15:40PM +0300, Robert Chiras wrote:=0A=
>>> This patch-set improves the use of eLCDIF block on iMX 8 SoCs (like 8MQ=
, 8MM=0A=
>>> and 8QXP). Following, are the new features added and fixes from this=0A=
>>> patch-set:=0A=
>>=0A=
>> I've applied this whole series on top of my NWL work and it looks good=
=0A=
>> with a DSI panel. Applying the whole series also fixes an issue where=0A=
>> after unblank the output was sometimes shifted about half a screen width=
=0A=
>> to the right (which didn't happen with DCSS). So at least from the parts=
=0A=
>> I could test:=0A=
>>=0A=
>>    Tested-by: Guido G=FCnther <agx@sigxcpu.org>=0A=
>>=0A=
>> for the whole thing.=0A=
> =0A=
> Thanks for testing! What SoC did you use? I think it would be good to=0A=
> also give this a try on i.MX 7 or i.MX 6ULL before merging.=0A=
=0A=
I did a quick test on imx6sx-sdb and it seems that [PATCH 07/15] =0A=
"drm/mxsfb: Fix the vblank events" causes a hang on boot, even without a =
=0A=
panel.=0A=
=0A=
If I revert that particular patch it seems to be fine: the new pixel =0A=
formats seem to work in modetest (checked with sii,43wvf1g panel).=0A=
=0A=
--=0A=
Regards,=0A=
Leonard=0A=
