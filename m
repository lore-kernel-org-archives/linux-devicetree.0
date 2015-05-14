From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 5/5] usb: add pxa1928 ehci support
Date: Thu, 14 May 2015 12:42:20 +0200
Message-ID: <6133267.5eXXf8lNuG@wuerfel>
References: <1431557340-5421-1-git-send-email-robh@kernel.org> <1431557340-5421-6-git-send-email-robh@kernel.org> <1431591878.2650.26.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431591878.2650.26.camel@x220>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, Kishon Vijay Abraham I <kishon@ti.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thursday 14 May 2015 10:24:38 Paul Bolle wrote:
> 
> > --- a/drivers/usb/host/Makefile
> > +++ b/drivers/usb/host/Makefile
> 
> > +obj-$(CONFIG_USB_EHCI_MV_OF) += ehci-mv-of.o
> 
> USB_EHCI_MV_OF is a bool symbol so ehci-mv-of.o will never be part of a
> module, correct?
> 
> 

I think that's a bug.

	Arnd
