From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: getting allwinner SoC support upstream (was Re: Uploading linux
 (3.9.4-1))
Date: Thu, 6 Jun 2013 11:29:48 +0200
Message-ID: <20130606112948.7cd444a4@skate>
References: <CAPweEDx3mAy40BZrzrKPRbvg7vKMj7KevDQ3m_v4p6Yo50eSGg@mail.gmail.com>
 <CAKON4OyyRF4Z46RyJFDWUwo4L52Z8bgSH0CzDr2gDerw4iDwcw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAKON4OyyRF4Z46RyJFDWUwo4L52Z8bgSH0CzDr2gDerw4iDwcw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, debian-arm-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org, debian-release-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org, Luke Kenneth Casson Leighton <lkcl-fw2G7BUl9JU@public.gmane.org>, Linux on small ARM machines <arm-netbook-Fj0DB6SUpRXNuVmtMlwsDbVCufUGDwFn@public.gmane.org>, ARM Linux Mailing List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, debian-kernel-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

On Wed, 5 Jun 2013 16:48:27 -0400, jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:

> >  fex covers *eeeeeevvveeerryyyythiiiing* - right from flipping the
> > multiplexing for all 3 SD/MMC cards so that you can pretend that SD0
> > is SD2 and you can specify *different* GPIOs for each to say which
> > is
> 
> You can do all of this in device tree too. If the exact syntax doesn't
> exist you can use 'allwinner,' prefixes on the node names.
> Also check out pinctrl so that it doesn't get reinvented.

Are people looking at the mainline source code?

There is already a pinctrl driver for sunxi platforms (i.e Allwinner
SoCs), it's at drivers/pinctrl/pinctrl-sunxi.c, and it's DT-based and
allows to describe the pin muxing in the Device Tree.

Cc'ing Maxime Ripard, who is the mach-sunxi maintainer in the mainline
kernel.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
