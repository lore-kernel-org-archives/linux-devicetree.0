From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH] dma: fix returnvar.cocci warnings
Date: Sun, 8 Nov 2015 15:19:40 -0600
Message-ID: <563FBC6C.8040207@codeaurora.org>
References: <alpine.DEB.2.10.1511080843100.2637@hadrien>
 <CAHp75VdRN14EWUaTPzO45Z_mBzeQ=9sqzP3mMsMSQ2nXNi5QKg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VdRN14EWUaTPzO45Z_mBzeQ=9sqzP3mMsMSQ2nXNi5QKg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Julia Lawall <julia.lawall@lip6.fr>
Cc: Sinan Kaya <okaya@codeaurora.org>, Andy Gross <agross@codeaurora.org>, kbuild-all@01.org, dmaengine <dmaengine@vger.kernel.org>, cov@codeaurora.org, jcm@redhat.com, linux-arm-msm@vger.kernel.org, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Andy Shevchenko wrote:
>> >CC: Sinan Kaya<okaya@codeaurora.org>
>> >Signed-off-by: Fengguang Wu<fengguang.wu@intel.com>
> Who is the author?
> I suppose Fengguang is the reporter, right?
>

These are Julia Lawall's coccinelle scripts that automatically run on 
patches and report problems.  Just treat them like normal code reviews 
and incorporate the change in the next version of your patch.

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the
Code Aurora Forum, hosted by The Linux Foundation.
