From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: macintosh: Use of_node_name_{eq, prefix} for node name comparisons
Date: Mon, 24 Dec 2018 00:28:00 +1100 (AEDT)
Message-ID: <43N38J6sjSz9sN8@ozlabs.org>
References: <20181205195050.4759-12-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181205195050.4759-12-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Wed, 2018-12-05 at 19:50:28 UTC, Rob Herring wrote:
> Convert string compares of DT node names to use of_node_name_{eq,prefix}
> helpers instead. This removes direct access to the node name pointer.
> 
> This changes a single case insensitive node name comparison to case
> sensitive for "ata4". This is the only instance of a case insensitive
> comparison for all the open coded node name comparisons on powerpc.
> Searching the commit history, there doesn't appear to be any reason for
> it to be case insensitive.
> 
> A couple of open coded iterating thru the child node names are converted
> to use for_each_child_of_node() instead.
> 
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/f1e0addca8bd7386f8cabbc64c9988

cheers
