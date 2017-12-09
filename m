From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 0/2] of: overlay: Crash fix and improvement
Date: Fri, 8 Dec 2017 22:01:42 -0800
Message-ID: <f78620d2-7a6d-b90e-d773-9e3cc3d0cb6a@gmail.com>
References: <1512738783-17452-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1512738783-17452-1-git-send-email-geert+renesas@glider.be>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12/08/17 05:13, Geert Uytterhoeven wrote:
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

Overlay FDT files should not have invalid contents.  But they inevitably
will, so the code has to handle those cases.  Thanks for finding this
problem and making the code better!

For the full series:

Reviewed-by: Frank Rowand <frank.rowand@sony.com>


> I've updated my topic/overlays and topic/renesas-overlays branches at
> git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
> accordingly.
> 
> Thanks!
> 
> Geert Uytterhoeven (2):
>   of: overlay: Fix out-of-bounds write in init_overlay_changeset()
>   of: overlay: Make node skipping in init_overlay_changeset() clearer
> 
>  drivers/of/overlay.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 
