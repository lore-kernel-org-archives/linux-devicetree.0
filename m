From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCHv2] arm64: Add atomic pool for non-coherent and CMA
 allocaitons.
Date: Tue, 3 Jun 2014 14:28:42 +0100
Message-ID: <20140603132842.GI23149@arm.com>
References: <1401739432-5358-1-git-send-email-lauraa@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1401739432-5358-1-git-send-email-lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Ritesh Harjani <ritesh.harjani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Riley <davidriley-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Laura,

On Mon, Jun 02, 2014 at 09:03:52PM +0100, Laura Abbott wrote:
> Neither CMA nor noncoherent allocations support atomic allocations.
> Add a dedicated atomic pool to support this.
> 
> Change-Id: I46c8fdffe5e0687403d42b37643137c8cf344259
> Signed-off-by: Laura Abbott <lauraa-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> ---
> 
> v2: Various bug fixes pointed out by David and Ritesh (CMA dependency, swapping
> coherent, noncoherent). I'm still not sure how to address the devicetree
> suggestion by Will [1][2]. I added the devicetree mailing list this time around
> to get more input on this.
> 
> [1] http://lists.infradead.org/pipermail/linux-arm-kernel/2014-April/249180.html
> [2] http://lists.infradead.org/pipermail/linux-arm-kernel/2014-April/249528.html

Perhaps that can be done later then, since from what you're saying, we need
the command-line option either way? Have you looked at how this fits in with
the iommu-helper work from Ritesh? We could put the parameter parsing in
there too.

Will
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
