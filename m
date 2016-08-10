From: Nathan Fontenot <nfont@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/4] powerpc/mm: movable hotplug memory nodes
Date: Wed, 10 Aug 2016 09:39:05 -0500
Message-ID: <76b4ef23-be57-8138-8117-77531750539e@linux.vnet.ibm.com>
References: <1470680843-28702-1-git-send-email-arbab@linux.vnet.ibm.com>
 <87shucsypn.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <87shucsypn.fsf@concordia.ellerman.id.au>
Sender: owner-linux-mm@kvack.org
To: Michael Ellerman <mpe@ellerman.id.au>, Reza Arbab <arbab@linux.vnet.ibm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Jonathan Corbet <corbet@lwn.net>, Bharata B Rao <bharata@linux.vnet.ibm.com>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 08/10/2016 05:30 AM, Michael Ellerman wrote:
> Reza Arbab <arbab@linux.vnet.ibm.com> writes:
> 
>> These changes enable onlining memory into ZONE_MOVABLE on power, and the
>> creation of discrete nodes of movable memory.
>>
>> Node hotplug is not supported on power [1].
> 
> But maybe it should be?
> 
Yes, it should be supported.

I have briefly looked into this recently only to find
this will not be a simple update.

-Nathan 

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
