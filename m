From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [dtc PATCH V2] Warn on node name unit-address presence/absence
 mismatch
Date: Thu, 26 Sep 2013 17:12:58 -0600
Message-ID: <5244BF7A.4000100@wwwdotorg.org>
References: <1379613263-32080-1-git-send-email-swarren@wwwdotorg.org> <3D2FE31C-A6BB-4F70-9B3B-C55012CB56B3@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3D2FE31C-A6BB-4F70-9B3B-C55012CB56B3-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rohit Vaswani <rvaswani-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/26/2013 12:21 PM, Kumar Gala wrote:
> 
> On Sep 19, 2013, at 12:54 PM, Stephen Warren wrote:
> 
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> ePAPR 1.1 section 2.2.1.1 "Node Name Requirements" specifies that any
>> node that has a reg property must include a unit address in its name
>> with value matching the first entry in its reg property. Conversely, if
>> a node does not have a reg property, the node name must not include a
>> unit address.
>>
>> Implement a check for this. The code doesn't validate the format of the
>> unit address; ePAPR implies this may vary from (containing bus) binding
>> to binding, so doing so would be much more complex.

> What about the case of no reg but a ranges?
> 
> This pattern shows up on a lot (if not all) the PPC dts:
> 
> arch/powerpc/boot/dts/mpc8544ds.dts:
> 
>         board_soc: soc: soc8544@e0000000 {
>                 ranges = <0x0 0x0 0xe0000000 0x100000>;

Well, ePAPR seems pretty specific that unit address and reg are related,
but says nothing about ranges in the section on node naming, nor about
node naming in the section about ranges.

I'd claim that the existing PPC trees are nonconforming, and should be
fixed too:-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
