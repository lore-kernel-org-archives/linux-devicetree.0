From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 14/18] ARM: mvebu: Add support for USB cluster on the
 Armada 375 SoC
Date: Fri, 25 Apr 2014 17:59:23 +0200
Message-ID: <20140425155923.GD12472@lunn.ch>
References: <1398434836-18908-1-git-send-email-gregory.clement@free-electrons.com>
 <1398434836-18908-15-git-send-email-gregory.clement@free-electrons.com>
 <20140425154320.GA20801@arch.cereza>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140425154320.GA20801@arch.cereza>
Sender: linux-kernel-owner@vger.kernel.org
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Cc: Gregory CLEMENT <gregory.clement@free-electrons.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> > +			 * We can't use usb2 and usb3 in the same time, so let's
> > +			 * disbale usb2 and complain about it to the user askinf
> 
> typos: disable, asking

And it should be "at the same time", not in.

    Andrew
