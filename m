From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: rpi-b-rev2 can't detect hdmi display due to wrong hpd gpio pull
 in dts
Date: Mon, 4 Mar 2019 21:15:42 +0100 (CET)
Message-ID: <1194402400.301453.1551730542978@email.ionos.de>
References: <20190304185454.18043-1-helen.koike@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190304185454.18043-1-helen.koike@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Helen Koike <helen.koike@collabora.com>
Cc: linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, lkundrak@v3.sk, bcm-kernel-feedback-list@broadcom.com, eric@anholt.net, devicetree@vger.kernel.org, kernel@collabora.com
List-Id: devicetree@vger.kernel.org

Hi Helen,

> Helen Koike <helen.koike@collabora.com> hat am 4. März 2019 um 19:54 geschrieben:
> 
> 
> Hello,
> 
> I have a rpi-b-rev2 (two holes, 512M) and when I was trying to test vc4
> driver, the HDMI wans't being detected.
> 
> So I changed the hpd-gpios from ACTIVE_LOW to ACTIVE_HIGH and now it
> works correctly. I can see that modeprint from libdrm detects correctly
> when the display is plugged and when it is unpluggled.
> 
> So I was wondering if this is just in my board or if there is an error
> in the dts (which I think it's unlikely).
> 
> In any case I am dropping this email here in case anyone else see this
> problem, if you do, try appliying the patch below.

thanks for your report and the patch. I verified your change against dt-blob.dts / downstream file and it's correct.

I'm sorry but i cannot apply your patch because it doesn't have the proper format.

Should i take care of this?
Can i add your Signed-off-by including your mail address?

Stefan

> 
> Regards,
> Helen
> 
> ---
>  arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts b/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts
> index 5641d162dfdb..28e7513ce617 100644
> --- a/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts
> +++ b/arch/arm/boot/dts/bcm2835-rpi-b-rev2.dts
> @@ -93,7 +93,7 @@
>  };
>  
>  &hdmi {
> -	hpd-gpios = <&gpio 46 GPIO_ACTIVE_LOW>;
> +	hpd-gpios = <&gpio 46 GPIO_ACTIVE_HIGH>;
>  };
>  
>  &pwm {
> -- 
> 2.20.1
>
