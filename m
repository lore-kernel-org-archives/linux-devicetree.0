From: Richard Leitner <richard.leitner@skidata.com>
Subject: Re: [PATCH v3 1/3] lib/string: introduce ascii2utf16le() helper
Date: Mon, 6 Feb 2017 16:43:42 +0100
Message-ID: <9e902f74-0ea7-47f7-9608-6d6710a82943@skidata.com>
References: <Pine.LNX.4.44L0.1702061035400.2010-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44L0.1702061035400.2010-100000@iolanthe.rowland.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com, akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com, keescook@chromium.org, dev@g0hl1n.net
List-Id: devicetree@vger.kernel.org

On 02/06/2017 04:40 PM, Alan Stern wrote:
> On Mon, 6 Feb 2017, Richard Leitner wrote:
>> So it would be OK to include linux/nls.h and use utf8s_to_utf16s() in
>> drivers/usb/{core/hcd.c,misc/usb251xb.c}?
> 
> Well, we already include linux/nls.h in drivers/usb/core/message.c and
> a few files under drivers/usb/gadget.  Putting it in a few more places
> shouldn't hurt.

OK. Thanks! I will change that for v4.

regards,
Richard L
