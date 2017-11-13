From: Ian Campbell <ijc-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Subject: Re: split devicetree repository to be rebased/rewritten after
 v4.14-rcFINAL
Date: Mon, 13 Nov 2017 10:19:38 +0000
Message-ID: <1510568378.11820.17.camel@hellion.org.uk>
References: <1506970413.4619.53.camel@hellion.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506970413.4619.53.camel-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This has now been done.

Ian,
On Mon, 2017-10-02 at 19:53 +0100, Ian Campbell wrote:
> TL;DR: The tree[DT-R] at
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/devicetree/devicetree-rebasing.git/
> 
> will be force pushed when v4.14 is released. This means a complete new
> history and tags for this tree. The original tree will remain
> available at [V1] but will not receive updates after v4.14-rcFINAL.
> 
> I'm not sure how widely used this tree is but I have made some changes
> to the scripting which improves things in various ways:
> 
>  - The main change is that uninteresting merges (those which don't
>    involve any files present in the output) are now removed, resulting
>    in a _much_ cleaner history.
> 
>  - I've taken the chance to fix the dates on the vX.Y-dts tags so they
>    reflect the date of the original vX.Y tag from Linus rather than
>    whenever the conversion happened. Likewise the underlying merge
>    commits now take their dates from the commit which Linus tagged.
> 
>  - I've also now upstreamed my changes to git filter-branch, which
>    have been merged into git.git#master post v2.14.2. For now I am
>    running v2.14.0 with the patches I sent upstream, but will switch
>    to a real release with those changes ASAP. The switch to mainline
>    git filter-branch has resulted in some irrelevant secondary roots
>    (such as the one from the btrfs merge) being omitted, as they
>    should have been all along. It's also nice to be using upstream!
> 
>  - Lastly I've improved the conversion scripting in various ways (unlike
>    the others these do not change the output, but it is ~10-13x faster now
>    for example).
> 
> As above the original tree will remain available at [V1] but will not
> receive updates after v4.14-rcFINAL. The conversion state repo for
> this tree will remain at [STATE-V1].
> 
> The new tree and its conversion state will be mirrored respectively at
> [V2] and [STATE-V2]. These trees are already active if you want a
> glimpse into the future. It's also not entirely too late to point out
> issues with the new tree as there is still a chance to rewrite from
> scratch (which takes around 3 days) before v4.14.
> 
> The spurious/empty/irrelevant merges have bugged me from day 1 of this
> tree so I am glad to have had a chance to fix them. I'm not aware of
> any other reason why the tree would need rebasing again, although for
> now I am going to reserve the right to do so.
> 
> Cheers,
> Ian.
> 
> [DT-R] https://git.kernel.org/pub/scm/linux/kernel/git/devicetree/devicetree-rebasing.git/
> [V1] https://github.com/ijc/devicetree-rebasing-v1
> [V2] https://github.com/ijc/devicetree-rebasing-v2
> [STATE-V1] https://github.com/ijc/devicetree-conversion-state-v1
> [STATE-V2] https://github.com/ijc/devicetree-conversion-state-v2
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
