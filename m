From: Chen Gang <xili_gchen_5257@hotmail.com>
Subject: Re: [PATCH] of: Kconfig: Let OF_UNITTEST depend on "I2C=y" and "I2C_MUX=y"
Date: Fri, 6 Mar 2015 03:51:02 +0800
Message-ID: <BLU436-SMTP181EA7D6B551632E6D2199DB91F0@phx.gbl>
References: <BLU437-SMTP82811F6F904D6C74EE62E3B91E0@phx.gbl>	<CAMuHMdXPONxoNm+stn5sx579kzWo6auVP7hrRv26VSGySr7K2A@mail.gmail.com>	<2530315.qdy5ZZGCEr@wuerfel> <CAMuHMdUg=X9siUKLzqAwPUn-WeKeirGy+XN4aSRFV7eX7WV1=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUg=X9siUKLzqAwPUn-WeKeirGy+XN4aSRFV7eX7WV1=A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 3/5/15 16:06, Geert Uytterhoeven wrote:
> On Wed, Mar 4, 2015 at 8:49 PM, Arnd Bergmann <arnd@arndb.de> wrote:
>> --- a/drivers/of/unittest.c
>> +++ b/drivers/of/unittest.c
>> @@ -979,7 +979,7 @@ static int of_path_platform_device_exists(const char *path)
>>         return pdev != NULL;
>>  }
>>
>> -#if IS_ENABLED(CONFIG_I2C)
>> +#if IS_BUILTIN(CONFIG_I2C)
> 
> Wondering: is there any advantage in using "#if IS_BUILTIN(CONFIG_XXX)"
> instead of "#ifdef CONFIG_XXX"?
> 

For me, "#if IS_BUILTIN(CONFIG_XXX)" is better than "#ifdef CONFIG_XXX":

 - "#if IS_BUILTIN(CONFIG_XXX)" is only for CONFIG_XXX=y, and its name
   is also obvious.

 - "#ifdef CONFIG_XXX" may be for others, e.g. CONFIG_DEFCONFIG_LIST:

   .config:13:CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
   include/generated/autoconf.h:1174:#define CONFIG_DEFCONFIG_LIST "/lib/modules/$UNAME_RELEASE/.config"


And this time, arnd's patch is OK to me.

Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed
