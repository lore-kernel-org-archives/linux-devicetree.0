Return-Path: <SRS0=GwrK=VF=vger.kernel.org=devicetree-owner@kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:8648 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbfGHHzv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 8 Jul 2019 03:55:51 -0400
Date: Mon, 8 Jul 2019 10:55:47 +0300
From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH 3/8] phy: tegra: xusb: t210: rearrange UPHY init
Message-ID: <20190708075547.GC12715@pdeschrijver-desktop.Nvidia.com>
References: <20190614074652.21960-1-jckuo@nvidia.com>
 <20190614074652.21960-4-jckuo@nvidia.com>
 <1a57e3e6-a9b2-87ba-a76b-1785ddd0d935@nvidia.com>
 <94af84e5-5bc3-d481-b784-c0e0dd2b7859@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <94af84e5-5bc3-d481-b784-c0e0dd2b7859@nvidia.com>
Sender: devicetree-owner@vger.kernel.org
To: JC Kuo <jckuo@nvidia.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, gregkh@linuxfoundation.org, thierry.reding@gmail.com, afrid@nvidia.com, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com, skomatineni@nvidia.com
List-ID: <devicetree@vger.kernel.org>

On Fri, Jul 05, 2019 at 02:48:49PM +0800, JC Kuo wrote:
> > Looks like you are moving all the code from the port enable to the phy
> > enable and after this change the port enable does nothing. Do we not
> > differentiate between phy and port? I think a bit more description is
> > necessary here to describe the impact of this change.
> Sorry that I am not sure whether I should use "LP0" or "SC7" for Linux system
> suspend (either to ram or disk). Should I use SC7 instead of LP0?

Please use SC7 rather than LP0.

Peter.
