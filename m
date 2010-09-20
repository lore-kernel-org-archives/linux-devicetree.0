From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org: Re: [PATCH] Add merging of labelled
	subnodes. This patch allows the following]
Date: Mon, 20 Sep 2010 09:49:03 -0500
Message-ID: <E1Oxhfz-0006np-W9@jdl.com>
References: <20100920033255.GB6762@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20100920033255.GB6762@yookeroo> 
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

> Done.  I think the testcase we have for it is not ideal, but that's
> easily fixed later.

Guys,

Any chance I can get a clean patch that has clean tabs
and doesn't have high-bit-set characters embedded in it?

Thanks!
jdl


> From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> 
> syntax:
> 
> / {
> =A0 =A0 =A0 =A0child {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0label: subchild {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};
> =A0 =A0 =A0 =A0};
> };
> 
> &label {
> =A0 =A0 =A0 =A0prop =3D "value";
> };
> 
> which will result in the following tree:
> 
> / {
> =A0 =A0 =A0 =A0child {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0label: subchild {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0prop =3D "value";
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0};
> =A0 =A0 =A0 =A0};
> };
> 
> Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
