From: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH v4 13/21] misc: support for LP-8x4x custom parallel bus
Date: Wed, 16 Apr 2014 19:41:09 +0100
Message-ID: <20140416194109.3ef914d2@alan.etchedpixels.co.uk>
References: <1397668411-27162-7-git-send-email-ynvich@gmail.com>
	<1397668667-27328-1-git-send-email-ynvich@gmail.com>
	<1397668667-27328-7-git-send-email-ynvich@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1397668667-27328-7-git-send-email-ynvich@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergei Ianovich <ynvich@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grant Likely <grant.likely@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, 16 Apr 2014 21:17:18 +0400
Sergei Ianovich <ynvich@gmail.com> wrote:

> This patch implements probing for the bus and reporting the number
> of available expansion slots.

This appears to be a bus not a misc device. I don't think it belongs in
misc. As you've got devices on this bus (or nailed into the 'bus' driver)
perhaps this belongs as drivers/platform/lp8x4x or similar with any
specific drivers split out - or even drivers/lp8x4x if there will be more
of them and more than one platform using it ?

Alan
