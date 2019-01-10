From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 5/5] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Thu, 10 Jan 2019 07:57:38 +0100
Message-ID: <20190110065738.GA28817@kroah.com>
References: <1545577992-4013-1-git-send-email-pawell@cadence.com>
 <1545577992-4013-6-git-send-email-pawell@cadence.com>
 <CAL411-oF2j1Xjz60Q3B1beBoUoFUxN+rBi9_Z0nx7R2P0p_3tg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL411-oF2j1Xjz60Q3B1beBoUoFUxN+rBi9_Z0nx7R2P0p_3tg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Chen <hzpeterchen@gmail.com>
Cc: Pawel Laszczak <pawell@cadence.com>, devicetree@vger.kernel.org, mark.rutland@arm.com, linux-usb@vger.kernel.org, hdegoede@redhat.com, Heikki Krogerus <heikki.krogerus@linux.intel.com>, andy.shevchenko@gmail.com, robh+dt@kernel.org, rogerq@ti.com, lkml <linux-kernel@vger.kernel.org>, adouglas@cadence.com, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, pjez@cadence.com, kurahul@cadence.com
List-Id: devicetree@vger.kernel.org

On Thu, Jan 10, 2019 at 09:30:41AM +0800, Peter Chen wrote:
> On Mon, Dec 24, 2018 at 12:44 AM Pawel Laszczak <pawell@cadence.com> wrote:
> - debugfs is nice to have feature, I suggest removing it at this
> initial version. Besides, role switch
> through /sys is normal feature, the end user may use it at real
> product, so, it is better at device's
> /sys entry instead of debugfs.
> 
> - I don't know why you add "disable" at debugfs, please comment.

As you imply here, no real-world functionality should ever be in
debugfs as it is an optional system component and kernel code should
work just fine without it being enabled (as more and more systems are
disabling it due to the obvious security problems it has.)

thanks,

greg k-h
