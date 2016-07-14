From: Tai Tri Nguyen <ttnguyen@apm.com>
Subject: Re: [PATCH v8 0/4] perf: Add APM X-Gene SoC Performance Monitoring
 Unit driver
Date: Thu, 14 Jul 2016 10:28:09 -0700
Message-ID: <CACgAJHyBt4TCoDjm0XGyX8usD_Wt_-7_JA918Wr4oF567wY_EA@mail.gmail.com>
References: <1468263944-10634-1-git-send-email-ttnguyen@apm.com> <20160714131602.GJ29455@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160714131602.GJ29455@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>, Duc Dang <dhdang@apm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, catalin.marinas@arm.com, Joe Perches <joe@perches.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, patches <patches@apm.com>
List-Id: devicetree@vger.kernel.org

Hi Will,

On Thu, Jul 14, 2016 at 6:16 AM, Will Deacon <will.deacon@arm.com> wrote:
> On Mon, Jul 11, 2016 at 12:05:40PM -0700, Tai Nguyen wrote:
>> In addition to the X-Gene ARM CPU performance monitoring unit (PMU), there
>> are PMU for the SoC system devices such as L3 cache(s), I/O bridge(s),
>> memory controller bridges and memory. These PMU devices are loosely
>> architected to follow the same model as the PMU for ARM cores.
>
> You might want to add commit messages to patches 1,2 and 4, but then you
> can route this via the arm-soc tree.
>
> Will

I will add the commit messages to these patches 1, 2 and 4 and rout
this via arm-soc tree.
CC: Duc (dhdang@apm.com)

Thanks,
-- 
Tai
