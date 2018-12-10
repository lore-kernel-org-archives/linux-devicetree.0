From: Martin Kepplinger <martink@posteo.de>
Subject: Re: [PATCH V2 2/2] iio: accell: mma8452: add optional vdd/vddio
 regulator operation support
Date: Mon, 10 Dec 2018 15:30:31 +0100
Message-ID: <0412034a-989b-1d57-a356-1fc3e87a0a91@posteo.de>
References: <1544426368-16415-1-git-send-email-Anson.Huang@nxp.com>
 <1544426368-16415-2-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544426368-16415-2-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, "jic23@kernel.org" <jic23@kernel.org>, "knaack.h@gmx.de" <knaack.h@gmx.de>, "lars@metafoo.de" <lars@metafoo.de>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "rtresidd@electromag.com.au" <rtresidd@electromag.com.au>, "gustavo@embeddedor.com" <gustavo@embeddedor.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Leonard Crestez <leonard.crestez@nxp.com>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On 10.12.18 08:25, Anson Huang wrote:
> The accelerometer's power supply could be controlled by regulator
> on some platforms, such as i.MX6Q-SABRESD board, the mma8451's
> power supply is controlled by a GPIO fixed regulator, need to make
> sure the regulator is enabled before any communication with mma8451,
> this patch adds optional vdd/vddio regulator operation support.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Acked-by: Martin Kepplinger <martink@posteo.de>
