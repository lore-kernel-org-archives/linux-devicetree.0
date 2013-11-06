From: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH RFC] dt: bindings: submitting patches document
Date: Wed, 6 Nov 2013 12:08:01 -0600
Message-ID: <94951083-8220-46EB-A96B-5FFF95D944EA@codeaurora.org>
References: <1383759120-21571-1-git-send-email-jason@lakedaemon.net>
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383759120-21571-1-git-send-email-jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Nov 6, 2013, at 11:32 AM, Jason Cooper wrote:

> Signed-off-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
> ---
> All,
> 
> Since I've now had to answer this question a couple of times, I thought it
> might be worth trying to put it in a document.  I don't like long documents, so
> this is pretty concise, and most likely wrong.  Hence, RFC.  :)
> 
> I also dislike quoting people from my imperfect memory, much better to have an
> agreed upon document we can point people towards.
> 
> thx,
> 
> Jason.
> 
> .../devicetree/bindings/submitting-patches.txt     | 52 ++++++++++++++++++++++
> 1 file changed, 52 insertions(+)
> create mode 100644 Documentation/devicetree/bindings/submitting-patches.txt
> 
> diff --git a/Documentation/devicetree/bindings/submitting-patches.txt b/Documentation/devicetree/bindings/submitting-patches.txt
> new file mode 100644
> index 000000000000..5a84d5ebb0f5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/submitting-patches.txt
> @@ -0,0 +1,52 @@
> +
> +  Submitting devicetree (DT) binding patches
> +
> +I. For patch submitters
> +
> +  0) Normal patch submission rules from Documentation/SubmittingPatches
> +     applies.
> +
> +  1) The Documentation/ portion of the patch should be a separate patch
> +     and clearly labelled as such.  For example:
> +
> +       [PATCH X/Y] dt: binding: mvebu mbus driver
> +
> +     This makes the binding portion easy to find among large patch series.
> +
> +  2) Submit the entire series to the devicetree mailinglist at
> +
> +       devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> +
> +II. For sub-system maintainers
> +
> +  1) If you aren't comfortable reviewing a given binding, reply to it and ask
> +     the devicetree maintainers for guidance.  This will help them prioritize
> +     which ones to review and which ones are ok to let go.
> +
> +  2) If you are comfortable with the binding, and it hasn't received an
> +     Acked-by from the devicetree maintainers after a few weeks, go ahead and
> +     take it.
> +
> +  3) For a series going though multiple trees, the binding patch should be
> +     kept with the driver using the binding.
> +
> +III.  General binding rules
> +
> +  1) Don't hold up a binding because it isn't perfect.

Who is that a statement to, the maintainers or the developer?  Are just saying publish early for feedback or accept something that isn't perfect?

> +
> +  2) Use specific compatible strings so that if we need to add a feature (DMA)
> +     in the future, we can create a new compatible string.
> +
> +  3) Ideally, all bindings receive sufficient review.  In the real world, we
> +     need to prioritize.  Bindings for a specific block of IP aren't as
> +     critical as a binding for a common subsystem, like PCI.
> +
> +  4) Don't submit bindings for staging or unstable.  That will be decided by
> +     the devicetree maintainers *after* discussion on the mailinglist.
> +
> +IV. Notes
> +
> +  This document is intended as a general familiarization with the process as
> +  decided at the 2013 Kernel Summit.  When in doubt, the current word of the
> +  devicetree maintainers overrules this document.  In that situation, a patch
> +  updating this document would be appreciated.
> -- 
> 1.8.4.2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
