Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:41451 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760395Ab3GZVRG (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Fri, 26 Jul 2013 17:17:06 -0400
Message-ID: <51F2E74E.2060107@wwwdotorg.org>
Date: Fri, 26 Jul 2013 15:17:02 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [PATCH] mfd: palmas: Add DVFS mux setting
References: <1374871308-490-1-git-send-email-achew@nvidia.com>
In-Reply-To: <1374871308-490-1-git-send-email-achew@nvidia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Andrew Chew <achew@nvidia.com>
Cc: rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, ian.campbell@citrix.com, rob@landley.net, sameo@linux.intel.com, lee.jones@linaro.org, grant.likely@linaro.org, ian@slimlogic.co.uk, j-keerthy@ti.com, gg@slimlogic.co.uk, ldewangan@nvidia.com, rklein@nvidia.com, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 07/26/2013 02:41 PM, Andrew Chew wrote:
> There exists a PRIMARY_SECONDARY_PAD3 in the same register base as
> PRIMARY_SECONDARY_PAD2, which controls the function of certain pins. Add
> a property for this setting.

How does this interact with the pinctrl driver that Laxman just sent for
Palmas?

https://lkml.org/lkml/2013/7/26/141
[PATCH 0/2] pinctrl: palmas: add pincontrol driver

