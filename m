From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Subject: RE: [PATCH v3 0/2] ARC: Add perf support for ARC700 cores
Date: Tue, 12 Nov 2013 09:44:34 +0000
Message-ID: <E6BF041E97966E4DB955F0DF883AD2D685F17293@de02wembxa.internal.synopsys.com>
References: <1383832512-21130-1-git-send-email-mjonker@synopsys.com>
 <20131111162755.GC26898@twins.programming.kicks-ass.net>
 <20131111163042.GA10977@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20131111163042.GA10977@twins.programming.kicks-ass.net>
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>, Mischa Jonker <Mischa.Jonker@synopsys.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Vineet.Gupta1@synopsys.com" <Vineet.Gupta1@synopsys.com>, "mingo@redhat.com" <mingo@redhat.com>
List-Id: devicetree@vger.kernel.org

> Ah, so its one of those that cannot sample; you might want to fail when we
> try and create a sampling event.

Good suggestion, I'll create a separate patch for that!

> Also, you could consider running an (hr)timer to periodically update the
> events so that you don't miss a hardware counter wrap around -- if that is a
> distinct possibility.

It's a theoretical possibility: the counters are 48 bits. Unlikely to happen
during application development/performance analysis on an embedded core.

Thanks,

Mischa
