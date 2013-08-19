Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:54700 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751115Ab3HSToE (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Mon, 19 Aug 2013 15:44:04 -0400
Message-ID: <5212757F.2080107@wwwdotorg.org>
Date: Mon, 19 Aug 2013 13:43:59 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [RFC 2/4] driver core: Allow early registration of devices
References: <1376685563-1053-1-git-send-email-treding@nvidia.com> <1376685563-1053-3-git-send-email-treding@nvidia.com> <20130816210637.GC2198@kroah.com> <20130816215530.GA14464@mithrandir> <20130816220807.GA6848@kroah.com> <20130817111747.GB1536@mithrandir>
In-Reply-To: <20130817111747.GB1536@mithrandir>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Hiroshi Doyu <hdoyu@nvidia.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 08/17/2013 05:17 AM, Thierry Reding wrote:
...
> Well, the most obvious cases where early initialization is needed
> are interrupt controllers and clocks.

... and IOMMUs, which apparently need to initialize before any devices
whose transactions are routed through the IOMMU, in order to set
themselves up as the IOMMU for the relevant devices.

It's possible that the CPU-visible bus structure isn't a strict
inverse/reverse of the device-visible bus-structure. A device may have
CPU-visible registers on one bus segment, but inject master
transactions onto an unrelated bus segment. So it may not be as simple
as making a bus driver for the bus segment affected by the IOMMU, and
having that driver trigger instantiation of all its children.
