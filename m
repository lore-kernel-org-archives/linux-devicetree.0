From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2 0/3] Add R8A7743/SK-RZG1M PFC support
Date: Mon, 24 Apr 2017 08:12:18 +0200
Message-ID: <20170424061217.GC14843@verge.net.au>
References: <20170420185132.258111787@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170420185132.258111787@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 20, 2017 at 09:51:32PM +0300, Sergei Shtylyov wrote:
> Hello.
> 
>    Here's the set of 3 patches against Simon Horman's 'renesas.git' repo,
> 'renesas-devel-20170420-v4.11-rc7' tag.  We're adding the R8A7743 PFC node
> and then describing the pins for SCIF0 and Ether devices declared earlier.
> These patches depend on the R8A7743 PFC suport in order to work properly.

Thanks. I have marked these as deferred pending acceptance of the PFC
driver changes. Please repost or otherwise let me know when dependency
is satisfied.
