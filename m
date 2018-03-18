From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/3] of: overlay: Remove unused of_overlay_remove_all()
Date: Sun, 18 Mar 2018 07:48:03 -0500
Message-ID: <20180318124803.hv3fsny33trabscf@rob-hp-laptop>
References: <1520592288-7680-1-git-send-email-geert+renesas@glider.be>
 <1520592288-7680-4-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1520592288-7680-4-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Mar 09, 2018 at 11:44:48AM +0100, Geert Uytterhoeven wrote:
> of_overlay_remove_all(), and its predecessor of_overlay_destroy_all(),
> were never used.

Maybe, but I think we should leave it. It's not that much and we'll just 
end up with open coded versions.

> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/overlay-notes.txt |  4 ----
>  drivers/of/overlay.c                       | 23 -----------------------
>  include/linux/of.h                         |  6 ------
>  3 files changed, 33 deletions(-)
