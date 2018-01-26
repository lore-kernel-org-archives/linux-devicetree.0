From: "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH v12 1/2] rcar-csi2: add Renesas R-Car MIPI CSI-2 receiver
 documentation
Date: Fri, 26 Jan 2018 01:32:04 +0100
Message-ID: <20180126003204.GA18950@bigcity.dyn.berto.se>
References: <20171129193235.25423-1-niklas.soderlund+renesas@ragnatech.se>
 <20171129193235.25423-2-niklas.soderlund+renesas@ragnatech.se>
 <5713027.4ELTcTEoZh@avalon>
 <20180126002358.GA19915@bigcity.dyn.berto.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180126002358.GA19915@bigcity.dyn.berto.se>
Sender: linux-media-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-renesas-soc@vger.kernel.org, tomoharu.fukawa.eb@renesas.com, Kieran Bingham <kieran.bingham@ideasonboard.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi again,

On 2018-01-26 01:23:58 +0100, Niklas Söderlund wrote:

[snip]

> > 
> > Furthermore, as explained in a comment I made when reviewing the VIN patch 
> > series, I wonder whether we shouldn't identify the CSI-2 receiver instances by 
> > ID the same way we do with the VIN instances (using the renesas,id property). 
> > In that case I think the endpoint numbering won't matter.
> 
> The endpoint numbering here plays no part in identify the CSI-2 receiver 
> instances nor dose it carry any other information. I still think it's 
> neat to define the binding like this as it more explicit and IMHO this 
> makes it easier to understand.

I now see that the commit message implies that they do matter but this 
is wrong. It was true before the 'renesas,id' was added to the VIN 
bindings, but as having cross dependences on bindings are bad this is no 
longer the case. I will remove that paragraph for the next version.

Sorry for the noise.

-- 
Regards,
Niklas Söderlund
