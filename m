From: Chris Ball <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
Subject: Re: linux-next: manual merge of the arm-soc tree with the
 i2c-embedded tree
Date: Mon, 16 Jul 2012 16:04:25 -0400
Message-ID: <874np7jwvq.fsf@octavius.laptop.org>
References: <20120710164130.f38e4d1673f925ddb13914c9@canb.auug.org.au>
 <20120712131231.GH2194@pengutronix.de>
 <CACRpkdboeF_G=sTPeSyuZ6KGLCmGSKx_NS=6Rim6HkR2f9=AAQ@mail.gmail.com>
 <20120716101706.GB17435@pengutronix.de>
 <CACRpkdY626iYATorphAvg7cQxD2ufysBvXdt3Z644zEuW0wS=w@mail.gmail.com>
 <20120716123550.GE17435@pengutronix.de>
 <CACRpkdaMB-n7XYcxE8QtAm-WrGc2DR0krfTjQZCbvOL1HYep1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACRpkdaMB-n7XYcxE8QtAm-WrGc2DR0krfTjQZCbvOL1HYep1Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
 (Linus Walleij's message of "Mon, 16 Jul 2012 21:45:29 +0200")
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, Alessandro Rubini <rubini-kaDoWcXyVrEAvxtiuMwx3w@public.gmane.org>, Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Deepak Saxena <dsaxena-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On Mon, Jul 16 2012, Linus Walleij wrote:
>> Uhm, I seem to have missed that bindings are deemed more "flexible" as
>> long as they are coupled to in-kernel dts files? Is that discussed
>> somewhere? I do wonder about it...
>
> Well patches like this are sent out but not commented on from
> the perspective of binding stability. So of course, they get merged.
>
> Have a look at this commit:
>
> commit 7f217794ffa72f208a250b79ab0b7ea3de19677f
> Author: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Date:   Sun May 13 00:14:24 2012 -0400
>
>     mmc: dt: Consolidate DT bindings
>
> This is deleting custom properties from DTS files without
> adding any code to fallback-support them on old device trees.

I agree with your point, but just as an FYI: this patch did involve
a conversation about binding stability, and left some attributes
(e.g. ti,non-removable) purposefully alone (and different to the
new generic MMC bindings) to preserve backwards compatibility:

http://article.gmane.org/gmane.linux.kernel.samsung-soc/10409

Thanks,

- Chris.
-- 
Chris Ball   <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>   <http://printf.net/>
One Laptop Per Child
