From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] powerpc/sequoia: fix NAND partitions not to overlap
Date: Wed, 17 May 2017 14:37:17 -0700
Message-ID: <20170517143717.ad818a2282378fc7a38af1ff@linux-foundation.org>
References: <20170402100535.GA18340@amd>
        <20170517120613.GA583@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170517120613.GA583@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@denx.de>
Cc: sr@denx.de, jwboyer@linux.vnet.ibm.com, robh+dt@kernel.org, mark.rutland@arm.com, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, trivial@kernel.org, Andrew Morton <akpm@osdl.org>
List-Id: devicetree@vger.kernel.org

On Wed, 17 May 2017 14:06:13 +0200 Pavel Machek <pavel@denx.de> wrote:

> On Sun 2017-04-02 12:05:36, Pavel Machek wrote:
> > Fix overlapping NAND partitions.
> > 
> > Signed-off-by: Pavel Machek <pavel@ucw.cz>
> 
> Ping? Two partitions at same place are bad news...

Please expand on "bad news"?  What are the runtime effects of this
change?  Decisions about which kernel(s) to patch depend on this info.
