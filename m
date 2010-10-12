From: Matthew McClintock <msm-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] When dumping from file system show results in sane order
Date: Mon, 11 Oct 2010 19:41:50 -0500
Message-ID: <1286844110.1507.4.camel@mattsm-VirtualBox>
References: <1286305641-23388-1-git-send-email-msm@freescale.com>
	<20101011235546.GB22383@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101011235546.GB22383@yookeroo>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2010-10-12 at 10:55 +1100, David Gibson wrote:
> On Tue, Oct 05, 2010 at 02:07:21PM -0500, Matthew McClintock wrote:
> > Currently, when we run the following
> > 
> > $> dtc -I fs -O dts /proc/device-tree
> > 
> > We get the output in a "reverse order", this patch will reverse that
> > output order and should resemble your initial device more closely
> 
> Reverse order from what?  Directory entries are unordered for most
> intents and purposes - there's no guarantee that readdir() will return
> entries in a consistent order, and behaviour in practice will vary
> from one filesystem to another.

Ok, maybe I should word it as now ordered. =)

> 
> Your patch doesn't reverse the order - it sorts the items.  If that's
> what you actually want, then my general dtdiff and sorting patch will
> serve you better, as Grant suggests.
> 

Yep, I concur your version is better and I would like to see that
accepted for my own reasons.

Cheers,
Matthew
