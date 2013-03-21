From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH 2/2] of: remove /proc/device-tree
Date: Thu, 21 Mar 2013 08:43:56 +0100
Message-ID: <1363851836.17680.20.camel@pasglop>
References: <1363791074-16415-1-git-send-email-grant.likely@secretlab.ca>
	 <1363791074-16415-3-git-send-email-grant.likely@secretlab.ca>
	 <1363791479.12701.9.camel@pasglop>
	 <CACxGe6u2wNbPQSOPRCRO0To5UC-b8rXYanv2xv26hk5oaozvPA@mail.gmail.com>
	 <1363839594.17680.19.camel@pasglop>
	 <CACxGe6sXcg51VhFujsjCsMzF80pdy_QhAposdmya4-C0eEcuUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACxGe6sXcg51VhFujsjCsMzF80pdy_QhAposdmya4-C0eEcuUw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, Rob Herring <rob.herring@calxeda.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

On Thu, 2013-03-21 at 07:35 +0000, Grant Likely wrote:
> > Shouldn't we have the symlink just be a config option itself ?
> > Eventually distros might want get rid of it completely ..
> 
> Why? It is the cheapest thing in the world and it means the ABI
> doesn't change at all.

It's also gross and forces sysfs to remain in /sys which isn't a kernel
enforced policy afaik.

Cheers,
Ben.
