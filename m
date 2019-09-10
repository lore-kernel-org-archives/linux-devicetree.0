From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [Patch 00/13] media: am437x-vpfe: overdue maintenance
Date: Tue, 10 Sep 2019 12:42:51 +0200
Message-ID: <5b73285c-5d05-1799-06fc-f4ab84cb9a1d@xs4all.nl>
References: <20190909162743.30114-1-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190909162743.30114-1-bparrot@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Benoit Parrot <bparrot@ti.com>
Cc: Prabhakar Lad <prabhakar.csengg@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Benoit,

On 9/9/19 6:27 PM, Benoit Parrot wrote:
> This patch series is a collection of patches we have been carrying for a
> while.
> 
> A few patches do fix actual bug and v4l2-compliance errors/warnings.
> Other are drivers re-work to simplify/clarify the code for easier
> maintenance.

Can you post the output of the latest version of v4l2-compliance? Use
the '-s' option so streaming is tested as well.

Thanks!

	Hans

> 
> We also include the SPDX Licensing update which seemed to have been
> missed by the global script thus far.
> 
> Benoit Parrot (12):
>   media: am437x-vpfe: Fix missing first line
>   media: am437x-vpfe: Rework ISR routine for clarity
>   media: am437x-vpfe: Wait for end of frame before tear-down
>   media: am437x-vpfe: Streamlined vb2 buffer cleanup
>   media: am437x-vpfe: Setting STD to current value is not an error
>   media: am437x-vpfe: Use a per instance format array instead of a
>     static one
>   media: am437x-vpfe: Maintain a reference to the current vpfe_fmt
>   media: am437x-vpfe: fix function trace debug log
>   media: am437x-vpfe: Remove print_fourcc helper
>   media: am437x-vpfe: TRY_FMT ioctl is not really trying anything
>   media: am437x-vpfe: Remove per bus width static data
>   media: am437x-vpfe: Switch to SPDX Licensing
> 
> Dave Gerlach (1):
>   media: am437x-vpfe: Fix suspend path to always handle pinctrl config
> 
>  drivers/media/platform/am437x/am437x-vpfe.c   | 906 ++++++++----------
>  drivers/media/platform/am437x/am437x-vpfe.h   |  44 +-
>  .../media/platform/am437x/am437x-vpfe_regs.h  |  10 +-
>  3 files changed, 438 insertions(+), 522 deletions(-)
> 
