Return-Path: <devicetree-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:57915 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751180Ab3HSLM7 convert rfc822-to-8bit (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Mon, 19 Aug 2013 07:12:59 -0400
Message-ID: <1376910775.3157.1.camel@hornet>
Subject: Re: [PATCH v3] hwspinlock/msm: Add support for Qualcomm MSM HW
 Mutex block
From: Pawel Moll <pawel.moll@arm.com>
Date: Mon, 19 Aug 2013 12:12:55 +0100
In-Reply-To: <520EADBC.9090608@wwwdotorg.org>
References: <1376507361-26907-1-git-send-email-galak@codeaurora.org>
	 <1376573746.18617.45.camel@hornet> <520EADBC.9090608@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: devicetree-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Kumar Gala <galak@codeaurora.org>, "ohad@wizery.com" <ohad@wizery.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Mark Rutland <Mark.Rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Eric Holmberg <eholmber@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>

On Fri, 2013-08-16 at 23:54 +0100, Stephen Warren wrote:
> Indeed, I tend to think that reg-names is a bad idea.
> 
> IIRC, the rule for "reg" is that entries must always have a defined
> order, so that it can always be accessed by integer index. 

First time I hear about that rule, really...

> And given
> that's true, allowing for reg-names just creates confusion since it
> implies you can look up the index in reg-names and then read reg at that
> index.

I actually believe that named resources leave less are for error than
indexed ones. And this is the message I remember being "spread" in the
times of static platform devices.

Pawel


