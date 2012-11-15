From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 02/14] ARM: SPEAr13xx: DT: Add spics gpio controller nodes
Date: Thu, 15 Nov 2012 19:38:59 +0530
Message-ID: <CAKohpok7-iBCoYk+aAXZPsOODyh6tp2nutC+6wYOot-bK3=wkg@mail.gmail.com>
References: <cover.1352608333.git.viresh.kumar@linaro.org>
 <58a7d91cab20b924784fb5a09e16ca08e6f13318.1352608333.git.viresh.kumar@linaro.org>
 <CACRpkdZkgmLF8TxFCZSubP+g+6_ofZugArKtE9=dYTZfemstrw@mail.gmail.com>
 <CAKohpon=AVGZmR_cwUZ4=buw0kr3JVtXh51BtXteWkJ7E-f_bQ@mail.gmail.com>
 <CACRpkdaJ2kCYfSP=xCRQAG2wDnkMKX9fey+ByhDDiOS==u+XwA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACRpkdaJ2kCYfSP=xCRQAG2wDnkMKX9fey+ByhDDiOS==u+XwA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, Shiraz Hashim <shiraz.hashim-qxv4g6HH51o@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sr-ynQEQJNshbs@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 15 November 2012 19:36, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>>> >         ahb {
>>> > +               spics: spics@e0700000{
>>> > +                       compatible = "st,spear-spics-gpio";
>>> > +                       reg = <0xe0700000 0x1000>;
>>> > +                       st-spics,peripcfg-reg = <0x3b0>;
>>> > +                       st-spics,sw-enable-bit = <12>;
>>> > +                       st-spics,cs-value-bit = <11>;
>>> > +                       st-spics,cs-enable-mask = <3>;
>>> > +                       st-spics,cs-enable-shift = <8>;
>>> > +                       gpio-controller;
>>> > +                       #gpio-cells = <2>;
>>> > +               };
>>> > +
>>>
>>> Are these bindings documented?
>>
>> The main patch waiting for ur comments is 1/14.
>
> I seldom comment on individual DT bindings, I just want
> to know that they're there :-)

Its not that simple. You are required to Ack it, as we have added it in
drivers/pinctrl/spear because we are controlling pins here :)

--
viresh
