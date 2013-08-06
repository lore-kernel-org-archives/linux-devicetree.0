Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:41934 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756180Ab3HFSAH (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Tue, 6 Aug 2013 14:00:07 -0400
Received: by mail-ob0-f182.google.com with SMTP id wo10so1553779obc.41
        for <devicetree@vger.kernel.org>; Tue, 06 Aug 2013 11:00:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20130802075122.GK24465@radagast>
References: <1375404726-26264-1-git-send-email-jwerner@chromium.org>
	<1375404726-26264-2-git-send-email-jwerner@chromium.org>
	<20130802075122.GK24465@radagast>
Date: Tue, 6 Aug 2013 11:00:05 -0700
Message-ID: <CAODwPW8+Lcgomh6ij+AwqVOMrUnOsnSc4w_BwTkZgB72MgpQvQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] usb: phy-samsung-usb: Simplify PMU register handling
From: Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset=ISO-8859-1
Sender: devicetree-owner@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Kukjin Kim <kgene.kim@samsung.com>
Cc: Julius Werner <jwerner@chromium.org>, LKML <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, Vivek Gautam <gautam.vivek@samsung.com>, devicetree@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Aug 2, 2013 at 12:51 AM, Felipe Balbi <balbi@ti.com> wrote:
> Hi,
>
> I need an Acked-by for the dtsi part. Ideally from Exynos 5 maintainer
> and at least one of the DT maintainers.
>
> --
> balbi

Okay, I think I forgot to update the DT bindings documentation
anyway... so I will resubmit this and address some more DT people
directly to get that ACK.
