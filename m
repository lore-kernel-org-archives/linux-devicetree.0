From: Reza Arbab <arbab@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 4/5] mm: make processing of movable_node arch-specific
Date: Tue, 25 Oct 2016 10:55:07 -0500
Message-ID: <20161025155507.37kv5akdlgo6m2be@arbab-laptop.austin.ibm.com>
References: <1475778995-1420-1-git-send-email-arbab@linux.vnet.ibm.com>
 <1475778995-1420-5-git-send-email-arbab@linux.vnet.ibm.com>
 <235f2d20-cf84-08df-1fb4-08ee258fdc52@gmail.com>
 <dcfc8ace-e59e-6b4b-0f2f-4eff9f08f3c1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <dcfc8ace-e59e-6b4b-0f2f-4eff9f08f3c1@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Balbir Singh <bsingharora@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Bharata B Rao <bharata@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Stewart Smith <stewart@linux.vnet.ibm.com>, Alistair Popple <apopple@au1.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, Tang Chen <tangchen@cn.fujitsu.com>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, linux-mm@kvack.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 25, 2016 at 11:15:40PM +1100, Balbir Singh wrote:
>After the ack, I realized there were some more checks needed, IOW
>questions for you :)

Hey! No takebacks!

The short answer is that neither of these is a concern.

Longer; if you use "movable_node", x86 can identify these nodes at boot. 
They call memblock_mark_hotplug() while parsing the SRAT. Then, when the 
zones are initialized, those markings are used to determine ZONE_MOVABLE.

We have no analog of this SRAT information, so our movable nodes can 
only be created post boot, by hotplugging and explicitly onlining with 
online_movable.

>1. Have you checked to see if our memblock allocations spill
>over to probably hotpluggable nodes?

Since our nodes don't exist at boot, we don't have that short window 
before the zones are drawn where the node has normal memory, and a 
kernel allocation might occur within.

>2. Shouldn't we be marking nodes discovered as movable via
>memblock_mark_hotplug()?

Again, this early boot marking mechanism only applies to movable_node.

-- 
Reza Arbab
