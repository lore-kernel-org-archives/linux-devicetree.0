From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v1 07/12] usb: roles: Find the usb role switch by also
 matching against the device node
Date: Fri, 25 Jan 2019 14:35:40 +0200
Message-ID: <20190125123540.GA7262@kuha.fi.intel.com>
References: <20181203034515.91412-1-chenyu56@huawei.com>
 <20181203034515.91412-8-chenyu56@huawei.com>
 <CAHp75VfUKAQ+Q0cQz-4-=i2JL9uACBX1bVvCeNjZLL1HStDGKQ@mail.gmail.com>
 <20181203122534.GD24338@kuha.fi.intel.com>
 <e9a8f745-6211-d6d2-24f0-ac86f82924f0@huawei.com>
 <20190121135135.GA22960@kuha.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190121135135.GA22960@kuha.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen Yu <chenyu56@huawei.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, liuyu712@hisilicon.com, USB <linux-usb@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Suzhuangluan <suzhuangluan@hisilicon.com>, Kongfei <kongfei@hisilicon.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hdegoede@redhat.com>, John Stultz <john.stultz@linaro.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 21, 2019 at 03:51:35PM +0200, Heikki Krogerus wrote:
> Hi,
> 
> On Mon, Jan 21, 2019 at 04:36:13PM +0800, Chen Yu wrote:
> > Have the fwnode_get_name() patches been accepted?
> 
> No, I didn't have a user for the function anymore:
> https://lkml.org/lkml/2018/12/17/284
> 
> > And I will be grateful if you can tell me your plan about the
> > https://lkml.org/lkml/2018/10/24/619 patches.
> 
> The plan is to send a new version of them together with the
> fwnode_get_name() patch. I can send them this week.

I'm about to send the graph support for the device connection API, but
just letting you know that I did not need the fwnode_get_name() in the
end in that series unfortunately.


Br,

-- 
heikki
