From: Sergio Prado <sergio.prado-1e4yhPs3/ABSwrhanM7KvQ@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: imx6: Add dts for Embest MarS Board
Date: Wed, 13 Apr 2016 17:58:03 -0300
Message-ID: <570EB2DB.20707@e-labworks.com>
References: <1460420743-30883-1-git-send-email-sergio.prado@e-labworks.com>
 <CAOMZO5D80VWGad7Lz+Crp8on5xLJzHDXL88FBh7x8d4Mc2XKww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOMZO5D80VWGad7Lz+Crp8on5xLJzHDXL88FBh7x8d4Mc2XKww-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Fabio,

On 11-04-2016 22:04, Fabio Estevam wrote:
> Hi Sergio,
>
> On Mon, Apr 11, 2016 at 9:25 PM, Sergio Prado
> <sergio.prado-1e4yhPs3/ABSwrhanM7KvQ@public.gmane.org> wrote:
>> Embest MarS Board [1] is a multi-core platform based on Freescale i.MX6
>> Cortex-A9 Dual Core, running up to 1GHz with 1 GB of RAM, 4GB of eMMC
>> and with a 4MB SPI flash.
>>
>> [1] http://www.embest-tech.com/shop/star/marsboard.html
>>
>> Signed-off-by: Sergio Prado <sergio.prado-1e4yhPs3/ABSwrhanM7KvQ@public.gmane.org>
>
> Can't the Mars board re-use arch/arm/boot/dts/imx6dl-riotboard.dts ?
>

Although the boards are similar, there are a lot of differences:

Marsboard -> imx6dual, no sound, sst25vf016b spi flash, 1 external 
sd/mmc interface (sdhc2) and one eMMC (sdhc3), different PMUX config for 
no sdhc3, no pmic, i2c1, i2c2 and i2c3 externally available, no ssi 
interface.

Riotboard -> imx6solo, sound (sgtl5000), no spi flash, 2 external sd/mmc 
interface (sdhc2 and sdhc3) and one eMMC (sdhc4), pmic (pfuze100), i2c1, 
i2c2 and i2c4 externally available, ssi interface.

We could certainly create a dtsi file to be shared between them, but I 
do not know if it is worth the effort.

What do you think?

Best regards,

Sergio Prado
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
