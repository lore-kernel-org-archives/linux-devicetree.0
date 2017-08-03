From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/5] of: Add vendor prefix for Adaptrum, Inc.
Date: Thu, 3 Aug 2017 18:25:24 -0500
Message-ID: <20170803232524.x7a7buzpkniaxg43@rob-hp-laptop>
References: <20170728220707.13960-1-alex.g@adaptrum.com>
 <20170728220707.13960-2-alex.g@adaptrum.com>
 <af822347-635d-a073-56e5-8eae403a729e@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <af822347-635d-a073-56e5-8eae403a729e@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: Alexandru Gagniuc <alex.g@adaptrum.com>, linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Thierry Reding <treding@nvidia.com>, Marek Vasut <marek.vasut@gmail.com>, Rask Ingemann Lambertsen <ccc94453@vip.cybercity.dk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, Jul 29, 2017 at 04:48:28PM +0200, Andreas Färber wrote:
> Hi Alexandru,
> 
> Am 29.07.2017 um 00:07 schrieb Alexandru Gagniuc:
> > Signed-off-by: Alexandru Gagniuc <alex.g@adaptrum.com>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
> >  1 file changed, 1 insertion(+)
> 
> Not sure why I'm CC'ed here, but it looks sane, so
> 
> Reviewed-by: Andreas Färber <afaerber@suse.de>
> 
> If this patch gets respun, please add a sentence about your company to
> the commit message. I also think "dt-bindings:" is a more common prefix?

Please respin with the above and just send by itself. This can go 
separately as there's no need to merge via the same tree just in the 
name of satisfying checkpatch.

Rob
