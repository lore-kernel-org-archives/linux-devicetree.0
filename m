From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [Patch v2 4/4] tty: serial: msm: Remove direct access to GSBI
Date: Thu, 29 May 2014 08:43:42 -0700
Message-ID: <20140529154342.GA28679@kroah.com>
References: <1398357082-5102-1-git-send-email-agross@codeaurora.org>
 <1398357082-5102-5-git-send-email-agross@codeaurora.org>
 <A56B810D-869A-4E4F-BC29-C9B0F6CDCE79@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <A56B810D-869A-4E4F-BC29-C9B0F6CDCE79-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 29, 2014 at 10:14:35AM -0500, Kumar Gala wrote:
> 
> On Apr 24, 2014, at 11:31 AM, Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> 
> > This patch removes direct access of the GSBI registers.  GSBI configuration
> > should be done through the GSBI driver directly.
> > 
> > Signed-off-by: Andy Gross <agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> > ---
> > drivers/tty/serial/msm_serial.c |   48 ++-------------------------------------
> > drivers/tty/serial/msm_serial.h |    5 ----
> > 2 files changed, 2 insertions(+), 51 deletions(-)
> 
> Greg,
> 
> Any update on pulling this is for next?

I thought this was going through someone else's tree, sorry.  And, there
seemd to be a second set of patches for this, which I don't have
anywhere :(

If you want me to take all of these, or just this one, Andy, can you
please resend?

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
