From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] of: require a match on all fields of of_device_id
Date: Wed, 18 Jul 2012 11:04:23 -0500
Message-ID: <5006DE87.7020503@freescale.com>
References: <20120718011151.GA6119@tyr.buserror.net>
 <50062199.7090904@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <50062199.7090904-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/17/2012 09:38 PM, Rob Herring wrote:
> On 07/17/2012 08:11 PM, Scott Wood wrote:
>> Commit 107a84e61cdd3406c842a0e4be7efffd3a05dba6 ("of: match by compatible
>> property first") breaks the gianfar ethernet driver found on various
>> Freescale PPC chips.
> 
> You do know this is reverted, right?

No, I didn't.  I got it via Kumar's next branch, and saw that it was
still in your fixes-for-grant branch, and didn't see any revert-related
e-mail activity on the devicetree-discuss list about it.  I now see that
it was reverted directly in Linus's tree (I didn't see either the
original or the revert in Linus's tree when I checked, but apparently I
hadn't fetched that as recently as I thought).

> Here's my fix (untested) which is a bit simpler. I'm assuming if we care
> about which compatible string we are matching to, then we require name
> and type are blank and we only care about compatible strings.

Any particular reason for making that assumption?  We should be avoiding
the need for .name or .type matching in new bindings, but this seems
like unnecessarily inconsistent behavior.

-Scott
