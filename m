From: Andreas Larsson <andreas@gaisler.com>
Subject: Re: [PATCH] usb: gadget: Add UDC driver for Aeroflex Gaisler GRUSBDC
Date: Wed, 28 Aug 2013 11:02:22 +0200
Message-ID: <521DBC9E.9080001@gaisler.com>
References: <1376316310-27989-1-git-send-email-andreas@gaisler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1376316310-27989-1-git-send-email-andreas@gaisler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, software@gaisler.com
List-Id: devicetree@vger.kernel.org

On 2013-08-12 16:05, Andreas Larsson wrote:
> This adds an UDC driver for GRUSBDC USB Device Controller cores available in the
> GRLIB VHDL IP core library. The driver only supports DMA mode.

Any comments? It would be great to get feedback soon in case some things 
need to be changed for this driver to be accepted. Thanks!

Cheers,
Andreas Larsson
