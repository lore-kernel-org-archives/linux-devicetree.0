From: Phil Reid <preid@electromag.com.au>
Subject: Re: [PATCH V4 2/2] iio: light: isl29018: add optional vdd/vdda
 regulator operation support
Date: Tue, 11 Dec 2018 13:02:00 +0800
Message-ID: <312e5c0c-e92f-a337-3730-2fd73c99f48a@electromag.com.au>
References: <1544498291-2716-1-git-send-email-Anson.Huang@nxp.com>
 <1544498291-2716-2-git-send-email-Anson.Huang@nxp.com>
 <d07b5970-5825-2ea6-9e27-538386927923@electromag.com.au>
 <DB3PR0402MB39161ED492C863BB48D48E2FF5A60@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <0b08c0d1-afe2-5ade-9333-2eb7d57d4db6@electromag.com.au>
 <DB3PR0402MB3916588612090716E066D2ABF5A60@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB3PR0402MB3916588612090716E066D2ABF5A60@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Content-Language: en-AU
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, "jic23@kernel.org" <jic23@kernel.org>, "knaack.h@gmx.de" <knaack.h@gmx.de>, "lars@metafoo.de" <lars@metafoo.de>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On 11/12/2018 12:29 pm, Anson Huang wrote:
>> G'day Anson,
>>
>> Just pulled up the datasheet for this chip.
>>
>> The absolute max for Vdda is speced as Vddd ±0.5 With a note that Vdda
>> should be externally shorted to Vddd.
> The data sheet says vdda should be connected to vdd externally, then I think we should just
> use one regulator vdd, then it will be much easier for the driver, what do you think?
> 

Yes I think that makes sense.



-- 
Regards
Phil
