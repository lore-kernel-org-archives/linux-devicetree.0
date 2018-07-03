Return-Path: <SRS0=7ojG=JT=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:49700 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752216AbeGCGhF (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 3 Jul 2018 02:37:05 -0400
Date: Mon, 2 Jul 2018 23:37:02 -0700
From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] ARM: dts: am3517-evm: Remove unnessary PMIC parameters
Message-ID: <20180703063702.GC112168@atomide.com>
References: <20180519204808.28899-1-aford173@gmail.com>
 <CAHCN7xJ2ddUxeN=62FrhhE4VRyieNQYawXrzdfK0oHHEJocSAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xJ2ddUxeN=62FrhhE4VRyieNQYawXrzdfK0oHHEJocSAw@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Adam Ford <aford173@gmail.com>
Cc: linux-omap@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>, Derald Woods <woods.technical@gmail.com>
List-ID: <devicetree@vger.kernel.org>

* Adam Ford <aford173@gmail.com> [180619 22:48]:
> On Sat, May 19, 2018 at 3:48 PM Adam Ford <aford173@gmail.com> wrote:
> >
> > The AM3517-EVM uses a TPS65023 PMIC.  This is already defined
> > by:  compatible = "ti,tps65023"
> >
> > There doesn't seem to be a need to have each regulator in the
> > PMIC with the 'compatible = "regulator-fixed"' since each
> > regulator has a min and max setting.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> >
> 
> Gentle nudge

Sorry for the delay, applying into omap-for-v4.19/dt thanks.

Regards,

Tony
