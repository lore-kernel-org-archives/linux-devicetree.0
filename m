From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] pinctrl: pinctrl-imx: add support for set bits for
 general purpose registers
Date: Sat, 14 Jul 2012 22:24:16 +0200
Message-ID: <CACRpkdbKOQt=gqydQNRfCOU-TaschHtFq0e_86xgvtHYMnwpKA@mail.gmail.com>
References: <1341565763-10074-1-git-send-email-b29396@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1341565763-10074-1-git-send-email-b29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
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
To: Dong Aisheng <b29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: b20223-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 6, 2012 at 11:09 AM, Dong Aisheng <b29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:

> From: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> The General Purpose Registers (GPR) is used to select operating modes for
> general features in the SoC, usually not related to the IOMUX itself,
> but it does belong to IOMUX controller.
> We simply provide an convient API for driver to call to set the general purpose
> register bits if needed.
>
> Signed-off-by: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

I have an overall objection to this:

I have no idea at all about what's going on, and why this belongs in the pin
control subsystem. On the contrary, from the commit description it seems to
*not* belong in this subsystem at all.

So: exactly what does this register do, and which are the consumers?

Notice: nothing at all stops you from mapping the same address range or
just this register in some other driver. So the same address range being
used is not a reason to have this in this driver, it could very well be
handled by drivers/misc/imx-syscon.c or maybe my postulated
(but non-existent) drivers/syscon/*.

The reason I react against it is that some GPIO drivers already have
custom API:s doing pinctrl stuff, and shunning this kind of stuff into
the pinctrl subsystem might hide it from the real subsystem where it
actually belongs and hinder development of the proper subsystems.

Yours,
Linus Walleij
