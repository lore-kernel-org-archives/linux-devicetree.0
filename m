From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V7 2/6] mtd: partitions: remove sysfs files when deleting
 all master's partitions
Date: Thu, 22 Jun 2017 14:05:33 -0700
Message-ID: <20170622210533.GD14148@google.com>
References: <20170526131415.27186-1-zajec5@gmail.com>
 <20170621062647.6072-1-zajec5@gmail.com>
 <20170621062647.6072-3-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170621062647.6072-3-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>, Dan Ehrenberg <dehrenberg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jun 21, 2017 at 08:26:43AM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> 
> When support for sysfs "offset" file was added it missed to update the
> del_mtd_partitions function. It deletes partitions just like
> mtd_del_partition does so both should also take care of removing sysfs
> files.
> 
> This change moves sysfs_remove_files call to the shared function to fix
> this issue.
> 
> Fixes: a62c24d755291 ("mtd: part: Add sysfs variable for offset of partition")
> Cc: Dan Ehrenberg <dehrenberg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
> ---
> V7: Introduction of this patch, it was separated from the 1/6. It should
>     be clear now that this change is introduced. If something goes wrong
>     it should also be easier to revert it this way.

Thanks, splitting this out is nice actually. And thanks for looking up
the background on this oversight.

I'm not really sure what the actual effect of that omission would be;
the file won't be left dangling in sysfs (the device is removed
entirely), but I'm not sure if that'd trigger some kind of internal
kobject memory leak.

Anyway, looks good to me.

Side note: this patch series sort of massages the definition of this
"offset" file. Now, IIUC, subpartitions will have an "offset" file
relative to their parent partition, not the master flash device. I'm not
sure which way is expected.

Brian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
