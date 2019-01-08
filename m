Return-Path: <SRS0=mSv1=PQ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:60722 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728123AbfAHP4J (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 8 Jan 2019 10:56:09 -0500
Date: Tue, 8 Jan 2019 07:56:06 -0800
From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] ARM: dts: omap3-gta04: Fix graph_port warning
Message-ID: <20190108155606.GM5544@atomide.com>
References: <20190107160512.9480-1-tony@atomide.com>
 <ED6668F3-73A7-49A1-A7C7-E54381841222@goldelico.com>
 <CAL_Jsq+RQMjeH+YTphrXBQRdpUse1rSvPGdJiqcoRQWMPT+-ZQ@mail.gmail.com>
 <20190107183419.GG5544@atomide.com>
 <DE542A85-9B46-4AA4-B4E8-8880D23355EC@goldelico.com>
 <46dce758-2339-c4ef-891b-5cf4522fb7df@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46dce758-2339-c4ef-891b-5cf4522fb7df@ti.com>
Sender: devicetree-owner@vger.kernel.org
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>, Rob Herring <robh@kernel.org>, linux-omap <linux-omap@vger.kernel.org>, =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>, devicetree <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

* Tomi Valkeinen <tomi.valkeinen@ti.com> [190108 07:57]:
> On 07/01/19 21:34, H. Nikolaus Schaller wrote:
> 
> >>> If there's only one port, then it is redundant and you should drop reg
> >>> instead.
> > 
> > If I remember correctly it was required by older omapdrm code (which
> > did scan for a reg property) but that may have changed. Therefore I've
> > added Tomi to this discussion.
> 
> I don't think so. The code looks for 'reg', but if it's not there, then
> it's considered 0.

FYI, the binding doc for the graph bindings is at
Documentation/devicetree/bindings/graph.txt if there is
any questions on how things should work.

Regards,

Tony
