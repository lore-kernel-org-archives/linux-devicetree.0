From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [PATCH 1/4] Allow nodes to be refrenced by path at the top level.
Date: Sat, 13 Nov 2010 14:49:51 -0600
Message-ID: <E1PHN2l-0000zE-Ij@jdl.com>
References: <20101102225243.1707.23433.stgit@riker>
	<20101102225504.1707.88754.stgit@riker>
	<20101104001557.GB5061@yookeroo> <E1PFr8Q-0003CF-52@jdl.com>
	<AANLkTim3TopcXUcdJ1kGBwHYTNjL=SdhBaaZgnrWQG-a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <AANLkTim3TopcXUcdJ1kGBwHYTNjL=SdhBaaZgnrWQG-a-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org> 
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

> On Tue, Nov 9, 2010 at 9:33 AM, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org> wrote:
> >> On Tue, Nov 02, 2010 at 03:55:04PM -0700, John Bonesio wrote:
> >> > When nodes are modified by merging device trees, nodes to be updated/m=
> erged
> >> =A0can
> >> > be specified by a label. Specifying nodes by full path (instead of lab=
> el)
> >> > doesn't quite work. This patch fixes that.
> >> >
> >> > Signed-off-by: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> >>
> >> Acked-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> >>
> >> If we go where I'm beginning to suspect we want to with deprecating
> >> some existing syntax, this may become moot. =A0However as long as we're
> >> using reference like syntax for the merging, we should accept all the
> >> references that are valid elsewhere.
> >
> > Are we read for just this patch, or the series?
> > I didn't see any more commentary about the remaining 3 patches.
> 
> Hold off on the remaining three.  Also, this patch is based on the
> commits currently in my tree which have also been acked:
> 
> git://git.secretlab.ca/git/dtc.git master
> 
> g.

Patch 1/4 in this series applied and pushed out
along with Patch 1/4 from the previous series:
    Create new and use new print_error that uses printf style formatting.

Thanks,
jdl
