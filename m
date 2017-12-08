From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/2] of: overlay: Crash fix and improvement
Date: Fri, 8 Dec 2017 16:24:02 +0100
Message-ID: <CAMuHMdWWnbaVPbBHkONcJTn1RATCy6kwQ+MFnqbYO=koACqvow@mail.gmail.com>
References: <1512738783-17452-1-git-send-email-geert+renesas@glider.be> <20171208151114.ly7sqymznmeme4w4@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20171208151114.ly7sqymznmeme4w4@rob-hp-laptop>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Frank Rowand <frowand.list@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Fri, Dec 8, 2017 at 4:11 PM, Rob Herring <robh@kernel.org> wrote:
> On Fri, Dec 08, 2017 at 02:13:01PM +0100, Geert Uytterhoeven wrote:
>> This patch series fixes memory corruption when applying overlays.
>>
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
>>
>> I've updated my topic/overlays and topic/renesas-overlays branches at
>> git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
>> accordingly.
>>
>> Thanks!
>>
>> Geert Uytterhoeven (2):
>>   of: overlay: Fix out-of-bounds write in init_overlay_changeset()
>>   of: overlay: Make node skipping in init_overlay_changeset() clearer
>
> I've applied both and am updating my pull req to Linus. I hope that's
> the end of it. If further fixes can't be reproduced with mainline, I'm
> not going to be inclined to take them for 4.15.

Tahnks!

BTW, seems I accidentally used "--" instead of "---" as a separator, so the
commit message
https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?h=dt/linus&id=efb72067c287cd6aba8eb434bd5bdc1ae0af6ed7
contains a few more lines than intended.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
