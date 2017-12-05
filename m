From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v2 2/2] of: overlay: Fix cleanup order in
 of_overlay_apply()
Date: Mon, 4 Dec 2017 20:16:27 -0500
Message-ID: <08f8b9cd-4626-5048-c034-412dc5679abd@gmail.com>
References: <1512402456-8176-1-git-send-email-geert+renesas@glider.be>
 <1512402456-8176-3-git-send-email-geert+renesas@glider.be>
 <CAL_JsqJqb-01rQ6D65-r3Q1ZdF407b11BrVgnUQZPjyTW8hj8A@mail.gmail.com>
 <CAMuHMdVFR3FPVAM2J_L2HvNUzkJsQM57SJJ2CMux71M4dhZYfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVFR3FPVAM2J_L2HvNUzkJsQM57SJJ2CMux71M4dhZYfQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Colin King <colin.king@canonical.com>, Dan Carpenter <dan.carpenter@oracle.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 12/04/17 14:45, Geert Uytterhoeven wrote:
> Hi Rob,
> 
> On Mon, Dec 4, 2017 at 8:35 PM, Rob Herring <robh+dt@kernel.org> wrote:
>> On Mon, Dec 4, 2017 at 9:47 AM, Geert Uytterhoeven
>> <geert+renesas@glider.be> wrote:
>>> The special overlay mutex is taken first, hence it should be released
>>> last in the error path.
>>>
>>> Move "mutex_lock(&of_mutex)" up, as suggested by Frank, as
>>> free_overlay_changeset() should be called with that mutex held if any
>>> non-trivial cleanup is to be done.
>>
>> Not holding the of_mutex for of_resolve_phandles is just wrong.
>> Without it, a node and new phandle could be added via of_attach_node
>> making the max phandle wrong.
> 
> After my patch it's held, so what's the problem?
> 
>> Now, with the 2 mutexes adjacent, what is the point of even having the
>> of_overlay_mutex? Seems like we should just drop it.
> 
> Frank?

__of_changeset_apply_notify(), which is called by __of_changeset_apply()
unlocks of_mutex, then does notifications then locks of_mutex.  So the
mutex get released in the middle of of_overlay_apply()

I have never been comfortable with the unlock/lock there, but don't have
an alternative yet.


>> I also don't think we really need to hold the mutex during post-apply
>> notifiers. It also seems like some steps could be moved outside the
>> mutex(es) like init_overlay_changeset().
> 
> Perhaps.
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
