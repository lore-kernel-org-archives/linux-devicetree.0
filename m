From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 0/4] mailbox: mailbox-test: support single channel with separate Tx and Rx buffer
Date: Thu, 11 Feb 2016 17:13:24 +0000
Message-ID: <1455210808-29395-1-git-send-email-sudeep.holla@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Lee, Jassi,

Assuming mailbox-test was designed to be generic, I am trying to extend
it to support single channel with separate Tx and Rx buffer. With these
changes I am able to test arm_mhu driver. However I couldn't understand
the intention of converting buffer to ASCII hex dump in read method.
I have a local change to remove that so that it can deal with any data
in any format(e.g. some protocol format) and userspace can deal with the
actual interpretation of the data. Let me know your thoughts on that.

Regards,
Sudeep

Sudeep Holla (4):
  mailbox: mailbox-test: rename driver as generic test driver
  mailbox: mailbox-test: fix the compatible string
  mailbox: mailbox-test: use print_hex_dump_bytes to allow dynamic
    printk
  mailbox: mailbox-test: add support for separate tx/rx buffer with
    single channel

 .../devicetree/bindings/mailbox/sti-mailbox.txt    |  2 +-
 drivers/mailbox/mailbox-test.c                     | 50 ++++++++++++----------
 2 files changed, 29 insertions(+), 23 deletions(-)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
