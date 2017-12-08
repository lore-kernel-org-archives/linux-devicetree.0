From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 0/2] of: overlay: Crash fix and improvement
Date: Fri, 8 Dec 2017 09:11:14 -0600
Message-ID: <20171208151114.ly7sqymznmeme4w4@rob-hp-laptop>
References: <1512738783-17452-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1512738783-17452-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 08, 2017 at 02:13:01PM +0100, Geert Uytterhoeven wrote:
> 	Hi Pantelis, Rob, Frank,
> 
> This patch series fixes memory corruption when applying overlays.
> 
> I first noticed this when using OF configfs.  After lots of failed
> debugging attempts, I bisected it to "of: overlay: add per overlay sysfs
> attributes", which is not upstream.  But that was a red herring: that
> commit enlarged struct fragment to exactly 64-bytes, which just made it
> more likely to cause random corruption when writing beyond the end of an
> array of fragment structures.  With the smaller structure size before,
> such writes usually ended up in the unused holes between allocated
> blocks, causing no harm.
> 
> The first patch is the real fix, and applies to both v4.15-rc2 and Rob's
> for-next branch.
> The second patch is a small improvement, and applies to Rob's for-next
> branch only.
> 
> I've updated my topic/overlays and topic/renesas-overlays branches at
> git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
> accordingly.
> 
> Thanks!
> 
> Geert Uytterhoeven (2):
>   of: overlay: Fix out-of-bounds write in init_overlay_changeset()
>   of: overlay: Make node skipping in init_overlay_changeset() clearer

I've applied both and am updating my pull req to Linus. I hope that's 
the end of it. If further fixes can't be reproduced with mainline, I'm 
not going to be inclined to take them for 4.15.

Rob
