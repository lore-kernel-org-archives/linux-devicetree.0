Return-Path: <SRS0=byPw=N6=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:54558 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730059AbeKTEm2 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 19 Nov 2018 23:42:28 -0500
Date: Mon, 19 Nov 2018 10:17:45 -0800
From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 0/3] ARM: dts: am3/am4/dra7 clkctrl data conversion
Message-ID: <20181119181745.GU53235@atomide.com>
References: <1535728491-25321-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1535728491-25321-1-git-send-email-t-kristo@ti.com>
Sender: devicetree-owner@vger.kernel.org
To: Tero Kristo <t-kristo@ti.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

* Tero Kristo <t-kristo@ti.com> [180831 08:19]:
> Hi,
> 
> This series converts the clkctrl data on am3/am4/dra7 to be split
> based on the clockdomain boundaries, instead of current CM node
> split.

These are applied into omap-for-v4.21/dt-ti-sysc and should be
hitting next soon.

Thanks,

Tony
