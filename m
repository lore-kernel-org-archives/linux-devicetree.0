From: Phil Reid <preid@electromag.com.au>
Subject: Re: [PATCH V2] iio: magnetometer: mag3110: add optional vdd/vddio
 regulator operation support
Date: Mon, 10 Dec 2018 16:19:14 +0800
Message-ID: <71e3e6b1-0821-aff9-df58-7f4425c3c75a@electromag.com.au>
References: <1544425869-8188-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544425869-8188-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-AU
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, "jic23@kernel.org" <jic23@kernel.org>, "knaack.h@gmx.de" <knaack.h@gmx.de>, "lars@metafoo.de" <lars@metafoo.de>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "festevam@gmail.com" <festevam@gmail.com>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

G'day Anson,

On 10/12/2018 3:17 PM, Anson Huang wrote:
> The magnetometer's power supply could be controlled by regulator
> on some platforms, such as i.MX6Q-SABRESD board, the mag3110's
> power supply is controlled by a GPIO fixed regulator, need to make
> sure the regulator is enabled before any communication with mag3110,
> this patch adds optional vdd/vddio regulator operation support.
> 

[snip]

> +
> +	data->vdd_reg = devm_regulator_get_optional(&client->dev, "vdd");
> +	if (!IS_ERR(data->vdd_reg)) {
> +		ret = regulator_enable(data->vdd_reg);
> +		if (ret) {
> +			dev_err(&client->dev, "failed to enable VDD regulator\n");
> +			return ret;
> +		}
> +	} else if (data->vdd_reg == ERR_PTR(-EPROBE_DEFER)) {
> +		return -EPROBE_DEFER;
> +	}
> +
IANAE, but normally the return pattern for devm_regulator_get_optional

if (!IS_ERR(reg)) {
     regulator_enable ...
} else {
     ret = PTR_ERR(reg);
     if (ret != -ENODEV)
         return ret;
}



-- 
Regards
Phil
