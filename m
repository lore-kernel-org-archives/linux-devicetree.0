From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V6 2/5] mtd: partitions: rename "master" to the "parent"
 where appropriate
Date: Tue, 20 Jun 2017 18:22:47 -0700
Message-ID: <20170621012247.GC14148@google.com>
References: <20170526131415.27186-1-zajec5@gmail.com>
 <20170526131415.27186-3-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170526131415.27186-3-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 26, 2017 at 03:14:12PM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> 
> This prepares mtd subsystem for the new feature: subpartitions. In some
> cases flash device partition can be a container with extra subpartitions
> (volumes).
> 
> So far there was a flat structure implemented. One master (flash device)
> could be partitioned into few partitions. Every partition got its master
> and it was enough to get things running.
> 
> To support subpartitions we need to store pointer to the parent for each
> partition. This is required to implement more natural tree structure and
> handle all recursion and offsets calculation.
> 
> To make code consistent this patch renamed "master" to the "parent" in
> places where we can be dealing with subpartitions.
> 
> Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> ---
> V5: Introduction of this patch to prepare allocate_partition for further
>     modification.
> V6: Rename "master" in more places including callback functions

This patch has some conflicts with l2-mtd.git now. I might end up
working them out, but it'd be easier if you'd rebase.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
