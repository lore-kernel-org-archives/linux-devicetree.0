From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/6] ARM: integrator: convert AMBA devices to device tree
Date: Thu, 30 Aug 2012 16:30:55 -0700
Message-ID: <CACRpkdYkfgY-dYD1L3_HkhFJL49d9GaSWd8ax2Rqm3BGFFHhdQ@mail.gmail.com>
References: <1345119373-22774-1-git-send-email-linus.walleij@linaro.org>
 <20120816124002.GB7439@game.jcrosoft.org>
 <CACRpkdZDMxk30YTkrumRveR3OuWptSpzNevrAvC2FxYShOZp-A@mail.gmail.com>
 <20120820080210.GF7439@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120820080210.GF7439-RQcB7r2h9QmfDR2tN2SG5Ni2O/JbrIOy@public.gmane.org>
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

On Mon, Aug 20, 2012 at 1:02 AM, Jean-Christophe PLAGNIOL-VILLARD
<plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org> wrote:
> On 00:42 Sun 19 Aug     , Linus Walleij wrote:

> no I mean why
>> >> +     OF_DEV_AUXDATA("arm,primecell", INTEGRATOR_RTC_BASE,
>> >> +             "rtc", NULL),
>> >> +     OF_DEV_AUXDATA("arm,primecell", KMI0_BASE,
>> >> +             "kmi0", NULL),
>> >> +     OF_DEV_AUXDATA("arm,primecell", KMI1_BASE,
>> >> +             "kmi1", NULL),
>
> no platform data why do you use the AUXDATA?
>
> as the OF_DEV_AUXDATA is deprecated now

OK this is to get the right bus names of the devices.

As I support boot from both device tree and without device tree, I cannot
change all the names that e.g. the clock framework is tied to.

Once we switch to pure device tree this can be changed at the user
sites and all auxdata be removed.

Yours,
Linus Walleij
