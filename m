From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v3] dt: psci: Update DT bindings to support hierarchical
 PSCI states
Date: Tue, 9 Jan 2018 14:27:24 +0100
Message-ID: <CAPDyKFoyTmHCMXNjgEA=nFff_CVHzj_nVZ-mZb-PkT8_eTqqrQ@mail.gmail.com>
References: <1515498913-24291-1-git-send-email-ulf.hansson@linaro.org> <18b1d849-038d-f768-99aa-b363e4c8b2f8@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <18b1d849-038d-f768-99aa-b363e4c8b2f8@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, Lina Iyer <lina.iyer@linaro.org>, Kevin Hilman <khilman@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 9 January 2018 at 13:09, Sudeep Holla <sudeep.holla@arm.com> wrote:
> (Removed Brendan Jackman as he is no longer works in ARM)
>
> On 09/01/18 11:55, Ulf Hansson wrote:
>> From: Lina Iyer <lina.iyer@linaro.org>
>>
>> Update DT bindings to represent hierarchical CPU and CPU domain idle states
>> for PSCI. Also update the PSCI examples to clearly show how flattened and
>> hierarchical idle states can be represented in DT.
>>
>
> It now looks good to me :)
>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>

Rob, Sudeep, thanks for reviews!

Rob, do you want to pick this up now? Or how do you want me to manage
the patch going forward?

Kind regards
Uffe
