From: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 2/2] ARM: DT: kernel: DT cpu node bindings update
Date: Wed, 17 Apr 2013 17:56:09 +0100
Message-ID: <20130417165609.GB2249@linaro.org>
References: <1366042402-8987-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1366042402-8987-3-git-send-email-lorenzo.pieralisi@arm.com>
 <516C544A.4090107@wwwdotorg.org>
 <20130417091457.GB5012@e106331-lin.cambridge.arm.com>
 <516EBC66.20508@wwwdotorg.org>
 <alpine.LFD.2.03.1304171146530.17375@syhkavp.arg>
 <516ECC8A.2070508@wwwdotorg.org>
 <alpine.LFD.2.03.1304171231130.17375@syhkavp.arg>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.03.1304171231130.17375-hIgblCxmbi8OMTOF05IoTw@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Lennert Buytenhek <kernel-OLH4Qvv75CYX/NnBR394Jw@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Barry Song <baohua.song-kQvG35nSl+M@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 17, 2013 at 12:36:08PM -0400, Nicolas Pitre wrote:
> On Wed, 17 Apr 2013, Stephen Warren wrote:
> 
> > On 04/17/2013 10:02 AM, Nicolas Pitre wrote:
> > > On Wed, 17 Apr 2013, Stephen Warren wrote:
> > > 
> > >> On 04/17/2013 03:14 AM, Mark Rutland wrote:
> > >>> Hi Stephen,
> > >>>
> > >>>>> +	- enable-method
> > >>>>> +		Usage: required on ARM 64-bit systems, optional on ARM 32-bit
> > >>>>> +		       systems
> > >>>>> +		Value type: <string>
> > >>>>> +		Definition: On ARM 64-bit systems must be "spin-table" [1].
> > >>>>
> > >>>> Can that be an integer instead? with dtc+cpp support, that shouldn't
> > >>>> hurt the eyes too much any more.
> > >>>
> > >>> The "enable-method" property is described as a stringlist by ePAPR, and is
> > >>> currently in use on arm64 as such. It *must* remain a string(list) for arm64.
> > >>>
> > >>> Having it as an integer for arm is only going to cause us additional work,
> > >>> makes it impossible to share a common dt between 64bit and 32bit, and goes
> > >>> against the standard. I think it should be a stringlist for arm.
> > >>
> > >> OK, that's a great reason for this case.
> > >>
> > >> I hope we don't introduce any more standards that use strings, but that
> > >> may just be my personal preference...
> > > 
> > > I think in any standard, strings are far easier to deal with.  
> > > Especially with config stuff which is far from being performance 
> > > critical. Strings are much less prone to conflicts.  It is too easy to 
> > > "extend" a standard by assigning meanings to free numerical values just 
> > > to discover that someone else did use the same numbers for other 
> > > meanings.
> > > 
> > > In order to avoid this issue, a central authority has to be established 
> > > to assign numbers out while strings are fine without that most of the 
> > > time.
> > 
> > For DT, all strings or numbers must always be documented in the DT
> > binding, so there's no risk of conflict there.
> 
> No, that's not good enough.  Most of the time, DT properties are created 
> during development way earlier than any publication of them.  Picking a 
> random number is just creating trouble whereas a string might just be 
> right from the start.
> 
> Furthermore, what's the point to obfuscate a property name behind a 
> numerical indirection?  If what you want to describe is a number then 
> just use a number.  But if you want to describe a property, a method, or 
> any other attribute with no direct relation to a number except for the 
> only purpose of enumeration then there is just no point not to use a 
> string up front.

I also fear that vendors will follow the precedent and avoid publishing
any symbolic names ... or bindings, or headers ... for enumerated
choices in their non-upstream product trees.  Using the source -- if
you can find it -- will be the only hope for guessing what such entries
in an FDT could possibly mean.  This just makes life unnecessarily hard
for developers.

There is no foolproof way to prevent this, but conventions which
encourage transparency over crypticness at least discourage that
sort of behaviour.

Cheers
---Dave
