From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v3 0/8] ARM: sunxi: Add Reduced Serial Bus support
Date: Thu, 20 Aug 2015 09:59:27 +0800
Message-ID: <CAGb2v66X-CMQiS1dNqhwamTsVbnf+7siSTV3xGwn-C91Zhw3uA@mail.gmail.com>
References: <1439958009-14056-1-git-send-email-wens@csie.org> <20150819163232.GS10748@sirena.org.uk>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBGPJ2SXAKGQE45JCKUA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20150819163232.GS10748-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, Meng Zhang <kevin.z.m.zh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 20, 2015 at 12:32 AM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Wed, Aug 19, 2015 at 12:20:01PM +0800, Chen-Yu Tsai wrote:
>> Hi everyone,
>>
>> This is my third attempt at adding support for Allwinner's Reduced
>> Serial Bus (RSB), which is used to communicate with PMICs and other
>> peripherals on their newer SoCs, such as the A23/A33/A80.
>
> This is flagged as something that is specific to the Allwinner SoCs.
> Why add generic regmap support rather than just implement the regmap
> reg_read() and reg_write() in a regmap in the controller driver?  Are
> there expected to be other controller drivers from other vendors?

I don't expect there to be any other controller drivers. And it seems
at least some of the devices are dual interface (I2C/RSB). Though I
don't see how its connected to the generic regmap support. Regmap
is for device drivers connected to the RSB bus, not the bus controller
itself.

That said, there are a few RSB mfd slave devices that need support,
those being the later AXP series PMICs, and AC100/AC200 audio-codec/RTC
chips. The current axp20x driver already uses i2c regmaps.

I could throw all the RSB-related stuff together, presumably under
drivers/soc/sunxi/rsb, though that doesn't help the fact that common
regmap code would be  better than scattering regmap_* in various mfd
drivers.


Regards
ChenYu
