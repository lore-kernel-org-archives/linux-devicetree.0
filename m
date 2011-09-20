From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [PATCH v2] dtc: Add support for named integer constants
Date: Tue, 20 Sep 2011 08:48:02 -0500
Message-ID: <E1R60g6-0002XP-Pt@jdl.com>
References: <1314739818-13904-1-git-send-email-swarren@nvidia.com>
	<74CDBE0F657A3D45AFBB94109FB122FF04B327A62D@HQMAIL01.nvidia.com>
	<CAPnjgZ0NzN510XJZ1ONAbMTS3vrrP8qCV8NYHq4_heZL+PizNg@mail.gmail.com>
	<20110908183211.GM2967@ponder.secretlab.ca>
	<20110909013433.GC21002@yookeroo.fritz.box>
	<74CDBE0F657A3D45AFBB94109FB122FF04B732144F@HQMAIL01.nvidia.com>
	<20110920080409.GL29197@yookeroo.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20110920080409.GL29197-787xzQ0H9iQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> 
> Things get trickier when we want to extend this to macros or
> functions.  The only problem I have with your patch at present is that
> I'd prefer not to implement a constant defining syntax, only to have
> it obsoleted by whatever we do for macros or functions.

Exactly.

> So, there are basically two approaches to macro or function support.
> 
> A) Functions
> B) Macros
>   B1) Use cpp itself
>   B2) Make our own preprocessor, isomorphic to cpp

To be thorough, there has been one other macro proposal: Use m4.
Suggesting that, however, has had the entertaining side effect
of causing internet-wide vomiting.


> Our current impasse is roughly that Jon prefers approach (A), whereas
> I prefer (B1) on balance.  (B1) would obsolete your suggested define
> syntax.  (A) and (B2) could both potentially subsume it, instead.

Right.

jdl
