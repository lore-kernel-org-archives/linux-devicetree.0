Return-Path: <devicetree-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:47556 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756398Ab3HONfv convert rfc822-to-8bit (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Thu, 15 Aug 2013 09:35:51 -0400
Message-ID: <1376573746.18617.45.camel@hornet>
Subject: Re: [PATCH v3] hwspinlock/msm: Add support for Qualcomm MSM HW
 Mutex block
From: Pawel Moll <pawel.moll@arm.com>
Date: Thu, 15 Aug 2013 14:35:46 +0100
In-Reply-To: <1376507361-26907-1-git-send-email-galak@codeaurora.org>
References: <1376507361-26907-1-git-send-email-galak@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: devicetree-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: "ohad@wizery.com" <ohad@wizery.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Mark Rutland <Mark.Rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Eric Holmberg <eholmber@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>

On Wed, 2013-08-14 at 20:09 +0100, Kumar Gala wrote:
> +Required properties:
> +- compatible: should be "qcom,tcsr-mutex"
> +- reg: Should contain registers location and length of mutex registers
> +- reg-names:
> +	"mutex-base"  - string to identify mutex registers

Just out of curiosity, why is reg-names required? Especially if there
seem to be only one set of registers?

Paweł


