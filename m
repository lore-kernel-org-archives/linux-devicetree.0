From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 01/18] remoteproc: make rsc table support optional
Date: Tue, 7 Jun 2016 12:56:17 -0700
Message-ID: <20160607195617.GI1256@tuxbot>
References: <1465316352-20691-1-git-send-email-peter.griffin@linaro.org>
 <1465316352-20691-2-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1465316352-20691-2-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, arnaud.pouliquen-qxv4g6HH51o@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-remoteproc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue 07 Jun 09:18 PDT 2016, Peter Griffin wrote:

> Some firmware and rproc drivers such as slim core don't have a
> resource table. To avoid having to fudge an empty table
> in the rproc driver this patch introduces a new has_rsctable
> flag. rproc drivers which don't require a rsc table can set
> this flag to false, and it avoids doing the initial async
> firmware load in rproc_add_virtio_devices() to parse the
> rsc table during rproc_add(), and also optimises rproc_fw_boot()
> code path to avoid unnecessary rsc table processing of an
> empty table.
> 
> Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Hi Peter,

Thanks for the patch. I do however dislike the amount of conditionals
already in these code paths, so I'm not in favour of adding more.

Please revert back to providing a dummy table from your driver and let's
handle this topic separate of this series.

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
