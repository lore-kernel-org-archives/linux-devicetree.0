From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2] dtc: Add support for named integer constants
Date: Wed, 28 Sep 2011 11:08:02 -0500
Message-ID: <4E834662.4010907@freescale.com>
References: <1314739818-13904-1-git-send-email-swarren@nvidia.com>
	<74CDBE0F657A3D45AFBB94109FB122FF04B327A62D@HQMAIL01.nvidia.com>
	<CAPnjgZ0NzN510XJZ1ONAbMTS3vrrP8qCV8NYHq4_heZL+PizNg@mail.gmail.com>
	<20110908183211.GM2967@ponder.secretlab.ca>
	<20110909013433.GC21002@yookeroo.fritz.box>
	<74CDBE0F657A3D45AFBB94109FB122FF04B732144F@HQMAIL01.nvidia.com>
	<20110920080409.GL29197@yookeroo.fritz.box>
	<4E78CEE1.3090403@freescale.com>
	<20110928002942.GE5361@yookeroo.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110928002942.GE5361-787xzQ0H9iQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
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

On 09/27/2011 07:29 PM, David Gibson wrote:
> On Tue, Sep 20, 2011 at 12:35:29PM -0500, Scott Wood wrote:
>> Another disadvantage of any approach that tries to separate macros from
>> the underlying language is that you can't have anything be conditional
>> on an expression that the macro layer doesn't understand.
> 
> That one doesn't follow, actually.  The macro can't implement a
> conditional itself, but it could expand to a (constant) conditional
> expression which is evaluated later.

Right, you can always implement conditionals in the underlying language,
but the macro processor can't directly use the results.  This can be an
issue if the intended use is to be heavily reliant on macros as a
substitute for expressiveness in the underlying language.

-Scott
