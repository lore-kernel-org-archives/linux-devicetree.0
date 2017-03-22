From: Alan Tull <delicious.quinoa@gmail.com>
Subject: Re: [PATCH v6 2/4] fpga pr ip: Core driver support for Altera Partial
 Reconfiguration IP.
Date: Wed, 22 Mar 2017 10:28:34 -0500
Message-ID: <CANk1AXTb=b8urUJ-Nc7hVOT03HTt=Thtb5HiufdjQHuWd1NsYw@mail.gmail.com>
References: <1490130159-2597-1-git-send-email-matthew.gerlach@linux.intel.com> <1490130159-2597-3-git-send-email-matthew.gerlach@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1490130159-2597-3-git-send-email-matthew.gerlach@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: matthew.gerlach@linux.intel.com
Cc: Moritz Fischer <moritz.fischer@ettus.com>, linux-fpga@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Anatolij Gustschin <agust@denx.de>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 21, 2017 at 4:02 PM,  <matthew.gerlach@linux.intel.com> wrote:
> From: Matthew Gerlach <matthew.gerlach@linux.intel.com>
>
> Adding the core functions necessary for a fpga-mgr driver
> for the Altera Partial IP component.  It is intended for
> these functions to be used by the various bus implementations
> like the platform bus or the PCIe bus.
>
> Signed-off-by: Matthew Gerlach <matthew.gerlach@linux.intel.com>

Acked-by: Alan Tull <atull@kernel.org>

> ---
> v6:
>     Suggestions from Anatolij Gustschin <agust@denx.de>
>     s/pr_err/dev_err/g
>     Change for loop to do/while to handle config_complete_timeout_us == 0
>     move altera-pr-ip-core.h to include/linux/fpga
> v5:
>     Fix comment as suggested by Rob Herring <robh@kernel.org>
> v4:
>     v3 patch set mistakenly sent out labeled as v4
> v3:
>     s/alt_pr_probe/alt_pr_register/
>     s/alt_pr_remove/alt_pr_unregister/
>
