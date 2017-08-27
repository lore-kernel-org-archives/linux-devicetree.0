From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: Re: [PATCH] of: do not leak console options
Date: Sun, 27 Aug 2017 17:01:48 +0900
Message-ID: <20170827080148.GB581@tigerII.localdomain>
References: <20170825173647.1004-1-sergey.senozhatsky@gmail.com>
 <20170825223721.hilqpt5z4urevh6b@rob-hp-laptop>
 <20170827071910.GA581@tigerII.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170827071910.GA581@tigerII.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Grant Likely <grant.likely@secretlab.ca>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
List-Id: devicetree@vger.kernel.org

On (08/27/17 16:19), Sergey Senozhatsky wrote:
[..]
> int uart_parse_earlycon(char *p, unsigned char *iotype, resource_size_t *addr,
> 			char **options)
> {
> 	if (strncmp(p, "mmio,", 5) == 0) {
> 		*iotype = UPIO_MEM;
> 		p += 5;
> 	} else if (strncmp(p, "mmio16,", 7) == 0) {
> 		*iotype = UPIO_MEM16;
> 		p += 7;
> 	} else if (strncmp(p, "mmio32,", 7) == 0) {
> 		*iotype = UPIO_MEM32;
> 		p += 7;
> 	} else if (strncmp(p, "mmio32be,", 9) == 0) {
> 		*iotype = UPIO_MEM32BE;
> 		p += 9;
> 	} else if (strncmp(p, "mmio32native,", 13) == 0) {
> 		*iotype = IS_ENABLED(CONFIG_CPU_BIG_ENDIAN) ?
> 			UPIO_MEM32BE : UPIO_MEM32;
> 		p += 13;
> 	} else if (strncmp(p, "io,", 3) == 0) {
> 		*iotype = UPIO_PORT;
> 		p += 3;
> 	} else if (strncmp(p, "0x", 2) == 0) {
> 		*iotype = UPIO_MEM;
> 	} else {
> 		return -EINVAL;
> 	}
> 
> 	/*
> 	 * Before you replace it with kstrtoull(), think about options separator
> 	 * (',') it will not tolerate
> 	 */
> 	*addr = simple_strtoull(p, NULL, 0);
> 	p = strchr(p, ',');
> 	if (p)
> 		p++;
> 
> 	*options = p;
> 	return 0;
> }
> 
> that's just one example I found after a very quick grepping. may be
> there are other control paths that can change ->options.

well, obviously, it doesn't change the options per se, but it sort of
demonstrates that _probably_ somewhere ->options could be changed. on
the other hand, that ->options = ->options + X makes it rather hard
to kfree() the ->options. well, we never kfree() the ->options anyway,
as far as I can tell...

	-ss
