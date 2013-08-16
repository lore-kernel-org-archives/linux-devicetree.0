Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:56847 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756381Ab3HQAdI (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Fri, 16 Aug 2013 20:33:08 -0400
Message-ID: <520EADBC.9090608@wwwdotorg.org>
Date: Fri, 16 Aug 2013 16:54:52 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3] hwspinlock/msm: Add support for Qualcomm MSM HW Mutex
 block
References: <1376507361-26907-1-git-send-email-galak@codeaurora.org> <1376573746.18617.45.camel@hornet>
In-Reply-To: <1376573746.18617.45.camel@hornet>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Pawel Moll <pawel.moll@arm.com>
Cc: Kumar Gala <galak@codeaurora.org>, "ohad@wizery.com" <ohad@wizery.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Mark Rutland <Mark.Rutland@arm.com>, Ian Campbell <ian.campbell@citrix.com>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Jeffrey Hugo <jhugo@codeaurora.org>, Eric Holmberg <eholmber@codeaurora.org>
List-ID: <devicetree@vger.kernel.org>

On 08/15/2013 07:35 AM, Pawel Moll wrote:
> On Wed, 2013-08-14 at 20:09 +0100, Kumar Gala wrote:
>> +Required properties:
>> +- compatible: should be "qcom,tcsr-mutex"
>> +- reg: Should contain registers location and length of mutex registers
>> +- reg-names:
>> +	"mutex-base"  - string to identify mutex registers
> 
> Just out of curiosity, why is reg-names required? Especially if there
> seem to be only one set of registers?

Indeed, I tend to think that reg-names is a bad idea.

IIRC, the rule for "reg" is that entries must always have a defined
order, so that it can always be accessed by integer index. And given
that's true, allowing for reg-names just creates confusion since it
implies you can look up the index in reg-names and then read reg at that
index.

Now the same isn't true for clocks/clock-names for example, where it's
defined that there is no order, so you must search clock-names first.

Inconsistency in rules, uggh.
