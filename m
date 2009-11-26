From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 04/11] of/flattree: eliminate cell_t typedef
Date: Thu, 26 Nov 2009 15:32:12 -0800 (PST)
Message-ID: <20091126.153212.142866981.davem@davemloft.net>
References: <fa686aa40911252005o2db85dfk3d9acc61c12ca5e5@mail.gmail.com>
	<1259213266.16367.274.camel@pasglop>
	<F307E7FB-0819-47E8-9CF4-CA1433C18DA6@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <F307E7FB-0819-47E8-9CF4-CA1433C18DA6@kernel.crashing.org>
Sender: sparclinux-owner@vger.kernel.org
To: segher@kernel.crashing.org
Cc: benh@kernel.crashing.org, grant.likely@secretlab.ca, sfr@canb.auug.org.au, microblaze-uclinux@itee.uq.edu.au, devicetree-discuss@lists.ozlabs.org, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

From: Segher Boessenkool <segher@kernel.crashing.org>
Date: Thu, 26 Nov 2009 22:36:41 +0100

>>> You're right, it's not, but makes merging less complex, and then I can
>>> refactor properly.
>>
>> Still, make them __be32 at least
> 
> There is no alignment guarantee at all either, better make it all u8
> and use accessor functions everywhere.

I think that might be overkill.
