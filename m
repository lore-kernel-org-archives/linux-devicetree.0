MIME-Version: 1.0
Date: Mon, 7 Jan 2019 12:31:46 -0600
References: <20190107160512.9480-1-tony@atomide.com>
	<ED6668F3-73A7-49A1-A7C7-E54381841222@goldelico.com>
In-Reply-To: <ED6668F3-73A7-49A1-A7C7-E54381841222@goldelico.com>
Message-ID: <CAL_Jsq+RQMjeH+YTphrXBQRdpUse1rSvPGdJiqcoRQWMPT+-ZQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: omap3-gta04: Fix graph_port warning
From: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Tony Lindgren <tony@atomide.com>, linux-omap <linux-omap@vger.kernel.org>, =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Jan 7, 2019 at 10:21 AM H. Nikolaus Schaller <hns@goldelico.com> wrote:
>
> Hi Tony,
>
> > Am 07.01.2019 um 17:05 schrieb Tony Lindgren <tony@atomide.com>:
> >
> > We're currently getting a warning with make dtbs:
> >
> > arch/arm/boot/dts/omap3-gta04.dtsi:720.7-727.4: Warning (graph_port):
> > /ocp@68000000/dss@48050000/encoder@48050c0 0/port: graph node unit
> > address error, expected "0"
>
> yes, dtc has become more critical nowadays...
>
> To me it looks like redundant information, but it is how it is.

If there's only one port, then it is redundant and you should drop reg
instead. There should be a warning for that too. That one is probably
off by default as that's more subjective and noisy.

Rob
