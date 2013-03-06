From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v6 5/5] ARM: dts: Add FIMD DT binding Documentation
Date: Thu, 07 Mar 2013 08:56:23 +0900
Message-ID: <013901ce1ac6$3533b130$9f9b1390$%kim@samsung.com>
References: <1362044559-7496-1-git-send-email-vikas.sajjan@linaro.org>
 <1362044559-7496-6-git-send-email-vikas.sajjan@linaro.org>
 <5133A068.7060906@gmail.com>
 <CAD025yQA+yAPzATDvE-4HQP+HVbmDQkg+XVKd=VUepL+dM9s9Q@mail.gmail.com>
 <5137B183.6040201@gmail.com> <5137B326.3040404@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <5137B326.3040404@gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
To: 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>, 'Vikas Sajjan' <vikas.sajjan@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, sachin.kamat@linaro.org, t.figa@samsung.com, devicetree-discuss@lists.ozlabs.org, inki.dae@samsung.com, jy0922.shim@samsung.com, 'sunil joshi' <joshi@samsung.com>
List-Id: devicetree@vger.kernel.org

Sylwester Nawrocki wrote:
> 
> On 03/06/2013 10:13 PM, Sylwester Nawrocki wrote:
> > @@ -305,9 +305,9 @@ struct platform_device s5p_device_jpeg = {
> >   #ifdef CONFIG_S5P_DEV_FIMD0
> >   static struct resource s5p_fimd0_resource[] = {
> >          [0] = DEFINE_RES_MEM(S5P_PA_FIMD0, SZ_32K),
> > -       [1] = DEFINE_RES_IRQ(IRQ_FIMD0_VSYNC),
> > -       [2] = DEFINE_RES_IRQ(IRQ_FIMD0_FIFO),
> > -       [3] = DEFINE_RES_IRQ(IRQ_FIMD0_SYSTEM),
> > +       [1] = DEFINE_RES_IRQ_NAMED(IRQ_FIMD0_VSYNC, "vsync"),
> > +       [2] = DEFINE_RES_IRQ(IRQ_FIMD0_FIFO, "fifo"),
> > +       [3] = DEFINE_RES_IRQ(IRQ_FIMD0_SYSTEM, "system"),
> >   };
> 
> Oops, something missing here. Of course should be:
> 
> @@ -160,9 +160,9 @@ struct platform_device samsung_asoc_idma = {
>   #ifdef CONFIG_S3C_DEV_FB
>   static struct resource s3c_fb_resource[] = {
>          [0] = DEFINE_RES_MEM(S3C_PA_FB, SZ_16K),
> -       [1] = DEFINE_RES_IRQ(IRQ_LCD_VSYNC),
> -       [2] = DEFINE_RES_IRQ(IRQ_LCD_FIFO),
> -       [3] = DEFINE_RES_IRQ(IRQ_LCD_SYSTEM),
> +       [1] = DEFINE_RES_IRQ_NAMED(IRQ_LCD_VSYNC, "vsync"),
> +       [2] = DEFINE_RES_IRQ_NAMED(IRQ_LCD_FIFO, "fifo"),
> +       [3] = DEFINE_RES_IRQ_NAMED(IRQ_LCD_SYSTEM, "system"),
   ^^^^^^^

BTW, can you use 'tab' instead of white space at mark '^'

- Kukjin
