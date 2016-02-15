From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 0/4] mailbox: mailbox-test: support single channel with
 separate Tx and Rx buffer
Date: Mon, 15 Feb 2016 12:17:30 +0000
Message-ID: <56C1C1DA.5000207@arm.com>
References: <1455210808-29395-1-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455210808-29395-1-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Jassi,

On 11/02/16 17:13, Sudeep Holla wrote:
> Hi Lee, Jassi,
>
> Assuming mailbox-test was designed to be generic, I am trying to extend
> it to support single channel with separate Tx and Rx buffer. With these
> changes I am able to test arm_mhu driver. However I couldn't understand
> the intention of converting buffer to ASCII hex dump in read method.
> I have a local change to remove that so that it can deal with any data
> in any format(e.g. some protocol format) and userspace can deal with the
> actual interpretation of the data. Let me know your thoughts on that.
>

Can you review this ? It would be good to get this in for v4.6

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
