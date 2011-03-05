From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [RFC PATCH v2 02/12] of: Allow scripts/dtc/libfdt to be used
	from kernel code
Date: Sat, 5 Mar 2011 23:04:47 +0100
Message-ID: <20110305220447.GB21728@merkur.ravnborg.org>
References: <1299267744-17278-1-git-send-email-ddaney@caviumnetworks.com> <1299267744-17278-3-git-send-email-ddaney@caviumnetworks.com> <20110305005750.GC7579@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110305005750.GC7579@angua.secretlab.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: David Daney <ddaney@caviumnetworks.com>, linux-mips@linux-mips.org, ralf@linux-mips.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> 
> libfdt_env.h should be in include/linux
> 
> > +#include "../../scripts/dtc/libfdt/fdt.h"
> > +#include "../../scripts/dtc/libfdt/libfdt.h"
> 
> Hmmm... I wonder if there is a better way to do this.  I don't much
> care for the relative path references.

I assume:
#include "scripts/dtc/libfdt/fdt.h"
#include "scripts/dtc/libfdt/libfdt.h"

works. Because working direcotry is root of kernel tree.
But it is long time ago I played with this so my memory may foul me.

Just noticed this...
> > +
> > +EXTRA_CFLAGS += -include $(src)/libfdt_env.h -I$(src)/../../scripts/dtc/libfdt

"ccflags-y := ..." is recommended these days.

	Sam
