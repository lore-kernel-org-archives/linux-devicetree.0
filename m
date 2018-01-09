From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH 3/4] bcm2835-gpio-exp: Driver for GPIO expander via
 mailbox service
Date: Tue, 9 Jan 2018 21:15:48 +0100 (CET)
Message-ID: <1723770444.122196.1515528948685@email.1und1.de>
References: <cover.1514898134.git.baruch@tkos.co.il>
 <bcac00c71b29c359b59053a30d817a8f17d6731d.1514898134.git.baruch@tkos.co.il>
 <2013811470.181895.1514918984637@email.1und1.de>
 <20180109134135.32i6slkhmqsjnmne@tarshish>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20180109134135.32i6slkhmqsjnmne@tarshish>
Sender: linux-gpio-owner@vger.kernel.org
To: Baruch Siach <baruch@tkos.co.il>
Cc: Linus Walleij <linus.walleij@linaro.org>, Eric Anholt <eric@anholt.net>, Dave Stevenson <dave.stevenson@raspberrypi.org>, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, phil@raspberrypi.org
List-Id: devicetree@vger.kernel.org

Hi Baruch,

> Baruch Siach <baruch@tkos.co.il> hat am 9. Januar 2018 um 14:41 geschrieben:
> 
> 
> Hi Stefan,
> 
> On Tue, Jan 02, 2018 at 07:49:44PM +0100, Stefan Wahren wrote:
> 
> [...]
> 
> > > +	ret = rpi_firmware_property(gpio->fw, RPI_FIRMWARE_GET_GPIO_CONFIG,
> > > +				    &get, sizeof(get));
> > > +	if (ret) {
> > > +		dev_err(gpio->dev,
> > > +			"Failed to get GPIO %u config (%d)\n", off, ret);
> > > +		return ret;
> > > +	}
> > 
> > Shouldn't we also check the in-bound status at get.gpio?
> 
> What is the in-bound status value? May you refer me to the documentation?

unfortunately this mailbox property isn't documented here [1]. So please refer to Phil's explanation [2].

I assume gpio_get_config.gpio of the response would be 0x80000000 in case of an invalid request. But i didn't test it yet.

This was my solution [3] for the RPI_FIRMWARE_GET_CUSTOMER_OTP. But it hadn't been reviewed yet.

Stefan

[1] - https://github.com/raspberrypi/firmware/wiki/Mailbox-property-interface
[2] - http://lists.infradead.org/pipermail/linux-rpi-kernel/2018-January/007237.html
[3] - https://github.com/lategoodbye/rpi-zero/blob/bcm2835-otp/drivers/nvmem/raspberrypi-otp.c#L61

> 
> > And in all the other gpio ops?
> 
> Thanks,
> baruch
> 
> -- 
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
