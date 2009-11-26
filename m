From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH 08/11] of: Merge of_node_get() and of_node_put()
Date: Thu, 26 Nov 2009 15:06:47 +1100
Message-ID: <1259208407.16367.233.camel@pasglop>
References: <20091124081316.6216.66310.stgit@angua>
	 <20091124081918.6216.77775.stgit@angua>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <20091124081918.6216.77775.stgit@angua>
Sender: sparclinux-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linuxppc-dev@lists.ozlabs.org, devicetree-discuss@lists.ozlabs.org, sparclinux@vger.kernel.org, microblaze-uclinux@itee.uq.edu.au, sfr@canb.auug.org.au, davem@davemloft.net, monstr@monstr.eu
List-Id: devicetree@vger.kernel.org

On Tue, 2009-11-24 at 01:19 -0700, Grant Likely wrote:

>  
> +#if !defined(CONFIG_SPARC)   /* SPARC doesn't do ref counting (yet) */
> +/**

Make this a Kconfig symbol, something like CONFIG_OF_DYNAMIC. You need
refcounting when you can add/remove nodes dynamically. Some embedded
archs might want the option to not enable that and save space.

Cheers,
Ben.


