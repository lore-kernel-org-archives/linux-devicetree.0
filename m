From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Subject: Re: [PATCH 1/8] iommu: Add I/O ASID allocator
Date: Tue, 11 Jun 2019 15:37:42 +0100
Message-ID: <95292b47-4cf4-5fd9-b096-1cb016e2264f@arm.com>
References: <20190610184714.6786-1-jean-philippe.brucker@arm.com>
 <20190610184714.6786-2-jean-philippe.brucker@arm.com>
 <20190611052626.20bed59a@jacob-builder>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190611052626.20bed59a@jacob-builder>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, will.deacon@arm.com, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, robh+dt@kernel.org, robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 11/06/2019 13:26, Jacob Pan wrote:
>> +/**
>> + * ioasid_set_data - Set private data for an allocated ioasid
>> + * @ioasid: the ID to set data
>> + * @data:   the private data
>> + *
>> + * For IOASID that is already allocated, private data can be set
>> + * via this API. Future lookup can be done via ioasid_find.
>> + */
>> +int ioasid_set_data(ioasid_t ioasid, void *data)
>> +{
>> +	struct ioasid_data *ioasid_data;
>> +	int ret = 0;
>> +
>> +	xa_lock(&ioasid_xa);
> Just wondering if this is necessary, since xa_load is under
> rcu_read_lock and we are not changing anything internal to xa. For
> custom allocator I still need to have the mutex against allocator
> removal.

I think we do need this because of a possible race with ioasid_free():

         CPU1                      CPU2
  ioasid_free(ioasid)     ioasid_set_data(ioasid, foo)
                            data = xa_load(...)
    xa_erase(...)
    kfree_rcu(data)           (no RCU lock held)
    ...free(data)
                            data->private = foo;

The issue is theoretical at the moment because no users do this, but I'd
be more comfortable taking the xa_lock, which prevents a concurrent
xa_erase()+free(). (I commented on your v3 but you might have missed it)

>> +	ioasid_data = xa_load(&ioasid_xa, ioasid);
>> +	if (ioasid_data)
>> +		rcu_assign_pointer(ioasid_data->private, data);
> it is good to publish and have barrier here. But I just wonder even for
> weakly ordered machine, this pointer update is quite far away from its
> data update.

I don't know, it could be right before calling ioasid_set_data():

	mydata = kzalloc(sizeof(*mydata));
	mydata->ops = &my_ops;			(1)
	ioasid_set_data(ioasid, mydata);
		... /* no write barrier here */
		data->private = mydata;		(2)

And then another thread calls ioasid_find():

	mydata = ioasid_find(ioasid);
	if (mydata)
		mydata->ops->do_something();

On a weakly ordered machine, this thread could observe the pointer
assignment (2) before the ops assignment (1), and dereference NULL.
Using rcu_assign_pointer() should fix that

Thanks,
Jean
