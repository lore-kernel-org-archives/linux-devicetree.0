From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [RFC][PATCH 2/3] usb: roles: Add usb role switch notifier.
Date: Thu, 3 Oct 2019 13:26:18 +0200
Message-ID: <20191003112618.GA2420393@kroah.com>
References: <20191002231617.3670-1-john.stultz@linaro.org>
 <20191002231617.3670-3-john.stultz@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191002231617.3670-3-john.stultz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>
Cc: lkml <linux-kernel@vger.kernel.org>, Yu Chen <chenyu56@huawei.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Felipe Balbi <balbi@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Jun Li <lijun.kernel@gmail.com>, Valentin Schneider <valentin.schneider@arm.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 02, 2019 at 11:16:16PM +0000, John Stultz wrote:
> From: Yu Chen <chenyu56@huawei.com>
> 
> This patch adds notifier for drivers want to be informed of the usb role
> switch.

Ick, I hate notifiers, they always come back to cause problems.

What's just wrong with a "real" call to who ever needs to know this?
And who does need to know this anyway?  Like Hans said, if we don't have
a user for it, we should not add it.

thanks,

greg k-h
