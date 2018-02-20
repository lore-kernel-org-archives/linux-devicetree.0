From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 11/15] gpio: rcar: Add R-Car M3-N compatible string
Date: Tue, 20 Feb 2018 14:40:50 +0100
Message-ID: <CAMuHMdWRLdXAUCRo_i14zt+aX=UM9_DJNbJgAwbF=q8+=8vkOQ@mail.gmail.com>
References: <1518515162-23663-1-git-send-email-jacopo+renesas@jmondi.org>
 <1518515162-23663-12-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdXW-7+6_iSPk3oUo-fWsMxqvSawuy2QZ3VTYhoeN8kB4w@mail.gmail.com>
 <20180220133532.GE7203@w540>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180220133532.GE7203@w540>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: jacopo mondi <jacopo@jmondi.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Jacopo Mondi <jacopo+renesas@jmondi.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Jacopo,

On Tue, Feb 20, 2018 at 2:35 PM, jacopo mondi <jacopo@jmondi.org> wrote:
> On Wed, Feb 14, 2018 at 03:05:05PM +0100, Geert Uytterhoeven wrote:
>> On Tue, Feb 13, 2018 at 10:45 AM, Jacopo Mondi
>> <jacopo+renesas@jmondi.org> wrote:
>> > Add compatible string for R-Car M3-N (r8a77965) in gpio-rcar.
>> >
>> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>>
>> > --- a/drivers/gpio/gpio-rcar.c
>> > +++ b/drivers/gpio/gpio-rcar.c
>> > @@ -360,6 +360,10 @@ static const struct of_device_id gpio_rcar_of_table[] = {
>> >                 /* Gen3 GPIO is identical to Gen2. */
>> >                 .data = &gpio_rcar_info_gen2,
>> >         }, {
>> > +               .compatible = "renesas,gpio-r8a77965",
>> > +               /* Gen3 GPIO is identical to Gen2. */
>> > +               .data = &gpio_rcar_info_gen2,
>> > +       }, {
>>
>> This part is not needed, as the driver already matches agains the generic
>> "renesas,rcar-gen3-gpio".
>
> Just to point out that the compatible string is there for M3-W and H3.
> Anyway, if that's not good practice to add per-SoC strings here, I'll
> drop this bit.

That's correct. Initially, we added the H3 string first, and the M3-W later.
After that we learned about new future Gen3 members, and we started using
the family-specific one.

Note that we cannot drop the strings for H3 and M3-W from the driver, as
old DTBs do not have the family-specific strings.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
