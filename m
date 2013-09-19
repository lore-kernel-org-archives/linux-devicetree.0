From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [dtc PATCH] Ensure all tests have matching reg and unit address
Date: Thu, 19 Sep 2013 11:49:41 -0600
Message-ID: <523B3935.2090904@wwwdotorg.org>
References: <1379535782-12667-1-git-send-email-swarren@wwwdotorg.org> <20130919121818.GB3551@voom.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130919121818.GB3551-1s0os16eZneny3qCrzbmXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/19/2013 06:18 AM, David Gibson wrote:
> On Wed, Sep 18, 2013 at 02:23:02PM -0600, Stephen Warren wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> 
>> ePAPR 1.1 section 2.2.1.1 "Node Name Requirements" specifies that
>> any node that has a reg property must include a unit address in
>> its name with value matching the first entry in its reg property.
>> Conversely, if a node does not have a reg property, the node name
>> must not include a unit address.
>> 
>> Adjust all the dtc test-cases to conform to this rule.
>> 
>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Yeah, the testcase examples were built as purely syntactic
> exercises without really considering dt content conventions.
> Fixing them up is arguably unnnecessary, but certainly doesn't hurt
> and makes them better as examples.
> 
> Applied and pushed.

Strange; I see that the git author field ended up as you rather than
me. Did you need to apply the patch manually for some reason (if so,
what did I do wrong?) or did something go wrong in the patch
application process?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
