From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v3 1/2] ARC: Add perf support for ARC700 cores
Date: Tue, 12 Nov 2013 04:36:45 +0000
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075155E99@IN01WEMBXA.internal.synopsys.com>
References: <1383832512-21130-1-git-send-email-mjonker@synopsys.com>
 <1383832512-21130-2-git-send-email-mjonker@synopsys.com>
 <20131111162715.GB26898@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>, Mischa Jonker <Mischa.Jonker@synopsys.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mingo@redhat.com" <mingo@redhat.com>
List-Id: devicetree@vger.kernel.org

On 11/11/2013 09:57 PM, Peter Zijlstra wrote:
> On Thu, Nov 07, 2013 at 02:55:11PM +0100, Mischa Jonker wrote:
>> This adds basic perf support for ARC700 cores. Most PERF_COUNT_HW* events
>> are supported now.
> I don't see anything particularly weird, but then I don't know/have the
> hardware so I suppose you know what you're doing :-)
>
> Acked-by: Peter Zijlstra <peterz@infradead.org>

Thanks Peter.

This is now queued for next batch for arc 3.13-rc1 changes since we've been using
this internally for quite some time now.

-Vineet
