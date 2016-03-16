From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [STLinux Kernel] [PATCH v5 3/7] remoteproc: debugfs: Add ability
 to boot remote processor using debugfs
Date: Wed, 16 Mar 2016 16:44:22 +0000
Message-ID: <20160316164422.GD9595@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1452602781-22424-1-git-send-email-lee.jones@linaro.org>
 <1452602781-22424-4-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452602781-22424-4-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Nathan_Lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, s-anna-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 12 Jan 2016, Lee Jones wrote:

> This functionality is especially useful during the testing phase.  When
> used in conjunction with Mailbox's Test Framework we can trivially conduct
> end-to-end testing i.e. boot co-processor, send and receive messages to
> the co-processor, then shut it down again (repeat as required).
> 
> Signed-off-by: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
> Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  drivers/remoteproc/remoteproc_debugfs.c | 34 +++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)

Acked-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
