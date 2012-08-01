From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] of: Allow busses with #size-cells=0
Date: Wed, 01 Aug 2012 16:03:25 -0600
Message-ID: <5019A7AD.7010006@wwwdotorg.org>
References: <1343259277-19037-1-git-send-email-swarren@wwwdotorg.org>
 <50199445.6090101@wwwdotorg.org> <501999E1.5090404@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <501999E1.5090404-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/01/2012 03:04 PM, Rob Herring wrote:
> On 08/01/2012 03:40 PM, Stephen Warren wrote:
>> On 07/25/2012 05:34 PM, Stephen Warren wrote:
>>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>
>>> It's quite legitimate for a DT node to specify #size-cells=0. One example
>>> is a node that's used to collect a number of non-memory-mapped devices.
>>> In that scenario, there may be multiple child nodes with the same name
>>> (type) thus necessitating the use of unit addresses in node names, and
>>> reg properties:
>>
>> Does anyone have any comment on this patch?
> 
> No. Looks fine. I'll apply for 3.7 or do you have something that depends
> on it?

Great! Given the discussions on this topic before, it sure seemed like
no news was bad news here, but I guess not:-)

I'm going to add some new device tree content in 3.7 that will rely on
this patch to work. However, since it's a new feature/DT-content, I
don't think we need to manage the dependency any more than having this
and the other patches both show up in 3.7 at some time.

Thanks.
