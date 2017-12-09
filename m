From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 0/2] of: overlay: Crash fix and improvement
Date: Sat, 9 Dec 2017 10:04:48 +0100
Message-ID: <CAMuHMdXGg9hF+AS8TtW2LSxVDaSkDit+7=QO2=p3_BZ-8TROWA@mail.gmail.com>
References: <1512738783-17452-1-git-send-email-geert+renesas@glider.be> <f78620d2-7a6d-b90e-d773-9e3cc3d0cb6a@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f78620d2-7a6d-b90e-d773-9e3cc3d0cb6a-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Frank,

On Sat, Dec 9, 2017 at 7:01 AM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 12/08/17 05:13, Geert Uytterhoeven wrote:
>> This patch series fixes memory corruption when applying overlays.
>> I first noticed this when using OF configfs.  After lots of failed
>> debugging attempts, I bisected it to "of: overlay: add per overlay sysfs
>> attributes", which is not upstream.  But that was a red herring: that
>> commit enlarged struct fragment to exactly 64-bytes, which just made it
>> more likely to cause random corruption when writing beyond the end of an
>> array of fragment structures.  With the smaller structure size before,
>> such writes usually ended up in the unused holes between allocated
>> blocks, causing no harm.
>>
>> The first patch is the real fix, and applies to both v4.15-rc2 and Rob's
>> for-next branch.
>> The second patch is a small improvement, and applies to Rob's for-next
>> branch only.
>
> Overlay FDT files should not have invalid contents.  But they inevitably
> will, so the code has to handle those cases.  Thanks for finding this
> problem and making the code better!

Sure, people can throw anything at it ;-)

In my case, I'm wondering if the dtbo was actually invalid?
Simplification of the decompiled dtbo:

/dts-v1/;

/ {

        fragment-name {
                target-path = [2f 00];

                __overlay__ {

                        node-name {
                                compatible = "foo,bar";
                                gpios = <0xffffffff 0x0 0x0>;
                        };
                };
        };

        __fixups__ {
                bank0 = "/fragment-name/__overlay__/node-name:gpios:0";
        };
};

So it has __fixup__, but no __symbols__, which looks totally valid to me.

> For the full series:
>
> Reviewed-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
