From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: "memory" binding issues
Date: Tue, 17 Sep 2013 08:42:19 +1000
Message-ID: <1379371339.3721.42.camel@pasglop>
References: <1379300274.4098.77.camel@pasglop>
	 <0A20DA07-7B18-4BD5-AF32-172022B92611@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0A20DA07-7B18-4BD5-AF32-172022B92611@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: devicetree@vger.kernel.org, Linux Kernel list <linux-kernel@vger.kernel.org>, m.szyprowski@samsung.com, swarren@nvidia.com, rob.herring@calxeda.com, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

On Mon, 2013-09-16 at 10:22 -0500, Kumar Gala wrote:
> Where is Jermey's binding documented ?

It looks like I actually came up with this binding :-) Jeremy reminded
me yesterday. It was posted to the DT list a while back, arguably we
should have merged it.

> Is there concern of "breaking" whatever got merged in powerpc?

No. I'm happy to switch over to something else but if anybody uses the
current one we have on powerpc, we can keep the code to support it as
well, it's not a lot of it.

Cheers,
Ben.
