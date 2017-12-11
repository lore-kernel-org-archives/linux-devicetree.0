From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 0/2] of: overlay: Crash fix and improvement
Date: Mon, 11 Dec 2017 14:33:07 -0800
Message-ID: <bdd10617-269b-cc75-b97e-a49d9f5a9d6d@gmail.com>
References: <1512738783-17452-1-git-send-email-geert+renesas@glider.be>
 <f78620d2-7a6d-b90e-d773-9e3cc3d0cb6a@gmail.com>
 <CAMuHMdXGg9hF+AS8TtW2LSxVDaSkDit+7=QO2=p3_BZ-8TROWA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXGg9hF+AS8TtW2LSxVDaSkDit+7=QO2=p3_BZ-8TROWA@mail.gmail.com>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 12/09/17 01:04, Geert Uytterhoeven wrote:
> Hi Frank,
> 
> On Sat, Dec 9, 2017 at 7:01 AM, Frank Rowand <frowand.list@gmail.com> wrote:
>> On 12/08/17 05:13, Geert Uytterhoeven wrote:
>>> This patch series fixes memory corruption when applying overlays.
>>> I first noticed this when using OF configfs.  After lots of failed
>>> debugging attempts, I bisected it to "of: overlay: add per overlay sysfs
>>> attributes", which is not upstream.  But that was a red herring: that
>>> commit enlarged struct fragment to exactly 64-bytes, which just made it
>>> more likely to cause random corruption when writing beyond the end of an
>>> array of fragment structures.  With the smaller structure size before,
>>> such writes usually ended up in the unused holes between allocated
>>> blocks, causing no harm.
>>>
>>> The first patch is the real fix, and applies to both v4.15-rc2 and Rob's
>>> for-next branch.
>>> The second patch is a small improvement, and applies to Rob's for-next
>>> branch only.
>>
>> Overlay FDT files should not have invalid contents.  But they inevitably
>> will, so the code has to handle those cases.  Thanks for finding this
>> problem and making the code better!
> 
> Sure, people can throw anything at it ;-)
> 
> In my case, I'm wondering if the dtbo was actually invalid?
> Simplification of the decompiled dtbo:
> 
> /dts-v1/;
> 
> / {
> 
>         fragment-name {
>                 target-path = [2f 00];
> 
>                 __overlay__ {
> 
>                         node-name {
>                                 compatible = "foo,bar";
>                                 gpios = <0xffffffff 0x0 0x0>;
>                         };
>                 };
>         };
> 
>         __fixups__ {
>                 bank0 = "/fragment-name/__overlay__/node-name:gpios:0";
>         };
> };
> 
> So it has __fixup__, but no __symbols__, which looks totally valid to me.

Yes, that is correct.  The bug would also be exposed if there was a __local_fixups__
node without a __symbols__ node.  Which is also a valid overlay.

My comment was triggered by another possible case, where a non-overlay node
occurs in an overlay, without a __symbols__ node.  I'm not positive, but I
don't think that dtc would find an error in that case. 


>> For the full series:
>>
>> Reviewed-by: Frank Rowand <frank.rowand@sony.com>
> 
> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
