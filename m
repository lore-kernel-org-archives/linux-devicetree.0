From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH] of/mips: Cleanup some include directives/files.
Date: Wed, 20 Oct 2010 07:58:30 +0100
Message-ID: <20101020065830.GA12565@linux-mips.org>
References: <1287528631-31797-1-git-send-email-ddaney@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-mips-bounce@linux-mips.org>
Content-Disposition: inline
In-Reply-To: <1287528631-31797-1-git-send-email-ddaney@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: David Daney <ddaney@caviumnetworks.com>
Cc: linux-mips@linux-mips.org, devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, linux-kernel@vger.kernel.org, Dezhong Diao <dediao@cisco.com>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 19, 2010 at 03:50:31PM -0700, David Daney wrote:

> The __init directives should go on the definitions of things, not the
> declaration, also __init is meaningless for inline functions, so
> remove it from prom.h.  This allows us to get rid of a useless
> #include, but most of the rest of them are useless too, so kill them
> as well.
> 
> If of_i2c.c needs irq definitions, it should include linux/irq.h
> directly, not assume indirect inclusion via asm/prom.h.

Grant, I assume you're going to merge this one.

Acked-by: Ralf Baechle <ralf@linux-mips.org>

  Ralf
