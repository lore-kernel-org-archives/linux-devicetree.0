Return-Path: <SRS0=iARg=PP=vger.kernel.org=devicetree-owner@kernel.org>
Received: from muru.com ([72.249.23.125]:60344 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726132AbfAGSeW (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 7 Jan 2019 13:34:22 -0500
Date: Mon, 7 Jan 2019 10:34:19 -0800
From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] ARM: dts: omap3-gta04: Fix graph_port warning
Message-ID: <20190107183419.GG5544@atomide.com>
References: <20190107160512.9480-1-tony@atomide.com>
 <ED6668F3-73A7-49A1-A7C7-E54381841222@goldelico.com>
 <CAL_Jsq+RQMjeH+YTphrXBQRdpUse1rSvPGdJiqcoRQWMPT+-ZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+RQMjeH+YTphrXBQRdpUse1rSvPGdJiqcoRQWMPT+-ZQ@mail.gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>, linux-omap <linux-omap@vger.kernel.org>, =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

* Rob Herring <robh@kernel.org> [190107 18:32]:
> On Mon, Jan 7, 2019 at 10:21 AM H. Nikolaus Schaller <hns@goldelico.com> wrote:
> >
> > Hi Tony,
> >
> > > Am 07.01.2019 um 17:05 schrieb Tony Lindgren <tony@atomide.com>:
> > >
> > > We're currently getting a warning with make dtbs:
> > >
> > > arch/arm/boot/dts/omap3-gta04.dtsi:720.7-727.4: Warning (graph_port):
> > > /ocp@68000000/dss@48050000/encoder@48050c0 0/port: graph node unit
> > > address error, expected "0"
> >
> > yes, dtc has become more critical nowadays...
> >
> > To me it looks like redundant information, but it is how it is.
> 
> If there's only one port, then it is redundant and you should drop reg
> instead. There should be a warning for that too. That one is probably
> off by default as that's more subjective and noisy.

OK dropping this patch. Nikolaus, care to post a better
version since you can test it?

Regards,

Tony
