From: Richard Leitner <richard.leitner@skidata.com>
Subject: Re: [PATCH v4] usb: misc: add USB251xB/xBi Hi-Speed Hub Controller
 Driver
Date: Thu, 9 Feb 2017 09:44:17 +0100
Message-ID: <ecede753-026c-9d59-b4ac-4eae3ff2fdbb@skidata.com>
References: <1486543976-28006-1-git-send-email-richard.leitner@skidata.com>
 <1486560068.2133.395.camel@linux.intel.com> <20170208135957.GA916@kroah.com>
 <96c8a6f9-3b93-8ba0-22b1-502e22dac31c@skidata.com>
 <1486572009.2133.406.camel@linux.intel.com>
 <80e533b6-4eb3-0019-fe18-82dd0d7aaa1c@g0hl1n.net>
 <1486581644.2133.409.camel@linux.intel.com>
 <3902c4a9-cd1d-23fe-df75-127b5cab61ad@g0hl1n.net>
 <1486585012.2133.420.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1486585012.2133.420.camel@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Richard Leitner <dev@g0hl1n.net>, Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, stern@rowland.harvard.edu
List-Id: devicetree@vger.kernel.org

On 02/08/2017 09:16 PM, Andy Shevchenko wrote:
> On Wed, 2017-02-08 at 21:03 +0100, Richard Leitner wrote:
>> Should I keep my inline {clr,set}_bit_in_byte() 
>> functions an use BIT() in there, or delete them and use BIT()
>> directly 
>> in usb251xb_get_ofdata() ?
> 
> Does it make any sense?
> 
> Even just name of your function is longer than what it substitutes.

Well, you're right :-)
So I'll change that for v5.

Thanks!
