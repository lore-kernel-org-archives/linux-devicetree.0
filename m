From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [RESENT PATCH v7 3/7] arm64: dts: rockchip: Update rt5514 devices' compatible for Gru
Date: Tue, 05 Sep 2017 00:33:47 +0200
Message-ID: <3717071.LIWpZa6hqd@diego>
References: <20170824045227.15504-1-jeffy.chen@rock-chips.com> <1649093.IvC24TsujL@diego> <59A6EF3C.5090308@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <59A6EF3C.5090308-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jeffy <jeffy.chen-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Klaus Goger <klaus.goger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Donnerstag, 31. August 2017, 01:00:44 CEST schrieb jeffy:
> On 08/30/2017 09:30 PM, Heiko Stübner wrote:
> >> >-		compatible = "realtek,rt5514";
> >> >+		compatible = "realtek,rt5514", "realtek,rt5514-i2c";
> > 
> > the rt5514-i2c and -spi compatibles should be documented in the
> > binding-txt
> > of the chip, but I haven't found any mention of this.
> > 
> > 
> > Heiko
> 
> these compatibles are only used for our snd driver to detect rt5514 i2c
> driver and rt5514 spi driver, suggested by Matthias at
> https://patchwork.kernel.org/patch/9904731/
> 
> should i add it in the rockchip,rk3399-gru-sound.txt or rt5514 binding
> document?

You're introducing new bindings for the codec, so they should of course
part of the rt5514 binding.


Heiko

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
