From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [PATCH 03/15] x86/dtb: Add a device tree for CE4100
Date: Thu, 6 Jan 2011 10:20:39 +1100
Message-ID: <20110105232039.GA8846@yookeroo>
References: <1292600033-12271-1-git-send-email-bigeasy@linutronix.de>
	<1292600033-12271-4-git-send-email-bigeasy@linutronix.de>
	<20101230085122.GE11721@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101230085122.GE11721-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: sodaville-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 30, 2010 at 01:51:22AM -0700, Grant Likely wrote:
> On Fri, Dec 17, 2010 at 04:33:41PM +0100, Sebastian Andrzej Siewior wrote:
[snip]
> > +/dts-v1/;
> > +/ {
> > +	model = "Intel,FalconFalls";
> > +	compatible = "Intel,FalconFalls";
> 
> To-date the convention has been to use all lowercase in compatible
> properties.  Ditto throughout this file.

IEEE1275 actually explicitly gives the convention on p164, in the
context of the "name" property.  The vendor string can either be all
uppercase, in which case it must be a stock ticker symbol ("AAPL" is
seen in the wild, for example), or it can be another string with no
uppercase.

I'm sure some intel peripheral chips must have been used on existing
OF platforms at various points.  It might be worth seeking those out
and double checking what was used in those cases.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
