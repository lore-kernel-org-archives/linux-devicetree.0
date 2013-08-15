Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:39724 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756256Ab3HOPhy (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Thu, 15 Aug 2013 11:37:54 -0400
Message-ID: <520CF5CF.6040205@wwwdotorg.org>
Date: Thu, 15 Aug 2013 09:37:51 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ARM: tegra: add Mic Jack to Beaver device tree
References: <1376512027-28245-1-git-send-email-swarren@wwwdotorg.org>
In-Reply-To: <1376512027-28245-1-git-send-email-swarren@wwwdotorg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

On 08/14/2013 02:27 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
> 
> This enables the microphone input jack, and hence allows audio to be
> captured as well as played back.

I've applied this series to Tegra's for-3.12/dt branch, with patch 2/2's
subject line fixed to s/Cardhu/Dalmore/.
