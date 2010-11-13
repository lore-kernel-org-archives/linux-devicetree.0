From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [PATCH 1/4] Create new and use new print_error that uses printf
	style formatting.
Date: Sat, 13 Nov 2010 14:40:09 -0600
Message-ID: <E1PHMtN-0000Gk-I9@jdl.com>
References: <20101020214419.2985.51068.stgit@riker>
	<20101020214457.2985.90434.stgit@riker>
	<20101021044410.GD13335@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20101021044410.GD13335-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org> 
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

> On Wed, Oct 20, 2010 at 02:44:58PM -0700, John Bonesio wrote:
> > yyerror is meant to be called by the parser internal code, and it's interface
> > is limited. Instead create and call a new error message routine that allows
> > formatted strings to be used.
> > 
> > yyerror uses the new routine so error formatting remains consistent.
> > 
> > Signed-of-by: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> 
> Picked up and pushed out to my git tree.  Jon is a little tied up for
> the moment, so I'll maintain a working tree at
> git://git.secretlab.ca/git/dtc.git until we've got this work finished
> and we can ask him to merge it.
> 
> g.


Thanks, Grant.  I'll pick this patch up now too, and the
subsequent patch 1/4 from the next series about labels refs.

jdl
