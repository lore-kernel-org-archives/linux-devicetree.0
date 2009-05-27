From: "M. Warner Losh" <imp@bsdimp.com>
Subject: Re: [RFC] [PATCH] Device Tree on ARM platform
Date: Wed, 27 May 2009 14:35:16 -0600 (MDT)
Message-ID: <20090527.143516.-1836205167.imp@bsdimp.com>
References: <4A1D9A1E.80603@freescale.com>
	<4A1D9A66.5020002@freescale.com>
	<20090527.132553.40558501.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758898AbZE0Uoh@vger.kernel.org>
In-Reply-To: <20090527.132553.40558501.davem@davemloft.net>
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net
Cc: timur@freescale.com, rmk+lkml@arm.linux.org.uk, devicetree-discuss@ozlabs.org, linux-kernel@vger.kernel.org, scottwood@freescale.com, yuan-bo.ye@motorola.com, linux-arm-kernel@lists.arm.linux.org.uk
List-Id: devicetree@vger.kernel.org

In message: <20090527.132553.40558501.davem@davemloft.net>
            David Miller <davem@davemloft.net> writes:
: From: Timur Tabi <timur@freescale.com>
: Date: Wed, 27 May 2009 14:54:14 -0500
: 
: > How does a Linux driver normally get a MAC address if it's not
: > passed via the device tree and it isn't already programmed in the
: > hardware?  Is there some file in /etc that stores these things?
: 
: It depends.  Some devices have EEPROM's that store the permanently
: assigned MAC address, some have NVRAM for this, and yet other's put it
: into the PCI ROM.

Some also put it into their CIS for things like PC Card, CardBus and
SDIO too.  It is the definition of device specific :).

: Some platforms that have real OF device trees often do not put the
: permanent MAC address into the EEPROM or NVRAM even if it is
: customary to do so on a particular device.  The MAC has to be
: obtained from the OF device tree.

This is but one of many ways to get it...

Warner
