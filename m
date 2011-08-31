From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: [RFC PATCH] dtc: Add support for named constants
Date: Wed, 31 Aug 2011 13:37:31 +1000
Message-ID: <20110831033731.GC26462@yookeroo.fritz.box>
References: <1314139400-31984-1-git-send-email-swarren@nvidia.com>
	<20110830042316.GH4254@yookeroo.fritz.box>
	<74CDBE0F657A3D45AFBB94109FB122FF04B3279D55@HQMAIL01.nvidia.com>
	<alpine.DEB.2.00.1108301459340.26173@utopia.booyaka.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1108301459340.26173-rwI8Ez+7Ko+d5PgPZx9QOdBPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Arnaud Lacombe <lacombar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 30, 2011 at 03:04:08PM -0600, Paul Walmsley wrote:
> Hi,
> 
> On Tue, 30 Aug 2011, Stephen Warren wrote:
> 
> > David Gibson wrote at Monday, August 29, 2011 10:23 PM:
> > > On Tue, Aug 23, 2011 at 04:43:20PM -0600, Stephen Warren wrote:
> > > > You may define constants as follows:
> > > >
> > > > /define/ $TWO 2;
> > > > /define/ $FOUR 4;
> > > > /define/ $OTHER $FOUR;
> > > >
> > > > And properties may use these values as follows:
> > > >
> > > > foo = <1 $TWO 3 $FOUR 5>;
> > ...
> > > > Note 2: I'd prefer the syntax of /define/ to be:
> > > >
> > > > /define/ TWO 2;
> 
> Some preprocessing support would be very useful for us on OMAP, where we 
> have some register bitfields that we'd like to use symbolic names for.
> 
> One question, though.  Documentation/devicetree/booting-without-of.txt[1] 
> says:
> 
>    It is also suggested that you pipe your source file through cpp (gcc
>    preprocessor) so you can use #include's, #define for constants, 
>    etc...
> 
> Is it no longer recommended to use cpp for this purpose?

Yes and now.  I actually prefer the idea of using cpp, or at least
cpp-like processing to handle macros and the like in dts - Jon's
approach was different, instead implementing functions, of a sort, in
dtc itself.

The difficulty with cpp is that # already appears naturally as the
first character in a line in many dts files due to the #address-cells
and #size-cells properties for example.  That makes distinguishing the
cpp directives properly lexically difficult.  It will usually actually
work, with a little fiddling, but what exact fiddling is required
depends on the cpp version which makes it kind of unsuitable as a
general solution.

-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
