From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: vexpress: add basic DT platform matching support
Date: Fri, 15 Apr 2011 11:38:44 +0100
Message-ID: <1302863924.22081.8.camel@e102568-lin.cambridge.arm.com>
References: <1302717741-18753-1-git-send-email-lorenzo.pieralisi@arm.com>
	<1302717741-18753-2-git-send-email-lorenzo.pieralisi@arm.com>
	<20110414205448.GB5255@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110414205448.GB5255-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Grant, Nicolas,

On Thu, 2011-04-14 at 14:54 -0600, Grant Likely wrote:
> On Wed, Apr 13, 2011 at 07:02:20PM +0100, Lorenzo Pieralisi wrote:
> > This patch adds a DT match table to the Versatile Express machine
> > description in order to enable basic device tree support.
> > 
> > Tested on a Versatile Express board where the device tree blob is
> > passed to the kernel by u-boot.
> > 
> > Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> 
> Merged into devicetree/test & devicetree/arm.  I squashed this with
> the second patch while I was at it.  I see that Nicolas has already
> picked it up into the Linaro tree, so I don't need to worry about
> pushing it to him.  :-)
> 
> g.
> 

Thank you very much.

Lorenzo
