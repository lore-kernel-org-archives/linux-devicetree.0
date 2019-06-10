From: Rui Miguel Silva <rmfrfs@gmail.com>
Subject: Re: [PATCH v2 2/3] media: imx7-media-csi: add i.MX6UL support
Date: Mon, 10 Jun 2019 11:32:36 +0100
Message-ID: <m336khpw6z.fsf@gmail.com>
References: <20190606153825.8183-1-sebastien.szymanski@armadeus.com> <20190606153825.8183-2-sebastien.szymanski@armadeus.com> <92ca6e6e-2ebd-cec4-4f75-2674fd2c3d99@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <92ca6e6e-2ebd-cec4-4f75-2674fd2c3d99@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: driverdev-devel@linuxdriverproject.org
Cc: =?utf-8?Q?S=C3=A9bastien?= Szymanski <sebastien.szymanski@armadeus.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>, Steve Longerbeam <slongerbeam@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi Randy,
On Fri 07 Jun 2019 at 00:10, Randy Dunlap wrote:
> On 6/6/19 8:38 AM, S=C3=A9bastien Szymanski wrote:
>> i.MX7 and i.MX6UL/L have the same CSI controller. So add i.MX6UL/L suppo=
rt
>> to imx7-media-csi driver.
>>
>> Signed-off-by: S=C3=A9bastien Szymanski <sebastien.szymanski@armadeus.co=
m>
>> ---
>>
>> Changes for v2:
>>  - rebase on top of linuxtv/master
>>  - mention i.MX6UL/L in header and Kconfig help text
>>  - rename csi_type to csi_soc_id
>>
>>  drivers/staging/media/imx/Kconfig          |  4 +-
>>  drivers/staging/media/imx/imx7-media-csi.c | 62 ++++++++++++++++------
>>  2 files changed, 49 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/i=
mx/Kconfig
>> index ad3d7df6bb3c..8b6dc42c39e0 100644
>> --- a/drivers/staging/media/imx/Kconfig
>> +++ b/drivers/staging/media/imx/Kconfig
>> @@ -22,11 +22,11 @@ config VIDEO_IMX_CSI
>>  	  A video4linux camera sensor interface driver for i.MX5/6.
>>
>>  config VIDEO_IMX7_CSI
>> -	tristate "i.MX7 Camera Sensor Interface driver"
>> +	tristate "i.MX6UL/L / i.MX7 Camera Sensor Interface driver"
>>  	depends on VIDEO_IMX_MEDIA && VIDEO_DEV && I2C
>>  	default y
>
> Hi,
> I realize that this "default y" is not part of this patch set, but we have
> pretty strong guidance that a driver should not default to 'y' unless it =
is
> needed for a system to boot.  If this driver is optional, then please drop
> the 2 occurrences of "default y" in this Kconfig file.

Yeah, even though both depends on imx_media, I agree that they
should not default to y. I will send a patch for this.
Thanks.

---
Cheers,
        Rui


>
> thanks.
>>  	help
>>  	  Enable support for video4linux camera sensor interface driver for
>> -	  i.MX7.
>> +	  i.MX6UL/L or i.MX7.
>>  endmenu
>>  endif
