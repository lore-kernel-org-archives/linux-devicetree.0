From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V3] dtc: Add ability to delete nodes and properties
Date: Tue, 21 Aug 2012 22:12:58 -0600
Message-ID: <50345C4A.50704@nvidia.com>
References: <1344401415-3214-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1344401415-3214-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/07/2012 10:50 PM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> dtc currently allows the contents of properties to be changed, and the
> contents of nodes to be added to. There are situations where removing
> properties or nodes may be useful. This change implements the following
> syntax to do that:
> 
>     / {
>         /delete-property/ propname;
>         /delete-node/ nodename;
>     };
> 
> or:
> 
>     /delete-node/ &noderef;

David, does this look OK? I believe I've addresses the issues you
requested in order to give your ack. Thanks.

> ---
> v3:
> * Switch syntax from "propname /delprop/" to "/delete-property/ propname".
>   Similar for /delete-node/.
> * Modify for_each_label() to skip deleted labels, and introduce
>   for_each_label_withdel() for the case where we do want to include deleted
>   labels in the iteration. Similar for properties and children.
