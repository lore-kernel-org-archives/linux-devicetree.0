From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v6 1/4] powerpc/mm: allow memory hotplug into a memoryless node
Date: Thu, 10 Nov 2016 12:37:10 +1100
Message-ID: <87k2ccjet5.fsf@concordia.ellerman.id.au>
References: <1478562276-25539-1-git-send-email-arbab@linux.vnet.ibm.com> <1478562276-25539-2-git-send-email-arbab@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1478562276-25539-2-git-send-email-arbab@linux.vnet.ibm.com>
Sender: owner-linux-mm@kvack.org
To: Reza Arbab <arbab@linux.vnet.ibm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, devicetree@vger.kernel.org, Bharata B Rao <bharata@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Stewart Smith <stewart@linux.vnet.ibm.com>, Alistair Popple <apopple@au1.ibm.com>, Balbir Singh <bsingharora@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Reza Arbab <arbab@linux.vnet.ibm.com> writes:

> Remove the check which prevents us from hotplugging into an empty node.
>
> The original commit b226e4621245 ("[PATCH] powerpc: don't add memory to
> empty node/zone"), states that this was intended to be a temporary measure.
> It is a workaround for an oops which no longer occurs.
>
> Signed-off-by: Reza Arbab <arbab@linux.vnet.ibm.com>
> Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
> Acked-by: Balbir Singh <bsingharora@gmail.com>
> Cc: Nathan Fontenot <nfont@linux.vnet.ibm.com>
> Cc: Bharata B Rao <bharata@linux.vnet.ibm.com>
> ---
>  arch/powerpc/mm/numa.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)

This seems OK from a powerpc perspective.

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
