From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 4/6] usb:common Simplify usb_decode_get_set_descriptor
 function.
Date: Mon, 4 Feb 2019 12:47:26 +0100
Message-ID: <20190204114726.GC28608@kroah.com>
References: <1548935553-452-1-git-send-email-pawell@cadence.com>
 <1548935553-452-5-git-send-email-pawell@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1548935553-452-5-git-send-email-pawell@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Laszczak <pawell@cadence.com>
Cc: devicetree@vger.kernel.org, mark.rutland@arm.com, linux-usb@vger.kernel.org, hdegoede@redhat.com, heikki.krogerus@linux.intel.com, andy.shevchenko@gmail.com, robh+dt@kernel.org, rogerq@ti.com, linux-kernel@vger.kernel.org, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, pjez@cadence.com, kurahul@cadence.com
List-Id: devicetree@vger.kernel.org

On Thu, Jan 31, 2019 at 11:52:31AM +0000, Pawel Laszczak wrote:
> Patch moves switch responsible for decoding descriptor type
> outside snprintf. It's little improves code readability.

Should that last sentence read: "It improves code readability a little"?

thanks,

greg k-h
