From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 0/2] of: overlay locking fixes
Date: Mon, 27 Nov 2017 12:22:22 -0500
Message-ID: <74d010b5-4d7d-889b-c9f3-374a942bf7dc@gmail.com>
References: <1511793987-315-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1511793987-315-1-git-send-email-geert+renesas@glider.be>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Geert,

I did not receive patch 1/2, can you please resend it?

-Frank

On 11/27/17 09:46, Geert Uytterhoeven wrote:
> 	Hi Pantelis, Rob, Frank,
> 
> Here are two locking fixes for OF overlays, found by code inspection.
> 
> They were compile-tested only, as I'm still working on getting "real"
> (configfs) overlays working again in v4.15-rc1...
> 
> Geert Uytterhoeven (2):
>   of: overlay: Fix cleanup order in of_overlay_apply()
>   of: unittest: Remove bogus overlay mutex release from
>     overlay_data_add()
> 
>  drivers/of/overlay.c  | 6 +++---
>  drivers/of/unittest.c | 1 -
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
