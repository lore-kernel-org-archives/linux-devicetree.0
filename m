Return-Path: <SRS0=iDeF=UR=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:50074 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726446AbfFRGmX (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 18 Jun 2019 02:42:23 -0400
Date: Tue, 18 Jun 2019 08:33:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 8/8] xhci: tegra: enable ELPG for runtime/system PM
Message-ID: <20190618063322.GA10079@kroah.com>
References: <20190614074824.22023-1-jckuo@nvidia.com>
 <20190614074824.22023-4-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190614074824.22023-4-jckuo@nvidia.com>
Sender: devicetree-owner@vger.kernel.org
To: JC Kuo <jckuo@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, pdeschrijver@nvidia.com, afrid@nvidia.com, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com, skomatineni@nvidia.com
List-ID: <devicetree@vger.kernel.org>

On Fri, Jun 14, 2019 at 03:48:24PM +0800, JC Kuo wrote:
> This commit enables XUSB host controller ELPG for runtime and system
> power management.
> 
> NEED CLEANUP.

Odd kernel changelog comment...

Please cleanup when you resend. :)

thanks,

greg k-h
