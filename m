Return-Path: <devicetree-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:19726 "EHLO
	hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757082Ab3GZVuK convert rfc822-to-8bit (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Fri, 26 Jul 2013 17:50:10 -0400
From: Andrew Chew <AChew@nvidia.com>
Date: Fri, 26 Jul 2013 14:50:09 -0700
Subject: RE: [PATCH] mfd: palmas: Add DVFS mux setting
Message-ID: <643E69AA4436674C8F39DCC2C05F763862A1274113@HQMAIL03.nvidia.com>
References: <1374871308-490-1-git-send-email-achew@nvidia.com>
 <51F2E74E.2060107@wwwdotorg.org>
 <643E69AA4436674C8F39DCC2C05F763862A12740FB@HQMAIL03.nvidia.com>
 <51F2EC66.2080200@wwwdotorg.org>
In-Reply-To: <51F2EC66.2080200@wwwdotorg.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "ian.campbell@citrix.com" <ian.campbell@citrix.com>, "rob@landley.net" <rob@landley.net>, "sameo@linux.intel.com" <sameo@linux.intel.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "ian@slimlogic.co.uk" <ian@slimlogic.co.uk>, "j-keerthy@ti.com" <j-keerthy@ti.com>, "gg@slimlogic.co.uk" <gg@slimlogic.co.uk>, Laxman Dewangan <ldewangan@nvidia.com>, Rhyland Klein <rklein@nvidia.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

> >> How does this interact with the pinctrl driver that Laxman just sent
> >> for Palmas?
> >>
> >> https://lkml.org/lkml/2013/7/26/141
> >> [PATCH 0/2] pinctrl: palmas: add pincontrol driver
> >
> > Thanks for pointing this out.  Given this:
> >
> > +Optional properties:
> > +- ti,palams-enable-dvfs1: Enable DVFS1. Configure pins for DVFS1 mode.
> > +- ti,palams-enable-dvfs2: Enable DVFS2. Configure pins for DVFS2 mode.
> >
> > I think his work already encompasses what my patch is supposed to do.
> >
> > Abandoning this patch.
> 
> OK, that's simple!
> 
> Are the existing ti,mux-pad1/ti,mux-pad2 properties already in the binding
> redundant with Laxman's pinctrl driver?

In linux-next (where I based my work), yes, those two properties already exist,
and as far as I understand it, are redundant with Laxman's pinctrl driver.
I expect those properties will go away with Laxman's pinctrl driver.
