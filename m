From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/2] phy: usbphy: Add dt documentation for Broadcom Cygnus USB PHY driver
Date: Tue, 17 Feb 2015 21:53:36 +0100
Message-ID: <2797126.uqvyZJisPk@wuerfel>
References: <1424200821-16368-1-git-send-email-arun.ramamurthy@broadcom.com> <8242260.cl4QTECoeX@wuerfel> <54E39DF1.50409@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54E39DF1.50409@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Arun Ramamurthy <arun.ramamurthy@broadcom.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, Jonathan Richardson <jonathar@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org, Dmitry Torokhov <dtor@google.com>, Anatol Pomazau <anatol@google.com>
List-Id: devicetree@vger.kernel.org

On Tuesday 17 February 2015 12:00:49 Arun Ramamurthy wrote:
> Arnd, I patched the ehci and ohci driver to accept multiple phys so they 
> require different names and cannot both be "usb". That patch was 
> accepted by Alen Stern but I did not update the bindings documentation.
> I will send out another patch for that. Could we go with the naming 
> scheme of "usb" + "p" + port number or do you have other suggestions?

I don't have a good idea, but I think it would be best if the first
phy could remain named "usb" for compatibility with the existing binding.

What is the reason for having two phys in your case? Are these
identical phy devices connected to a single controller or do they
server different purposes?

	Arnd
