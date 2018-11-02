From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: Crash report: Broken NUMA distance map causes crash on arm64
 system
Date: Fri, 2 Nov 2018 13:19:58 +0100
Message-ID: <20181102121958.GL3178@hirez.programming.kicks-ass.net>
References: <b89bf686-05bd-a3de-e7ef-4ab9ab7bdb6c@huawei.com>
 <20181030092640.GE1459@hirez.programming.kicks-ass.net>
 <d126099d-2698-8e3a-06ca-f229e57c3052@huawei.com>
 <ae352fe1-3c59-dcde-fd00-2c03b4491dc6@huawei.com>
 <20181031204622.GB3141@hirez.programming.kicks-ass.net>
 <bf2b890a-4ce7-d0f6-0663-84a1a6e8dbd2@huawei.com>
 <20181102105003.GK3178@hirez.programming.kicks-ass.net>
 <be3f2f03-6d19-2c6a-e859-c946594e3af1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <be3f2f03-6d19-2c6a-e859-c946594e3af1@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: John Garry <john.garry@huawei.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linuxarm <linuxarm@huawei.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Ingo Molnar <mingo@redhat.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 02, 2018 at 12:08:53PM +0000, John Garry wrote:
> > @@ -1337,7 +1353,7 @@ void sched_init_numa(void)
> >  	int level = 0;
> >  	int i, j, k;
> > 
> > -	sched_domains_numa_distance = kzalloc(sizeof(int) * nr_node_ids, GFP_KERNEL);
> > +	sched_domains_numa_distance = kzalloc(sizeof(int) * (nr_node_ids + 1), GFP_KERNEL);
> 
> Ahhhh, unfortuately this change in isolation is not fixing the crash for me.
> I'm still crashing in the same place repeatedly.

Hurm.. sadness, means my reproduces doesn't reproduce quite enough :/
I'll see if I can somehow get something better going.
