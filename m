From: Reza Arbab <arbab@linux.vnet.ibm.com>
Subject: Re: [PATCH v6 4/4] of/fdt: mark hotpluggable memory
Date: Mon, 14 Nov 2016 13:34:52 -0600
Message-ID: <20161114193451.bzowsi6csesoxwap@arbab-laptop.austin.ibm.com>
References: <1478562276-25539-1-git-send-email-arbab@linux.vnet.ibm.com>
 <1478562276-25539-5-git-send-email-arbab@linux.vnet.ibm.com>
 <87bmxii85s.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <87bmxii85s.fsf@concordia.ellerman.id.au>
Sender: owner-linux-mm@kvack.org
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, devicetree@vger.kernel.org, Bharata B Rao <bharata@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Stewart Smith <stewart@linux.vnet.ibm.com>, Alistair Popple <apopple@au1.ibm.com>, Balbir Singh <bsingharora@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 14, 2016 at 10:59:43PM +1100, Michael Ellerman wrote:
>So I'm not opposed to this, but it is a little vague.
>
>What does the "hotpluggable" property really mean?
>
>Is it just a hint to the operating system? (which may or may not be
>Linux).
>
>Or is it a direction, "this memory must be able to be hotunplugged"?
>
>I think you're intending the former, ie. a hint, which is probably OK.
>But it needs to be documented clearly.

Yes, you've got it right. It's just a hint, not a mandate.

I'm about to send v7 which adds a description of "hotpluggable" in the 
documentation. Hopefully I've explained it well enough there.

-- 
Reza Arbab

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
