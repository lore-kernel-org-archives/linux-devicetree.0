From: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
Subject: Re: [PATCHv7 0/5] Common Mailbox Framework
Date: Mon, 30 Jun 2014 18:16:20 +0200
Message-ID: <1404144980.6148.6.camel@hobbes>
References: <1402592317-7043-1-git-send-email-jaswinder.singh@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1402592317-7043-1-git-send-email-jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, bjorn-UYDU3/A3LUY@public.gmane.org, ashwin.chaugule-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, s-anna-l0cyMroinI0@public.gmane.org, loic.pallardy-qxv4g6HH51o@public.gmane.org, lftan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, slapdau-/E1597aS9LT0CCvOHzKKcA@public.gmane.org, courtney.cavin-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org, pa-kxMDh+IBDuj1P9xLtpHBDw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jassi,

On Thu, 2014-06-12 at 22:28 +0530, Jassi Brar wrote:
> Hello,
>   Here is the next revision of Mailbox framwork.

I'm wondering whether you keep a Git tree with the framework we could
keep the Raspberry Pi mailbox driver based on (bcm2835-mbox)?

Also, from look at the API it does not seem to me that it's possible to
synchronously (that is without a tx_done callback) collect a response
when a message is sent with tx_block enabled. Equivalent to this: [1]

	bcm_mailbox_write(MBOX_CHAN_FB, vc4->mode_set_cmd_addr);
	bcm_mailbox_read(MBOX_CHAN_FB, &val);

[1] https://github.com/anholt/linux/commit/d6276826c1e94d942bd9f9dd4586b52197f13fb7#diff-fe03b88eaabd67668dcf9e116346793fR184

What's your opinion on that?

Regards,
Lubo

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
