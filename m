From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH 5/6] ARM: integrator: convert AMBA devices to device tree
Date: Mon, 20 Aug 2012 10:02:10 +0200
Message-ID: <20120820080210.GF7439@game.jcrosoft.org>
References: <1345119373-22774-1-git-send-email-linus.walleij@linaro.org>
 <20120816124002.GB7439@game.jcrosoft.org>
 <CACRpkdZDMxk30YTkrumRveR3OuWptSpzNevrAvC2FxYShOZp-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZDMxk30YTkrumRveR3OuWptSpzNevrAvC2FxYShOZp-A@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Russell King <linux@arm.linux.org.uk>, devicetree-discuss@lists.ozlabs.org, arm@kernel.org, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 00:42 Sun 19 Aug     , Linus Walleij wrote:
> On Thu, Aug 16, 2012 at 2:40 PM, Jean-Christophe PLAGNIOL-VILLARD
> <plagnioj@jcrosoft.com> wrote:
> > On 14:16 Thu 16 Aug     , Linus Walleij wrote:
> >> +/* For the Device Tree, add in the UART callbacks as AUXDATA */
> >> +static struct of_dev_auxdata ap_auxdata_lookup[] __initdata = {
> >> +     OF_DEV_AUXDATA("arm,primecell", INTEGRATOR_RTC_BASE,
> >> +             "rtc", NULL),
> >> +     OF_DEV_AUXDATA("arm,primecell", INTEGRATOR_UART0_BASE,
> >> +             "uart0", &integrator_uart_data),
> >> +     OF_DEV_AUXDATA("arm,primecell", INTEGRATOR_UART1_BASE,
> >> +             "uart1", &integrator_uart_data),
> >> +     OF_DEV_AUXDATA("arm,primecell", KMI0_BASE,
> >> +             "kmi0", NULL),
> >> +     OF_DEV_AUXDATA("arm,primecell", KMI1_BASE,
> >> +             "kmi1", NULL),
> >> +     { /* sentinel */ },
> 
> > why that?
> 
> Based on similar code by Grant in arch/arm/mach-versatile/core.c
> also ending with a {}. Also at other places ... I though this terminated
> the list iteration, is it not needed anymore?
no I mean why
> >> +     OF_DEV_AUXDATA("arm,primecell", INTEGRATOR_RTC_BASE,
> >> +             "rtc", NULL),
> >> +     OF_DEV_AUXDATA("arm,primecell", KMI0_BASE,
> >> +             "kmi0", NULL),
> >> +     OF_DEV_AUXDATA("arm,primecell", KMI1_BASE,
> >> +             "kmi1", NULL),

no platform data why do you use the AUXDATA?

as the OF_DEV_AUXDATA is deprecated now

Bset Regards,
J.
