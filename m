Return-Path: <devicetree-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:45373 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753323Ab3HGTlg (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Wed, 7 Aug 2013 15:41:36 -0400
Message-ID: <5202A2EC.2070907@wwwdotorg.org>
Date: Wed, 07 Aug 2013 13:41:32 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] pinctrl: clean up pinconfig-generic documentation
References: <1375739760-18833-1-git-send-email-swarren@wwwdotorg.org> <CACRpkdb1qSO2OhFebgAPESAzRySaCyQcBH97s4E7+F-3wmXZpw@mail.gmail.com>
In-Reply-To: <CACRpkdb1qSO2OhFebgAPESAzRySaCyQcBH97s4E7+F-3wmXZpw@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Pawel Moll <pawel.moll@arm.com>, Rob Herring <rob.herring@calxeda.com>, Ian Campbell <ian.campbell@citrix.com>, Mark Rutland <mark.rutland@arm.com>, Laxman Dewangan <ldewangan@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Warren <swarren@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

On 08/07/2013 01:32 PM, Linus Walleij wrote:
> On Mon, Aug 5, 2013 at 11:55 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> 
>> From: Stephen Warren <swarren@nvidia.com>
>>
>> Reword the section of pinctrl-bindings.txt that describes generic
>> properties that pinctrl bindings may use. The aim is to make the text
>> clearer, and more explicitly call out the responsibility of individual
>> bindings that use the generic properties to define which of the
>> properties are used, and how.
>>
>> Signed-off-by: Stephen Warren <swarren@nvidia.com>
>> ---
>> LinusW, Laxman, this is the binding doc cleanup I mentioned I was going
>> to send when reviewing Laxman's Palmas pinctrl driver.
> 
> Looks good to me.
> Patch applied.

I assume just patch 1? There was a v2 of patch 2.

