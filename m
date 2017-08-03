From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 2/5] of: reserved_mem: Accessor for acquiring
 reserved_mem
Date: Thu, 3 Aug 2017 16:31:46 -0700
Message-ID: <20170803233146.GB29306@minitux>
References: <20170803025754.19101-1-bjorn.andersson@linaro.org>
 <20170803025754.19101-3-bjorn.andersson@linaro.org>
 <CAL_JsqL1Jh2AnWSWfau3LGhvuS1giTg6_r7gPGrHyZ6KRocSYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqL1Jh2AnWSWfau3LGhvuS1giTg6_r7gPGrHyZ6KRocSYg@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu 03 Aug 10:45 PDT 2017, Rob Herring wrote:

> On Wed, Aug 2, 2017 at 9:57 PM, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> > In some cases drivers referencing a reserved-memory region might want to
> > remap the entire region, but when defining the reserved-memory by "size"
> > the client driver has no means to know the associated base address of
> > the reserved memory region.
> >
> > This patch adds an accessor for such drivers to acquire a handle to
> > their associated reserved-memory for this purpose.
> >
> > A complicating factor for the implementation is that the reserved_mem
> > objects are created from the flattened DeviceTree, as such we can't
> > use the device_node address for comparison. Fortunately the name of the
> > node will be used as "name" of the reserved_mem and will be used when
> > building the full_name, so we can compare the "name" with the basename
> > of the full_name to find the match.
> 
> Maybe we should add the device_node pointer when we unflatten?
> 

It did try to figure something sane out in that direction.

The solution I came up with was to amend populate_node() to in a !dryrun
block check if the "dad" full_name is /reserved-memory and if so
call call a new accessor in of_reserved_mem.c to add the "np" to the
reserved_mem object with fdt_node equal offset.

This code path is already cluttered due to the version differences when
it comes to building full_name and we would end up checking for each
node in the entire tree if the parent happens to be "/reserved-mem".

So I went for the less intrusive and more straight forward comparison
with basename(full_name) instead.


Do you have any alternative suggestion of how to do this?

Regards,
Bjorn
