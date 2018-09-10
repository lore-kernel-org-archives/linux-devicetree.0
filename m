From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 08/21] microblaze: get cpu node with of_get_cpu_node
Date: Mon, 10 Sep 2018 15:49:01 -0500
Message-ID: <CAL_JsqKWy8dmfF2zCAsEVkDdFM14niKtapqnR_K45Kr3-mZhqQ@mail.gmail.com>
References: <20180905193738.19325-1-robh@kernel.org> <20180905193738.19325-9-robh@kernel.org>
 <8b227f8c-f351-18da-b55d-e8979281f510@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8b227f8c-f351-18da-b55d-e8979281f510@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 10, 2018 at 9:56 AM Michal Simek <michal.simek@xilinx.com> wrote:
>
> On 5.9.2018 21:37, Rob Herring wrote:
> > "device_type" use is deprecated for FDT though it has continued to be used
> > for nodes like cpu nodes. Use of_get_cpu_node() instead which works using
> > node names by default. This will allow the eventually removal of cpu
> > device_type properties.
> >
> > Also, fix a leaked reference by adding a missing of_node_put.
> >
> > Cc: Michal Simek <monstr@monstr.eu>
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> > Please ack and I will take via the DT tree. This is dependent on the
> > first 2 patches.
>
> I have tested it and it is align with the spec and all dtses generated
> before 2015 will work without any issue.
> In 2015 new device tree generator was introduced and it is not adding
> reg property to cpu node which is required by this change.
> This will be fixed but that means that all generated dtses from 2015 are
> affected.

Patch 2 was supposed to handle that case. However, it does expect that
there should be an #address-cells equal to 0 in that case. Is that not
a valid assumption?

> That's why will be great if you can also change that pr_err message to
> mentioned to also check reg property to give users a chance to fix it
> properly. Error log below.

I don't think breaking users is good.

I could make this a find by path (/cpus/cpu) instead or just drop it
for microblaze. It doesn't really affect my plans for removing
device_node.type ptr.

Rob


> Anyway here is my
> Tested-by: Michal Simek <michal.simek@xilinx.com>
>
> Thanks,
> Michal
