Return-Path: <SRS0=iDeF=UR=vger.kernel.org=devicetree-owner@kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:1575 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbfFRICB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 18 Jun 2019 04:02:01 -0400
Subject: Re: [PATCH 8/8] xhci: tegra: enable ELPG for runtime/system PM
References: <20190614074824.22023-1-jckuo@nvidia.com>
 <20190614074824.22023-4-jckuo@nvidia.com> <20190618063322.GA10079@kroah.com>
From: JC Kuo <jckuo@nvidia.com>
Message-ID: <40374770-912a-f4fb-a90e-ea0bccceaad0@nvidia.com>
Date: Tue, 18 Jun 2019 16:01:56 +0800
MIME-Version: 1.0
In-Reply-To: <20190618063322.GA10079@kroah.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, pdeschrijver@nvidia.com, afrid@nvidia.com, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com, skomatineni@nvidia.com
List-ID: <devicetree@vger.kernel.org>

Hi Greg,
Code cleanup was done but I forgot the "NEED CLEANUP" in the commit comment. Sorry for that. I will wait for review comments to come and fix the commit message together with code improvements.

Thanks,
JC

On 6/18/19 2:33 PM, Greg KH wrote:
> On Fri, Jun 14, 2019 at 03:48:24PM +0800, JC Kuo wrote:
>> This commit enables XUSB host controller ELPG for runtime and system
>> power management.
>>
>> NEED CLEANUP.
> 
> Odd kernel changelog comment...
> 
> Please cleanup when you resend. :)
> 
> thanks,
> 
> greg k-h
> 
