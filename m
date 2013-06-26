From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v3 1/2] uio: Use of_match_ptr() macro in uio_pdrv_genirq.c
Date: Wed, 26 Jun 2013 15:30:31 +0530
Message-ID: <CAK9yfHzVSt1XN7=OZOtF_n_3jbpXObqoiay_t6n3EauTjUUX+w@mail.gmail.com>
References: <03c8973cc1e9efcd203e4d95d2dd9469afbcb39b.1372240320.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <03c8973cc1e9efcd203e4d95d2dd9469afbcb39b.1372240320.git.michal.simek@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: linux-kernel@vger.kernel.org, Michal Simek <monstr@monstr.eu>, Pavel Machek <pavel@ucw.cz>, "Hans J. Koch" <hjk@hansjkoch.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 26 June 2013 15:22, Michal Simek <michal.simek@xilinx.com> wrote:
> This eliminates having an #ifdef returning NULL for the case
> when OF is disabled.
>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>

I have already submitted a similar patch for doing this:
https://lkml.org/lkml/2013/3/14/169

-- 
With regards,
Sachin
