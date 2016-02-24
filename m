From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] dtb: amd: Fix-up for ccn504 and kcs nodes
Date: Wed, 24 Feb 2016 14:01:57 -0800
Message-ID: <20160224220157.GP10126@localhost>
References: <1455236443-23949-1-git-send-email-Suravee.Suthikulpanit@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1455236443-23949-1-git-send-email-Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>
Cc: arnd-r2nGTMty4D4@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, brijeshkumar.singh-5C7GfCeVMHo@public.gmane.org, thomas.lendacky-5C7GfCeVMHo@public.gmane.org, leo.duran-5C7GfCeVMHo@public.gmane.org, Brijesh Singh <brijesh.singh-5C7GfCeVMHo@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 12, 2016 at 07:20:43AM +0700, Suravee Suthikulpanit wrote:
> From: Suravee Suthikulpanit <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>
> 
> This is a fix-up patch based on the review comment from
> Arnd regarding:
>     * fix ccn504 address in the node name
>     * remove kcs interrupt-name
> 
> Signed-off-by: Brijesh Singh <brijesh.singh-5C7GfCeVMHo@public.gmane.org>
> Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>
> Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> ---
> 
> Hi Olof,
> 
> Here are the changes from the V3 that I sent earlier. Sorry for confusion.
> Would you please pull this into the next tree?
> 
> Thank you,
> Suravee

Applied.

I also noticed that the patch subjects were nonstandard the last time around.
In the future, please use:

arm64: dts: amd: ...

as prefix, instead of just dtb (which is the binary format). I fixed it up for
this patch, and the others, well, they're already applied. So let's try to
remember it for the future.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
