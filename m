From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH V3] rtc: add support for NXP PCF85363 real-time clock
Date: Sat, 4 Nov 2017 17:08:36 +0100
Message-ID: <20171104160836.bah5su2ld5ckycr3@piout.net>
References: <CAL_Jsq+QQK=NTMBwk=h0uszLW0uSiEd1fmF09USRNFM-2VgiSQ@mail.gmail.com>
 <1509548480-29472-1-git-send-email-eric@nelint.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1509548480-29472-1-git-send-email-eric-SeqgQ6RdavfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Nelson <eric-SeqgQ6RdavfQT0dZR+AlfA@public.gmane.org>
Cc: linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, otavio.salvador-fKevB0iiKLMBZ+LybsDmbA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 01/11/2017 at 08:01:20 -0700, Eric Nelson wrote:
> Note that alarms are not currently implemented.
> 
> 64 bytes of nvmem is supported and exposed in
> sysfs (# is the instance number, starting with 0):
> 
> 	/sys/bus/nvmem/devices/pcf85363-#/nvmem
> 
> Signed-off-by: Eric Nelson <eric-SeqgQ6RdavfQT0dZR+AlfA@public.gmane.org>
> Reviewed-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> ---
> V2 addresses a couple of issues highlighted by Fabio Estevam
>     1. Kconfig updated to select REGMAP_I2C
>     2. Switch to of_device_id from i2c_device_id for driver matching
> 
> V3 adds interrupts as an optional property in device tree bindings
> 
>  drivers/rtc/Kconfig                                |  13 ++
>  drivers/rtc/Makefile                               |   1 +
>  drivers/rtc/rtc-pcf85363.c                         | 221 +++++++++++++++++++++
>  4 files changed, 252 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/pcf85363.txt
>  create mode 100644 drivers/rtc/rtc-pcf85363.c
> 

I've tested it (thanks to Fabio, I received one a few weeks ago)

Applied with the following change:

--- a/drivers/rtc/rtc-pcf85363.c
+++ b/drivers/rtc/rtc-pcf85363.c
@@ -194,7 +194,6 @@ static int pcf85363_probe(struct i2c_client *client,
        pcf85363->nvmem_cfg.reg_write = pcf85363_nvram_write;
        pcf85363->nvmem_cfg.priv = pcf85363;
        pcf85363->rtc->nvmem_config = &pcf85363->nvmem_cfg;
-       pcf85363->rtc->nvram_old_abi = true;
        pcf85363->rtc->ops = &rtc_ops;
 
        return rtc_register_device(pcf85363->rtc);


nvram_old_abi must not be used for new drivers and will generate warning
when the (undocumented) ABI is used anyway.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
