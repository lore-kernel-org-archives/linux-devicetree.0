From: Rask Ingemann Lambertsen <ccc94453@vip.cybercity.dk>
Subject: Re: [PATCH v2 1/2] devicetree: Add vendor prefix for Shenzhen
 Sunchip Technology Co., Ltd
Date: Tue, 16 Aug 2016 20:28:56 +0200
Message-ID: <20160816182855.2hdupen4dcmczxiw@vip.cybercity.dk>
References: <20160812235312.GB10557@vip.cybercity.dk>
 <bae6ad6c04f7567b224e008ab27b32d2dac1d9c1.1471125083.git.ccc94453@vip.cybercity.dk>
 <20160816125624.GA20716@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20160816125624.GA20716@rob-hp-laptop>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 16, 2016 at 07:56:24AM -0500, Rob Herring wrote:
> On Thu, Aug 11, 2016 at 10:11:51PM +0200, Rask Ingemann Lambertsen wrote:
> > 
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > index 1992aa9..fbad2cea 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > @@ -256,6 +256,7 @@ ste	ST-Ericsson
> >  stericsson	ST-Ericsson
> >  syna	Synaptics Inc.
> >  synology	Synology, Inc.
> > +sunchip	Shenzhen Sunchip Technology Co., Ltd
> >  SUNW	Sun Microsystems, Inc
> 
> These are not in alphabetical order. Maybe someone thought uppercase 
> should be separate, but I don't. So please fix the ordering here moving 
> SUNW before syna.

I'm new to this, so I could use a bit of guidance here. Is it OK if I
send a follow-up patch to fix the ordering or should I send a patch to
fix the ordering first, before the sunchip prefix is added?

I never considered the possibility that the list wouldn't be in
alphabetical order to begin with, so the brain power went into deciding
if uppercase should be sorted separately.

-- 
Rask Ingemann Lambertsen
Danish law requires addresses in e-mail to be logged and stored for a year
