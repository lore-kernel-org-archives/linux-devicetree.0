From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] ARM: dts: sunxi: Adjust touchscreen compatible for sun5i
 and later
Date: Fri, 26 Jun 2015 09:42:41 -0700
Message-ID: <20150626164241.GD13320@kroah.com>
References: <1435322859-27760-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1435322859-27760-1-git-send-email-hdegoede@redhat.com>
Sender: stable-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: stable@vger.kernel.org, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org, devicetree <devicetree@vger.kernel.org>, m.silentcreek@gmail.com
List-Id: devicetree@vger.kernel.org

On Fri, Jun 26, 2015 at 02:47:39PM +0200, Hans de Goede wrote:
> This is a manual cherry pick of a commit currently queued up for merging
> into 4.2, titled:
> "ARM: dts: sunxi Adjust touchscreen compatible for sun5i and later"
> 
> For the 4.1 stable series, fixing a regression in 4.1 where we are now
> reporting the wrong SoC temperature for sun5i and sun7i SoCs.

What is the git commit id of it?  I can't do anything with this until it
hits Linus's tree.

thanks,

greg k-h
