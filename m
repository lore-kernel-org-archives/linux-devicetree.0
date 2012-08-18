From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/6] ARM: integrator: convert AMBA devices to device tree
Date: Sun, 19 Aug 2012 00:42:12 +0200
Message-ID: <CACRpkdZDMxk30YTkrumRveR3OuWptSpzNevrAvC2FxYShOZp-A@mail.gmail.com>
References: <1345119373-22774-1-git-send-email-linus.walleij@linaro.org>
 <20120816124002.GB7439@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120816124002.GB7439-RQcB7r2h9QmfDR2tN2SG5Ni2O/JbrIOy@public.gmane.org>
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
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 16, 2012 at 2:40 PM, Jean-Christophe PLAGNIOL-VILLARD
<plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org> wrote:
> On 14:16 Thu 16 Aug     , Linus Walleij wrote:
>> +/* For the Device Tree, add in the UART callbacks as AUXDATA */
>> +static struct of_dev_auxdata ap_auxdata_lookup[] __initdata = {
>> +     OF_DEV_AUXDATA("arm,primecell", INTEGRATOR_RTC_BASE,
>> +             "rtc", NULL),
>> +     OF_DEV_AUXDATA("arm,primecell", INTEGRATOR_UART0_BASE,
>> +             "uart0", &integrator_uart_data),
>> +     OF_DEV_AUXDATA("arm,primecell", INTEGRATOR_UART1_BASE,
>> +             "uart1", &integrator_uart_data),
>> +     OF_DEV_AUXDATA("arm,primecell", KMI0_BASE,
>> +             "kmi0", NULL),
>> +     OF_DEV_AUXDATA("arm,primecell", KMI1_BASE,
>> +             "kmi1", NULL),
>> +     { /* sentinel */ },

> why that?

Based on similar code by Grant in arch/arm/mach-versatile/core.c
also ending with a {}. Also at other places ... I though this terminated
the list iteration, is it not needed anymore?

Yours,
Linus Walleij
