From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 0/2] Add R8A7792 DU support
Date: Tue, 9 Aug 2016 14:32:31 +0200
Message-ID: <20160809123228.GA5878@verge.net.au>
References: <4031442.KeMCTMarLN@wasted.cogentembedded.com>
 <4a413062-d7f4-166a-f915-01803bddf441@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4a413062-d7f4-166a-f915-01803bddf441@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 05, 2016 at 09:28:59PM +0300, Sergei Shtylyov wrote:
> On 08/05/2016 09:24 PM, Sergei Shtylyov wrote:
> 
> >   Here's the set of 2 patches against Simon Horman's 'renesas.git' repo,
> >'renesas-devel-20160725-v4.7-rc7' tag. We're adding the R8A7792 DU clocks and
> >device nodes. They have been tested on the Blanche board -- I'm not posting the
> >Blanche patch only because it also has some strange interaction with the
> >Ethernet chip, so that NFS root can't work anymore...
> 
>    Forgot to mention that the patch #2 depends on the R8A7792 DU driver
> patch posted last night.

Thanks.

The driver changes look line an incremental update to what is already done
for other R-Car Gen2 SoCs. And I am assuming that applying these patches
without the driver change is harmless - the driver just won't be
initialised until both the driver and DTS changes are present.

With the above reasoning I have queued up these patches with Geert's
reviewed-by tag. Please let me know if that is not desirable for some
reason.
