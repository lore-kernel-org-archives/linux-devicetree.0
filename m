From: Jacob Pan <jacob.jun.pan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 1/8] iommu: Add I/O ASID allocator
Date: Tue, 11 Jun 2019 10:10:52 -0700
Message-ID: <20190611101052.35af46df@jacob-builder>
References: <20190610184714.6786-1-jean-philippe.brucker@arm.com>
	<20190610184714.6786-2-jean-philippe.brucker@arm.com>
	<20190611052626.20bed59a@jacob-builder>
	<95292b47-4cf4-5fd9-b096-1cb016e2264f@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <95292b47-4cf4-5fd9-b096-1cb016e2264f-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Sender: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
To: Jean-Philippe Brucker <jean-philippe.brucker-5wv7dgnIgG8@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robin.murphy-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 11 Jun 2019 15:37:42 +0100
Jean-Philippe Brucker <jean-philippe.brucker-5wv7dgnIgG8@public.gmane.org> wrote:

> On 11/06/2019 13:26, Jacob Pan wrote:
> >> +/**
> >> + * ioasid_set_data - Set private data for an allocated ioasid
> >> + * @ioasid: the ID to set data
> >> + * @data:   the private data
> >> + *
> >> + * For IOASID that is already allocated, private data can be set
> >> + * via this API. Future lookup can be done via ioasid_find.
> >> + */
> >> +int ioasid_set_data(ioasid_t ioasid, void *data)
> >> +{
> >> +	struct ioasid_data *ioasid_data;
> >> +	int ret = 0;
> >> +
> >> +	xa_lock(&ioasid_xa);  
> > Just wondering if this is necessary, since xa_load is under
> > rcu_read_lock and we are not changing anything internal to xa. For
> > custom allocator I still need to have the mutex against allocator
> > removal.  
> 
> I think we do need this because of a possible race with ioasid_free():
> 
>          CPU1                      CPU2
>   ioasid_free(ioasid)     ioasid_set_data(ioasid, foo)
>                             data = xa_load(...)
>     xa_erase(...)
>     kfree_rcu(data)           (no RCU lock held)
>     ...free(data)
>                             data->private = foo;
> 
make sense, thanks for explaining.

> The issue is theoretical at the moment because no users do this, but
> I'd be more comfortable taking the xa_lock, which prevents a
> concurrent xa_erase()+free(). (I commented on your v3 but you might
> have missed it)
> 
Did you reply to my v3? I did not see it. I only saw your comments about
v3 in your commit message.

> >> +	ioasid_data = xa_load(&ioasid_xa, ioasid);
> >> +	if (ioasid_data)
> >> +		rcu_assign_pointer(ioasid_data->private, data);  
> > it is good to publish and have barrier here. But I just wonder even
> > for weakly ordered machine, this pointer update is quite far away
> > from its data update.  
> 
> I don't know, it could be right before calling ioasid_set_data():
> 
> 	mydata = kzalloc(sizeof(*mydata));
> 	mydata->ops = &my_ops;			(1)
> 	ioasid_set_data(ioasid, mydata);
> 		... /* no write barrier here */
> 		data->private = mydata;		(2)
> 
> And then another thread calls ioasid_find():
> 
> 	mydata = ioasid_find(ioasid);
> 	if (mydata)
> 		mydata->ops->do_something();
> 
> On a weakly ordered machine, this thread could observe the pointer
> assignment (2) before the ops assignment (1), and dereference NULL.
> Using rcu_assign_pointer() should fix that
> 
I agree it is better to have the barrier. Just thought there is already
a rcu_read_lock() in xa_load() in between. rcu_read_lock() may have
barrier in some case but better not count on it. No issues here. I will
integrate this in the next version.

> Thanks,
> Jean

[Jacob Pan]
