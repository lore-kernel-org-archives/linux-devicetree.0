From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/7] ARM: u300: push down syscon registers
Date: Fri, 3 May 2013 10:01:59 +0200
Message-ID: <CACRpkdZHRQqd277Qv8O0dek_jYb=eewhpLYfKtip-YLYx_ukUA@mail.gmail.com>
References: <1367511416-4312-1-git-send-email-linus.walleij@stericsson.com>
 <201305021821.12008.arnd@arndb.de>
 <CACRpkdayJCm-PcY_=+NDraEPn0m6BrjNRH+tYp3Abar43RamaA@mail.gmail.com>
 <201305021939.48381.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201305021939.48381.arnd-r2nGTMty4D4@public.gmane.org>
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
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 2, 2013 at 7:39 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Thursday 02 May 2013, Linus Walleij wrote:
>> > How do those drivers get to the SYSCON base address? Should they
>> > be using drivers/mfd/syscon.c as the multiplexor instead?
>>
>> No, there is no mutex to be taken. The consecutive range of memory
>> addresses are used by different things (mainly the clocks) but there
>> is no register that needs to be protected against access from two
>> subsystems simultaneously.
>>
>> As a follow-up to this series I plan to move also the U300 clocks
>> to the device tree (similar three-step ladder as used for the Nomadik)
>> and then they will (hopefully) get the syscon base address from the
>> device tree.
>
> I was less worried about mutexes than a correct representation
> in the device tree. With the syscon driver, you can have the
> register ranges described exactly once and just use the offsets
> on the regmap in the other drivers.

Hm. This sounds a bit like modeling the Linux subsystems after
the needs of the device tree rather than keeping these two as
separate concepts.

It is true however that the same register base will appear twice:
once for the clk driver, and once for the syscon, which is not
yet in the device tree.

The system controllers on several systems typically share this
aspect.

For the DBx500 PRCMU we have solved the case where the pinctrl
is using a few registers inside the PRCMU range like this:

pinctrl {
        compatible = "stericsson,nmk-pinctrl";
        prcm = <&prcmu>;
};

prcmu: prcmu@80157000 {
        compatible = "stericsson,db8500-prcmu";
        reg = <0x80157000 0x2000>, <0x801b0000 0x8000>, <0x801b8000 0x1000>;
        reg-names = "prcmu", "prcmu-tcpm", "prcmu-tcdm";
        (...)
};

Then in the code:

if (np) {
        prcm_np = of_parse_phandle(np, "prcm", 0);
        if (prcm_np)
                npct->prcm_base = of_iomap(prcm_np, 0);
}

I could do something similar by creating a U300 syscon node
and referring to it from the clk node, so the clk looks up its
syscon to find the base.

If so, I can build this on top of the current patch series
with multiplatform and all, as I convert the clocks to DT
(which is the next and final step).

Yours,
Linus Walleij
