From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 05/14] ARM: at91: add pinctrl support
Date: Mon, 27 Aug 2012 16:46:45 -0700
Message-ID: <CACRpkdYWXZLNdgMhqoMZsaaszZ5Uz9pZ1EO=mrnuY5Der4O+Mw@mail.gmail.com>
References: <20120810124820.GA20557@game.jcrosoft.org>
 <1344603731-32667-1-git-send-email-plagnioj@jcrosoft.com>
 <1344603731-32667-5-git-send-email-plagnioj@jcrosoft.com>
 <CACRpkdZ2__V06Eo8JH451Sup5Nw2jJXVOH2FOfZBp5nNYpCtbg@mail.gmail.com>
 <5034FC18.2090400@wwwdotorg.org>
 <CACQ1gAieByr5vMmyyCuGtS8AgnnRZPPhLZY8sKvwvcQYe5ieUA@mail.gmail.com>
 <50366D2B.4010807@wwwdotorg.org>
 <20120825083811.GB7629@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120825083811.GB7629-RQcB7r2h9QmfDR2tN2SG5Ni2O/JbrIOy@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Aug 25, 2012 at 1:38 AM, Jean-Christophe PLAGNIOL-VILLARD
<plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org> wrote:
> On 11:49 Thu 23 Aug     , Stephen Warren wrote:
>> On 08/23/2012 01:06 AM, Richard Genoud wrote:

>> > Let's take the PioA - peripheral B: 0xffe0399f
>> > From the documentation table 4-3, we can extract the column PIO
>> > Periperal B for all signals PA0-PA31:
>> ...
>> > Each time it's possible to mux a pin to the peripheral B function (ie
>> > when there's no "-----") the corresponding bit is set:
>> ...
>> > => this gives 0x399f
>>
>> Ah OK. It would be a good idea to briefly describe this process in the
>> binding document I think. I assume this property exists to avoid the
>> kernel driver having to contain tables for each Atmel device; the driver
>> is generic.
> Yeap I did this exactly for this
>
> I do not want to maintain such code for the whole bunch of at91
> and this way I add other SoC with just via dtsi without touching c code
>
> I think other driver should do so too

I'm following it now I think, after some discussion here at the kernel summit
I have come to the conclusion that the real problem with readability comes
from a shortcoming in the device tree compiler, that it cannot handle
macros and defines (no preprocessor) so it's currently hard to make
it more readable.

But that's not the implementers fault so I'm OK with this looking like
this for the moment.

Yours,
Linus Walleij
