From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 00/10] R-Car DU: Convert LVDS code to bridge driver
Date: Mon, 15 Jan 2018 09:00:59 +0200
Message-ID: <1910701.B4GqNP9ovV@avalon>
References: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com> <2317358.st5FeEE5QH@avalon> <20180115065747.hx5kvhurk3x5f3jz@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20180115065747.hx5kvhurk3x5f3jz@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, DRI Development <dri-devel@lists.freedesktop.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Simon,

On Monday, 15 January 2018 08:57:48 EET Simon Horman wrote:
> On Fri, Jan 12, 2018 at 03:48:25PM +0200, Laurent Pinchart wrote:
> > On Friday, 12 January 2018 11:47:03 EET Geert Uytterhoeven wrote:
> >> On Fri, Jan 12, 2018 at 1:58 AM, Laurent Pinchart wrote:
> >>> This patch series addresses a design mistake that dates back from the
> >>> initial DU support. Support for the LVDS encoders, which are IP cores
> >>> separate from the DU, was bundled in the DU driver. Worse, both the DU
> >>> and LVDS were described through a single DT node.
> >>> 
> >>> To fix the, patches 01/10 and 02/10 define new DT bindings for the
> >>> LVDS encoders, and deprecate their description inside the DU bindings.
> >>> To retain backward compatibility with existing DT, patch 03/10 then
> >>> patches the device tree at runtime to convert the legacy bindings to the
> >>> new ones.
> >> 
> >> Looks like we will have to postpone the R-Car Gen2 Modern DT flag day
> >> again by a few kernel releases?
> > 
> > Why so ? We don't have to drop support for all legacy DT bindings at the
> > same time, do we ? We can switch to the new-style clock bindings on Gen2
> > already, and drop the legacy LVDS bindings later.
> 
> To clarify, after this patchset.
> * Old DTs work with old and new kernels.
> * New DTs require new kernels.

That's correct. I've tested old DTs with new kernels successfully on Lager, 
Salvator-X (both H3 ES1.x and M3-W) and Salvator-XS.

-- 
Regards,

Laurent Pinchart
