From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v4 1/5] cramfs: direct memory access support
Date: Tue, 3 Oct 2017 07:59:21 -0700
Message-ID: <20171003145921.GA9954@infradead.org>
References: <20170927233224.31676-1-nicolas.pitre@linaro.org>
 <20170927233224.31676-2-nicolas.pitre@linaro.org>
 <20171001082955.GA17116@infradead.org>
 <nycvar.YSQ.7.76.1710011659530.5407@knanqh.ubzr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <nycvar.YSQ.7.76.1710011659530.5407@knanqh.ubzr>
Sender: owner-linux-mm@kvack.org
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Christoph Hellwig <hch@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-embedded@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Brandt <Chris.Brandt@renesas.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Oct 01, 2017 at 06:27:11PM -0400, Nicolas Pitre wrote:
> If you prefer, the physical address could be specified with a Kconfig 
> symbol just like the kernel link address. Personally I think it is best 
> to keep it along with the other root mount args. But going all the way 
> with a dynamic driver binding interface and a dummy intermediate name is 
> like using a sledge hammer to kill an ant: it will work of course, but 
> given the context it is prone to errors due to the added manipulations 
> mentioned previously ... and a tad overkill.

As soon as a kernel enables CRAMFS_PHYSMEM this mount option is
available, so you don't just need to think of your use case.

The normal way for doings this would be to specify it in the device
tree.

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
