From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/6 v2] ARM: integrator: check PL010 device name rather
 than base address
Date: Mon, 3 Sep 2012 21:51:21 +0200
Message-ID: <CACRpkdYUFSSMfcPqDLnaLeiYPF4Jc23BKSbjf0Fc=TnDmjE37Q@mail.gmail.com>
References: <1346471760-23993-1-git-send-email-linus.walleij@linaro.org>
 <1346471760-23993-2-git-send-email-linus.walleij@linaro.org>
 <201209011832.47805.arnd@arndb.de>
 <CACRpkdYMjJFHscO1BztOFBRMf+YZo+jO5pCrEiGeeeU_Oh_rfw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACRpkdYMjJFHscO1BztOFBRMf+YZo+jO5pCrEiGeeeU_Oh_rfw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 3, 2012 at 9:40 PM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Sat, Sep 1, 2012 at 8:32 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:

>> On Saturday 01 September 2012, Linus Walleij wrote:
>>> -       if (dev == &uart0_device) {
>>> +       if (!strcmp(dev_name(&dev->dev), "uart0")) {
>>>                 rts_mask = 1 << 4;
>>>                 dtr_mask = 1 << 5;
>>>         } else {
>>
>> Maybe it's possible to compare the base pointer against INTEGRATOR_UART0_BASE instead?
>
> Nope, that is an ioremapped() base, I have no clue what it may be.

But hey I have the struct amba_device there, so the mem resource is there
indeed :-) I'll fix!

Yours,
Linus Walleij
