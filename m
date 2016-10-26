From: Reza Arbab <arbab@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 4/5] mm: make processing of movable_node arch-specific
Date: Wed, 26 Oct 2016 12:03:44 -0500
Message-ID: <20161026170343.2sf6qkhetfzygqya@arbab-laptop.austin.ibm.com>
References: <1475778995-1420-1-git-send-email-arbab@linux.vnet.ibm.com>
 <1475778995-1420-5-git-send-email-arbab@linux.vnet.ibm.com>
 <235f2d20-cf84-08df-1fb4-08ee258fdc52@gmail.com>
 <dcfc8ace-e59e-6b4b-0f2f-4eff9f08f3c1@gmail.com>
 <20161025155507.37kv5akdlgo6m2be@arbab-laptop.austin.ibm.com>
 <112504e9-561d-e0da-7a40-73996c678b56@gmail.com>
 <20161026004929.h6v54dhehk4yvmwm@arbab-vm>
 <87vawfwfei.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87vawfwfei.fsf@concordia.ellerman.id.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Balbir Singh <bsingharora@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Bharata B Rao <bharata@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Stewart Smith <stewart@linux.vnet.ibm.com>, Alistair Popple <apopple@au1.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, Tang Chen <tangchen@cn.fujitsu.com>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, linux-mm@kvack.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 26, 2016 at 09:52:53PM +1100, Michael Ellerman wrote:
>> As far as I know, power has nothing like the SRAT that tells us, at
>> boot, which memory is hotpluggable.
>
>On pseries we have the ibm,dynamic-memory device tree property, which
>can contain ranges of memory that are not yet "assigned to the
>partition" - ie. can be hotplugged later.
>
>So in general that statement is not true.
>
>But I think you're focused on bare-metal, in which case you might be
>right. But that doesn't mean we couldn't have a similar property, if
>skiboot/hostboot knew what the ranges of memory were going to be.

Yes, sorry, I should have qualified that statement to say I wasn't 
talking about pseries.

I can amend this set to actually implement movable_node on power too, 
but we'd have to settle on a name for the dt property. Is 
"linux,movable-node" too on the nose?

-- 
Reza Arbab
