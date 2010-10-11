From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 1/7] sparc: make drivers/of/pdt.c no longer sparc-only
Date: Sun, 10 Oct 2010 22:10:10 -0600
Message-ID: <20101011041010.GB23588@angua.secretlab.ca>
References: <20101010014358.30cb74b5@debxo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <sparclinux-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20101010014358.30cb74b5@debxo>
Sender: sparclinux-owner@vger.kernel.org
To: Andres Salomon <dilinger@queued.net>
Cc: devicetree-discuss@lists.ozlabs.org, David Miller <davem@davemloft.net>, sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Oct 10, 2010 at 01:43:58AM -0700, Andres Salomon wrote:
> 
> Clean up pdt.c:
>  - make build dependent upon config OF_PROMTREE
>  - #ifdef out the sparc-specific stuff
>  - create pdt-specific header
> 
> Signed-off-by: Andres Salomon <dilinger@queued.net>

Applied, thanks.  Since the difference between this version and the
last is trivial, I've carried over davem's acked-by lines on the first
3 patches.

Dave, let me know if you've got any issues with this and I'll drop
them from my tree.

g.

