From: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Subject: Re: [PATCH v5 2/4] arm64: dts: APM X-Gene PCIe device tree nodes
Date: Wed, 26 Mar 2014 10:35:13 -0600
Message-ID: <20140326163513.GB2440@obsidianresearch.com>
References: <1395270762-6055-1-git-send-email-tinamdar@apm.com>
 <1395270762-6055-3-git-send-email-tinamdar@apm.com>
 <CAL_Jsq+XxAtUeNKFi0hH=ehb_fhFvkM0U1Zm_j1LdtQZbvSzfA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+XxAtUeNKFi0hH=ehb_fhFvkM0U1Zm_j1LdtQZbvSzfA@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Tanmay Inamdar <tinamdar@apm.com>, Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Rob Landley <rob@landley.net>, Liviu Dudau <liviu.dudau@arm.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "patches@apm.com" <patches@apm.com>, "jcm@redhat.com" <jcm@redhat.com>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 26, 2014 at 09:28:42AM -0500, Rob Herring wrote:

> Where is the right place for config space? This binding has it here
> and others have it in ranges. 

I think all the drivers in drivers/pci/host use 'reg', this was
discussed in the dt-bindings list and AFAIK no new drivers have used
ranges since it was brought up.

> Given that config space type is defined for ranges, I would think
> that is the right place. But Liviu's patches do not process config
> space entries in ranges. Perhaps we need a config space resource
> populated in the bridge struct.

When we talked about this earlier on the DT bindings list the
consensus seemed to be that configuration MMIO ranges should only be
used if the underlying memory was exactly ECAM, and was not to be used
for random configuration related register blocks.

The rational being that generic code, upon seeing that ranges entry,
could just go ahead and assume ECAM mapping.

Jason
