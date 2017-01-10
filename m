From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] of: remove redundant memset in overlay
Date: Mon, 9 Jan 2017 23:35:58 -0600
Message-ID: <20170110053558.tc5hppy5bfplzuz3@rob-hp-laptop>
References: <1483787067-108430-1-git-send-email-xuyiping@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1483787067-108430-1-git-send-email-xuyiping@hisilicon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: YiPing Xu <xuyiping@hisilicon.com>
Cc: pantelis.antoniou@konsulko.com, frowand.list@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Jan 07, 2017 at 07:04:27PM +0800, YiPing Xu wrote:
> From: XuYing <xuyiping@hisilicon.com>
> 
> memset in of_build_overlay_info is redundant, the ovinfo has been
> zeroed in of_fill_overlay_info when error.
> 
> Signed-off-by: YiPing Xu <xuyiping@hisilicon.com>
> ---
>  drivers/of/overlay.c | 1 -
>  1 file changed, 1 deletion(-)

Applied, thanks.

Rob
