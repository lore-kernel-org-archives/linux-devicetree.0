From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH RFC v2 1/2] max77693: added device tree support
Date: Mon, 8 Apr 2013 17:21:22 +0200
Message-ID: <20130408152122.GU24058@zurbaran>
References: <1361288177-14452-1-git-send-email-a.hajda@samsung.com>
 <1361288177-14452-2-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1361288177-14452-2-git-send-email-a.hajda@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-media@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: devicetree@vger.kernel.org

Hi Andrzej,

On Tue, Feb 19, 2013 at 04:36:16PM +0100, Andrzej Hajda wrote:
> max77693 mfd main device uses only wakeup field
> from max77693_platform_data. This field is mapped
> to wakeup-source property in device tree.
> Device tree bindings doc will be added in max77693-led patch.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/mfd/max77693.c |   40 +++++++++++++++++++++++++++++++++-------
>  1 file changed, 33 insertions(+), 7 deletions(-)
This patch looks good to me, but doesn't apply to mfd-next. Would you mind
rebasing it ?

Cheers,
Samuel.


-- 
Intel Open Source Technology Centre
http://oss.intel.com/
