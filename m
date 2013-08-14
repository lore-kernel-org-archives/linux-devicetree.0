Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:56674 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933270Ab3HNVoU (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 14 Aug 2013 17:44:20 -0400
Message-ID: <520BFA31.1020508@wwwdotorg.org>
Date: Wed, 14 Aug 2013 15:44:17 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] ARM: tegra: add Mic Jack to Cardhu device tree
References: <1376512027-28245-1-git-send-email-swarren@wwwdotorg.org> <1376512027-28245-2-git-send-email-swarren@wwwdotorg.org> <20130814213700.GA21728@ulmo>
In-Reply-To: <20130814213700.GA21728@ulmo>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

On 08/14/2013 03:37 PM, Thierry Reding wrote:
> On Wed, Aug 14, 2013 at 02:27:07PM -0600, Stephen Warren wrote:
>> From: Stephen Warren <swarren@nvidia.com>
>> 
>> This enables the microphone input jack, and hence allows audio to
>> be captured as well as played back.
>> 
>> Signed-off-by: Stephen Warren <swarren@nvidia.com> --- 
>> arch/arm/boot/dts/tegra114-dalmore.dts | 4 +++-
> 
> The commit subject says Cardhu, but you modify the Dalmore DTS
> here.

Yup. I'll fix that up when applying this.
