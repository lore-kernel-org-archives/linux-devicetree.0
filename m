From: Reza Arbab <arbab@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 2/3] powerpc/mm: allow memory hotplug into a
 memoryless node
Date: Wed, 21 Sep 2016 00:50:38 -0500
Message-ID: <20160921055038.o2z73uwmxpxlabmd@arbab-laptop>
References: <1473883618-14998-1-git-send-email-arbab@linux.vnet.ibm.com>
 <1473883618-14998-3-git-send-email-arbab@linux.vnet.ibm.com>
 <15d62e9c-38e6-dfd3-0ee2-6885cbfbe315@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <15d62e9c-38e6-dfd3-0ee2-6885cbfbe315@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Balbir Singh <bsingharora@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, Bharata B Rao <bharata@linux.vnet.ibm.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Stewart Smith <stewart@linux.vnet.ibm.com>, Alistair Popple <apopple@au1.ibm.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, linux-mm@kvack.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 19, 2016 at 09:53:49PM +1000, Balbir Singh wrote:
>I presume you've tested with CONFIG_NODES_SHIFT of 8 (255 nodes?)

Oh yes, definitely.

The large number of possible nodes does not come into play here.

-- 
Reza Arbab

