From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] kbuild: handle dtb-y and CONFIG_OF_ALL_DTBS natively
 in Makefile.lib
Date: Wed, 8 Nov 2017 11:23:08 -0600
Message-ID: <CAL_Jsq+3oZyz23MeocEZTvh8CbdHJuudcSbWnZbuuM=kLebQEg@mail.gmail.com>
References: <1509859853-27473-1-git-send-email-yamada.masahiro@socionext.com>
 <1509859853-27473-3-git-send-email-yamada.masahiro@socionext.com> <CAK8P3a17uK02gvY=iQhnGq7OooV4JzxLpAV5V5eES3bEutm6aA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK8P3a17uK02gvY=iQhnGq7OooV4JzxLpAV5V5eES3bEutm6aA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, DTML <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kbuild mailing list <linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michal Marek <michal.lkml-yyZNWGI4GtDR7s880joybQ@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, Nov 5, 2017 at 7:49 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Sun, Nov 5, 2017 at 6:30 AM, Masahiro Yamada
> <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org> wrote:
>> If CONFIG_OF_ALL_DTBS is enabled, "make ARCH=arm64 dtbs" compiles each
>> DTB twice; one from arch/arm64/boot/dts/*/Makefile and the other from
>> the dtb-$(CONFIG_OF_ALL_DTBS) line in arch/arm64/boot/dts/Makefile.
>> It could be a race problem when building DTBS in parallel.
>>
>> Another minor issue is CONFIG_OF_ALL_DTBS covers only *.dts in vendor
>> sub-directories, so this broke when Broadcom added one more hierarchy
>> in arch/arm64/boot/dts/broadcom/<soc>/.
>>
>> One idea to fix the issues in a clean way is to move DTB handling
>> to Kbuild core scripts.  Makefile.dtbinst already recognizes dtb-y
>> natively, so it should not hurt to do so.
>>
>> Add $(dtb-y) to extra-y, and $(dtb-) as well if CONFIG_OF_ALL_DTBS is
>> enabled.  All clutter things in Makefiles go away.
>>
>> As a bonus clean-up, I also removed dts-dirs.  Just use subdir-y
>> directly to traverse sub-directories.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
>
> Nice, that's much better than the hack I had.
>
> Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

I applied this, but it has a few conflicts with SPDX tags from Greg
and some board additions in arm-soc. Please take a look.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
