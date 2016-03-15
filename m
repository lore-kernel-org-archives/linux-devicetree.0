From: Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org>
Subject: Re: [PATCH 1/1] of: Empty of_read_number when !OF
Date: Tue, 15 Mar 2016 22:09:33 +0100
Message-ID: <3322869.hMdihePIvu@kongar>
References: <1457375633-614-1-git-send-email-alexanders83@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457375633-614-1-git-send-email-alexanders83-S0/GAf8tV78@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 07 March 2016, 19:33:53 wrote Alexander Stein:
> Introduce empty of_read_number when CONFIG_OF is not defined. This allows
> us to compile test gpio drivers.
> 
> Signed-off-by: Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org>
> ---
> This is currently based on gpio's for-next branch due to other patches depending on this.
> If you require a different base branch, please let me know.

Any feedback on this one?

Best regards,
Alexander

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
