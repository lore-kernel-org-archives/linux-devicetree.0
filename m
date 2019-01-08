Return-Path: <SRS0=Lx4m=PQ=ti.com=tomi.valkeinen@kernel.org>
Subject: Re: [PATCH] ARM: dts: omap3-gta04: Fix graph_port warning
References: <20190107160512.9480-1-tony@atomide.com>
 <ED6668F3-73A7-49A1-A7C7-E54381841222@goldelico.com>
 <CAL_Jsq+RQMjeH+YTphrXBQRdpUse1rSvPGdJiqcoRQWMPT+-ZQ@mail.gmail.com>
 <20190107183419.GG5544@atomide.com>
 <DE542A85-9B46-4AA4-B4E8-8880D23355EC@goldelico.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <46dce758-2339-c4ef-891b-5cf4522fb7df@ti.com>
Date: Tue, 8 Jan 2019 09:57:08 +0200
MIME-Version: 1.0
In-Reply-To: <DE542A85-9B46-4AA4-B4E8-8880D23355EC@goldelico.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "H. Nikolaus Schaller" <hns@goldelico.com>, Tony Lindgren <tony@atomide.com>
Cc: Rob Herring <robh@kernel.org>, linux-omap <linux-omap@vger.kernel.org>, =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>, devicetree <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 07/01/19 21:34, H. Nikolaus Schaller wrote:

>>> If there's only one port, then it is redundant and you should drop reg
>>> instead.
> 
> If I remember correctly it was required by older omapdrm code (which
> did scan for a reg property) but that may have changed. Therefore I've
> added Tomi to this discussion.

I don't think so. The code looks for 'reg', but if it's not there, then
it's considered 0.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
