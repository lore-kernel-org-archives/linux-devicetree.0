From: Reza Arbab <arbab@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 2/5] drivers/of: do not add memory for unavailable
 nodes
Date: Sat, 22 Oct 2016 20:51:08 -0500
Message-ID: <20161023015107.527l4fvnh2nrup5u@arbab-vm>
References: <1475778995-1420-1-git-send-email-arbab@linux.vnet.ibm.com>
 <1475778995-1420-3-git-send-email-arbab@linux.vnet.ibm.com>
 <2344394.NlaWgtFOqB@new-mexico>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <2344394.NlaWgtFOqB@new-mexico>
Sender: owner-linux-mm@kvack.org
To: Alistair Popple <apopple@au1.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Stewart Smith <stewart@linux.vnet.ibm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Tang Chen <tangchen@cn.fujitsu.com>, linux-mm@kvack.org, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, Bharata B Rao <bharata@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>
List-Id: devicetree@vger.kernel.org

Hi Alistair,

On Fri, Oct 21, 2016 at 05:22:54PM +1100, Alistair Popple wrote:
>From what I can tell it seems that kernels without this patch will try 
>and use this memory even if it is marked in the device-tree as 
>status="disabled" which could lead to problems for older kernels when 
>we start exporting this property from firmware.
>
>Arguably this might not be such a problem in practice as we probably 
>don't have many (if any) existing kernels that will boot on hardware 
>exporting these properties.

Yes, I think you've got it right.

>However given this patch seems fairly independent perhaps it is worth 
>sending as a separate fix if it is not going to make it into this 
>release?

Michael,

If this set as a whole is going to miss the release, would it be helpful 
for me to resend 1/5 and 2/5 as a separate set? They are the minimum 
needed to prevent the possible forward compatibility issue Alistair 
describes.

-- 
Reza Arbab

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
