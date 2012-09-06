From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V3] dtc: Add ability to delete nodes and properties
Date: Thu, 06 Sep 2012 09:58:33 -0600
Message-ID: <5048C829.30802@wwwdotorg.org>
References: <1344401415-3214-1-git-send-email-swarren@wwwdotorg.org>
 <20120904000539.GH8526@truffula.fritz.box> <E1T9bae-0001JH-EF@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <E1T9bae-0001JH-EF-CYoMK+44s/E@public.gmane.org>
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
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/06/2012 06:53 AM, Jon Loeliger wrote:
>> On Tue, Aug 07, 2012 at 10:50:15PM -0600, Stephen Warren wrote:
>>> dtc currently allows the contents of properties to be changed, and the
>>> contents of nodes to be added to. There are situations where removing
>>> properties or nodes may be useful. This change implements the following
>>> syntax to do that:
>>>
>>>     / {
>>>         /delete-property/ propname;
>>>         /delete-node/ nodename;
>>>     };
>>>
>>> or:
>>>
>>>     /delete-node/ &noderef;
...
>> Acked-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> 
> Applied!

Thanks very much!

Any further thoughts on named constants and whether my gpp-integration
hack should be pursued?
