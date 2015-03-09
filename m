From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] of: Kconfig: Let OF_UNITTEST depend on "I2C=y" and "I2C_MUX=y"
Date: Mon, 09 Mar 2015 22:28:56 +0100
Message-ID: <9483861.SUlEjqJo9A@wuerfel>
References: <BLU437-SMTP82811F6F904D6C74EE62E3B91E0@phx.gbl> <2530315.qdy5ZZGCEr@wuerfel> <CAMuHMdUg=X9siUKLzqAwPUn-WeKeirGy+XN4aSRFV7eX7WV1=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUg=X9siUKLzqAwPUn-WeKeirGy+XN4aSRFV7eX7WV1=A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chen Gang <xili_gchen_5257@hotmail.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thursday 05 March 2015 09:06:54 Geert Uytterhoeven wrote:
> On Wed, Mar 4, 2015 at 8:49 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> > --- a/drivers/of/unittest.c
> > +++ b/drivers/of/unittest.c
> > @@ -979,7 +979,7 @@ static int of_path_platform_device_exists(const char *path)
> >         return pdev != NULL;
> >  }
> >
> > -#if IS_ENABLED(CONFIG_I2C)
> > +#if IS_BUILTIN(CONFIG_I2C)
> 
> Wondering: is there any advantage in using "#if IS_BUILTIN(CONFIG_XXX)"
> instead of "#ifdef CONFIG_XXX"?

Mostly consistency within the file.

There are also lines like

#if IS_BUILTIN(CONFIG_I2C) && IS_ENABLED(CONFIG_OF_OVERLAY)

which I find more readable than mixing the two styles as in

#if defined(CONFIG_I2C) && IS_ENABLED(CONFIG_OF_OVERLAY)

	Arnd
