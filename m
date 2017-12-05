From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 1/2] of: overlay: Fix memory leak in of_overlay_apply()
 error path
Date: Tue, 5 Dec 2017 14:58:42 +0100
Message-ID: <CAMuHMdX__gY+TG2Pe-8FZSGCG1m8yLYYszrFHDPVHK5JJsnxqA@mail.gmail.com>
References: <1512402456-8176-1-git-send-email-geert+renesas@glider.be>
 <1512402456-8176-2-git-send-email-geert+renesas@glider.be>
 <b6392405-390d-d7dc-91b2-1338fd605e65@gmail.com> <CAMuHMdUzuJuKYQ6xtOAb3ctzPqakKZCtPQr9JVQP78VvK6qq3g@mail.gmail.com>
 <87ecaacc-1969-c4ef-9c1d-f4279144e93b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87ecaacc-1969-c4ef-9c1d-f4279144e93b@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh+dt@kernel.org>, Colin King <colin.king@canonical.com>, Dan Carpenter <dan.carpenter@oracle.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Frank,

On Tue, Dec 5, 2017 at 2:45 PM, Frank Rowand <frowand.list@gmail.com> wrote:
> On 12/05/17 03:01, Geert Uytterhoeven wrote:
>> On Tue, Dec 5, 2017 at 3:07 AM, Frank Rowand <frowand.list@gmail.com> wrote:
>>> Also, the previous version of the patch, and the discussion around the resulting
>>> bug make me think that I should not have moved 'kfree(ovcs)' into
>>> free_overlay_changeset(), because that kfree is then not very visible in the
>>> error path of of_overlay_apply().  Could you remove 'kfree(ovcs)' from
>>> free_overlay_changeset(), and instead call it immediately after each call
>>> to free_overlay_changeset()?
>>
>> Actually I like that free_overlay_changeset() takes care of the deallocation,
>> especially in light of the kojectification op top from bbb-overlays, which
>> means you cannot just call kfree(ovcs) anymore (I know this won't go upstream
>> anytime soon, but I need overlay configfs for my development and testing).
>
> OK, knowing that kobjectification is being considered I am willing to leave the
> kfree(ovcs) where it is for now.
>
>> Perhaps the allocation of ovcs should be moved into free_overlay_changeset(),
>
>                                           I think this ^^^^^^^^^^^^^^^^^^^^^^^
> is a typo, and you meant init_overlay_changeset().

Yes it is.

>> and the latter being renamed to alloc_overlay_changeset()?
>> That way allocation and freeing become symmetrical.
>> It would move the allocation under the mutexes, though.
>
> I considered moving the kzalloc() into init_overlay_changeset() when I
> created it, but decided not to because the type of the first argument of
> init_overlay_changeset() would change from
>    struct overlay_changeset *
> to
>    struct overlay_changeset **,
> and usage of ovcs would become _slightly_ more ugly and complex in
> init_overlay_changeset().

I would let alloc_overlay_changeset() return struct overlay_changeset *
instead.

If you care about why it failed, it can return ERR_PTR(error) instead of
NULL ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
