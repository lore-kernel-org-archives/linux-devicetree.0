From: Reza Arbab <arbab@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/4] powerpc/mm: movable hotplug memory nodes
Date: Wed, 10 Aug 2016 13:43:58 -0500
Message-ID: <20160810184357.GB12039@arbab-laptop.austin.ibm.com>
References: <1470680843-28702-1-git-send-email-arbab@linux.vnet.ibm.com>
 <87shucsypn.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <87shucsypn.fsf@concordia.ellerman.id.au>
Sender: owner-linux-mm@kvack.org
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Jonathan Corbet <corbet@lwn.net>, Bharata B Rao <bharata@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 10, 2016 at 08:30:28PM +1000, Michael Ellerman wrote:
>Reza Arbab <arbab@linux.vnet.ibm.com> writes:
>> Node hotplug is not supported on power [1].
>
>But maybe it should be?

Doing so will involve, at the very least, reverting the commit I cited, 
3af229f2071f ("powerpc/numa: Reset node_possible_map to only 
node_online_map"), and fixing that issue in a different way.

I'll look into it and see what I can do.

-- 
Reza Arbab

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
