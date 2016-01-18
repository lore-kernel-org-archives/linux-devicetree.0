From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] dmaengine: rcar-dmac: Document SoC specific bindings
Date: Mon, 18 Jan 2016 15:46:44 +0100
Message-ID: <CAMuHMdXX+RSkwjz2UuDA_4f7SNLmma=J_d=NS_oNqOARyhsPZw@mail.gmail.com>
References: <1447293239-8554-1-git-send-email-horms+renesas@verge.net.au>
	<20151116035533.GC25173@localhost>
	<CAMuHMdXVBSjTb_-7o4rDh_S+i64QKEr-5KUnSfd3Nqt1D1TE2Q@mail.gmail.com>
	<20160118143731.GQ11130@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20160118143731.GQ11130@localhost>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Simon Horman <horms+renesas@verge.net.au>, dmaengine@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Vinod,

On Mon, Jan 18, 2016 at 3:37 PM, Vinod Koul <vinod.koul@intel.com> wrote:
> On Thu, Jan 14, 2016 at 11:09:47AM +0100, Geert Uytterhoeven wrote:
>> On Mon, Nov 16, 2015 at 4:55 AM, Vinod Koul <vinod.koul@intel.com> wrote:
>> > On Thu, Nov 12, 2015 at 10:53:59AM +0900, Simon Horman wrote:
>> >> In general Renesas hardware is not documented to the extent where the
>> >> relationship between IP blocks on different SoCs can be assumed although
>> >> they may appear to operate the same way. Furthermore the documentation
>> >> typically does not specify a version for individual IP blocks. For these
>> >> reasons a convention of using the SoC name in place of a version and
>> >> providing SoC-specific compat strings has been adopted.
>> >>
>> >> Although not universally liked this convention is used in the bindings for
>> >> most drivers for Renesas hardware. The purpose of this patch is to
>> >> update the Renesas R-Car DMA Controller driver to follow this convention.
>> >
>> > Applied, thanks
>>
>> This patch (and this patch only) has disappeared from your next branch between
>> January 6 and 7, and thus wasn't included in your pull request for v4.5.
>>
>> Was there a specific reason for that, or was it just an oversight?
>>
>> Note that the added compatible values in in use (in arm-soc/for-next).
>
> That only means I messed up. I apply patches to for-linus or topic branches
> and then merge all topics to for-linus and send that to Linus.
>
> In this case I didn't see this in any of the topics or for-linus which means
> I applied to next which I usually trash and keep rebuiling on latest -rc.
>
> Now git helped me track this commit on a deleted branch (which reminds us
> what a wonderful thing git is... screwed up, dont worrry git is our
> superhero to rescue).
>
> I have cherry-picked this patch and applied to for-4.5 branch and will
> send to Linus in few days along with few more fixes.

Thanks for your prompt action!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
