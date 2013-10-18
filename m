From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] of/lib: Export fdt routines to modules
Date: Fri, 18 Oct 2013 19:38:04 +0100
Message-ID: <20131018183804.GA8546@e106331-lin.cambridge.arm.com>
References: <1381966065-16854-1-git-send-email-mbohan@codeaurora.org>
 <525F2397.40203@caviumnetworks.com>
 <20131017002731.GA22830@codeaurora.org>
 <525F6D83.1050808@roeck-us.net>
 <20131017235132.GA6241@codeaurora.org>
 <52608457.5040609@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <52608457.5040609@roeck-us.net>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>, Michael Bohan <mbohan@codeaurora.org>
Cc: David Daney <ddaney@caviumnetworks.com>, David Gibson <david@gibson.dropbear.id.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "ralf@linux-mips.org" <ralf@linux-mips.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "david.daney@cavium.com" <david.daney@cavium.com>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-Id: devicetree@vger.kernel.org

Hi all,

Guenter, thanks for adding devicetree to Cc.

On Fri, Oct 18, 2013 at 01:44:07AM +0100, Guenter Roeck wrote:
> On 10/17/2013 04:51 PM, Michael Bohan wrote:
> > On Wed, Oct 16, 2013 at 09:54:27PM -0700, Guenter Roeck wrote:
> >> On 10/16/2013 05:27 PM, Michael Bohan wrote:
> >>> My motivation is actually to use the fdt format as a firmware.
> >>> I have a requirement to express driver metadata that's loadable
> >> >from the filesystem. This data is not reasonable to place in the
> >>> system Device Tree, since it's application specific and does not
> >>> actually describe hardware. The fact that the format chosen is
> >>> 'flattened device tree' is merely just a coincidence.

Michael, could you elaborate on using the fdt format "as a firmware" and
what driver metadata you need to be loadable from the filesystem?

How are you intending to pass the DT to the kernel from userspace?

Given that you mention this is application-specific configuration, why
is using sysfs attributes or some other sort of filesystem interaction
not appropriate?

Thanks,
Mark.
