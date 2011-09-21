From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] devicetree: Add a registry of vendor prefixes
Date: Wed, 21 Sep 2011 14:53:36 -0600
Message-ID: <20110921205336.GD17168@ponder.secretlab.ca>
References: <20110921152324.15993.96272.stgit@ponder>
	<20110921203853.GA2824@huya.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110921203853.GA2824-AOX6H5vLt3Uj8izMo0bVsAC/G2K4zDHf@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 21, 2011 at 01:38:54PM -0700, David Brown wrote:
> On Wed, Sep 21, 2011 at 09:23:25AM -0600, Grant Likely wrote:
> > There is no centralized listing for the in-use vendor prefixes
> > used in compatible strings and property names.  This patch adds one.
> > New prefixes should get added to this list to reduce the likelyhood
> > of namespace collisions.
> > 
> > +powervr	Imagination Technologies
> > +ramtron	Ramtron International
> 
> qcom is already used by the patches I sent out (and should be in the
> soc tree).  I can make a patch for that, but I guess I first need to
> ask around here for what company name we should use.

This isn't any kind of "authoritative" list, and it represents who makes the components, not who writes the code.  I'll use Qualcomm.

g.
