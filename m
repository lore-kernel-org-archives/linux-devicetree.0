From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: Re: [PATCH v3 1/6] mfd: arizona: Add TST_CAP bits for headphone
 detection
Date: Tue, 15 Sep 2015 10:33:27 +0100
Message-ID: <20150915093327.GI11200@ck-lbox>
References: <1441973658-26234-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1441973658-26234-2-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <20150911122451.GB11200@ck-lbox>
 <20150911123757.GC11200@ck-lbox>
 <55F798F3.3030405@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <55F798F3.3030405@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: lee.jones@linaro.org, myungjoo.ham@samsung.com, sameo@linux.intel.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

On Tue, Sep 15, 2015 at 01:05:07PM +0900, Chanwoo Choi wrote:
> Hi Charles,
> 
> Your following patch-set[1][2] receive the ack message about almost patches.
> But, a few patches[3][4][5] must need the ack message from each maintainer.
> [1] http://www.spinics.net/lists/devicetree/msg93383.html
> [2] https://lkml.org/lkml/2015/8/11/145
> [3] patch1 is included in patch-set[1]
> : [PATCH v3 1/6] mfd: arizona: Add TST_CAP bits for headphone detection
> [4] patch6 is included in patch-set[1]
> : [PATCH v2 6/6] mfd: arizona: Update DT binding documentation for jack detection
> [5] patch5 is included in patch-set[2]
> [PATCH RESEND 5/5] mfd: arizona: Update DT doc for new mic detection bindings

:-) Getting a DT ack is not an easy thing, like gold dust those
are.

If we are going to make merging anything dependent on an ack from
the DT guys I will probably merge these two series of patches,
then resplit (and resend) them into changes that affect DT and
those that don't. That way at least we can get something in, as I
am starting to carry a fair backlog of changes on this one and it
reduces the amount of diff that the very busy DT guys will need
to look at.

Thanks,
Charles
