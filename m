From: Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCH v8 2/7] doc: Add documentation for Coresight CPU debug
Date: Tue, 9 May 2017 10:55:04 +0800
Message-ID: <20170509025504.GD10347@leoy-ThinkPad-T440>
References: <1493719717-27698-1-git-send-email-leo.yan@linaro.org>
 <1493719717-27698-3-git-send-email-leo.yan@linaro.org>
 <20170503222937.GC7860@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170503222937.GC7860@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wei Xu <xuwei5@hisilicon.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Mike Leach <mike.leach@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Mathieu,

On Wed, May 03, 2017 at 04:29:37PM -0600, Mathieu Poirier wrote:
> On Tue, May 02, 2017 at 06:08:32PM +0800, Leo Yan wrote:
> > Update kernel-parameters.txt to add new parameter:
> > coresight_cpu_debug.enable is a knob to enable debugging at boot time.
> > 
> > Add detailed documentation, which contains the implementation, Mike
> > Leach excellent summary for "clock and power domain". At the end some
> > examples on how to enable the debugging functionality are provided.
> > 
> > Suggested-by: Mike Leach <mike.leach@linaro.org>
> > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> > ---
> >  Documentation/admin-guide/kernel-parameters.txt |   7 +
> >  Documentation/trace/coresight-cpu-debug.txt     | 174 ++++++++++++++++++++++++
> 
> Please add coresight-cpu-debug.txt to the list of maintained files in
> MAINTAINERS.  Moreover I'm pretty sure John will want you to split this patch in
> two, i.e one patch for kernel-parameters.txt and another for
> coresight-cpu-debug.txt

Thanks for the suggestion. Have splited doc related patches and
refined debug module related code as you suggested in another
email and sent out v9 patch set for reviewing.

[...]

Thanks,
Leo Yan
