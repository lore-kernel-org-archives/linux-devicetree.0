From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Subject: Re: [PATCH 1/8] iommu: Add I/O ASID allocator
Date: Wed, 12 Jun 2019 12:30:05 +0100
Message-ID: <f68f4ccb-1422-4f93-dc9c-2bcdf61c9ed4@arm.com>
References: <20190610184714.6786-1-jean-philippe.brucker@arm.com>
 <20190610184714.6786-2-jean-philippe.brucker@arm.com>
 <20190611052626.20bed59a@jacob-builder>
 <95292b47-4cf4-5fd9-b096-1cb016e2264f@arm.com>
 <20190611101052.35af46df@jacob-builder>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190611101052.35af46df@jacob-builder>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Mark Rutland <Mark.Rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Will Deacon <Will.Deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Robin Murphy <Robin.Murphy@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 11/06/2019 18:10, Jacob Pan wrote:
>> The issue is theoretical at the moment because no users do this, but
>> I'd be more comfortable taking the xa_lock, which prevents a
>> concurrent xa_erase()+free(). (I commented on your v3 but you might
>> have missed it)
>>
> Did you reply to my v3? I did not see it. I only saw your comments about
> v3 in your commit message.

My fault, I sneaked the comments in a random reply three levels down the
thread:
https://lore.kernel.org/linux-iommu/836caf0d-699e-33ba-5303-b1c9c949c9ca@arm.com/

(Great, linux-iommu is indexed by lore! I won't have to Cc lkml anymore)

>>>> +	ioasid_data = xa_load(&ioasid_xa, ioasid);
>>>> +	if (ioasid_data)
>>>> +		rcu_assign_pointer(ioasid_data->private, data);  
>>> it is good to publish and have barrier here. But I just wonder even
>>> for weakly ordered machine, this pointer update is quite far away
>>> from its data update.  
>>
>> I don't know, it could be right before calling ioasid_set_data():
>>
>> 	mydata = kzalloc(sizeof(*mydata));
>> 	mydata->ops = &my_ops;			(1)
>> 	ioasid_set_data(ioasid, mydata);
>> 		... /* no write barrier here */
>> 		data->private = mydata;		(2)
>>
>> And then another thread calls ioasid_find():
>>
>> 	mydata = ioasid_find(ioasid);
>> 	if (mydata)
>> 		mydata->ops->do_something();
>>
>> On a weakly ordered machine, this thread could observe the pointer
>> assignment (2) before the ops assignment (1), and dereference NULL.
>> Using rcu_assign_pointer() should fix that
>>
> I agree it is better to have the barrier. Just thought there is already
> a rcu_read_lock() in xa_load() in between. rcu_read_lock() may have
> barrier in some case but better not count on it. 

Yes, and even if rcu_read_lock() provided a barrier I don't think it
would be sufficient, because acquire semantics don't guarantee that
prior writes appear to happen before the barrier, only the other way
round. A lock operation with release semantics, for example
spin_unlock(), should work.

Thanks,
Jean

> No issues here. I will
> integrate this in the next version.
> 
>> Thanks,
>> Jean
> 
> [Jacob Pan]
> 
