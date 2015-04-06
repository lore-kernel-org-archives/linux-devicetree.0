From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/3] of: OF_IRQ should depend on IRQ_DOMAIN
Date: Mon, 06 Apr 2015 23:39:31 +0200
Message-ID: <2467778.3jbCGZlsKM@wuerfel>
References: <1428245965-19618-1-git-send-email-geert@linux-m68k.org> <4981781.UvXHorNsu5@wuerfel> <CAMuHMdVa5fe8bo=OA3chwpc3ysn4y4ga_nx2bOdKZErMe_7J0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVa5fe8bo=OA3chwpc3ysn4y4ga_nx2bOdKZErMe_7J0w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Monday 06 April 2015 17:26:57 Geert Uytterhoeven wrote:
> Given drivers/base/platform.c:
> 
> int platform_get_irq(struct platform_device *dev, unsigned int num)
> {
> #ifdef CONFIG_SPARC
>         ...
> #else
>         struct resource *r;
>         if (IS_ENABLED(CONFIG_OF_IRQ) && dev->dev.of_node) {
>                 ...
>         }
>         ...
> #endif
> }
> 
> yes I do want to keep it explicit.
> 

Ok, makes sense, thanks!

	Arnd
