From: Leo Yan <leo.yan@linaro.org>
Subject: Re: [PATCHv5 6/7] coresight: debug: Add Unique Component Identifier
 (UCI) table
Date: Tue, 29 Jan 2019 21:36:05 +0800
Message-ID: <20190129133605.GB16669@leoy-ThinkPad-X240s>
References: <cover.1548419933.git.saiprakash.ranjan@codeaurora.org>
 <1019e6fed1ade6a580f01df9b3f70c2a9df5b3be.1548419933.git.saiprakash.ranjan@codeaurora.org>
 <20190129132528.GA16669@leoy-ThinkPad-X240s>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190129132528.GA16669@leoy-ThinkPad-X240s>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Jeffrey Hugo <jhugo@codeaurora.org>, Rajendra Nayak <rnayak@codeaurora.org>, Tingwei Zhang <tingwei@codeaurora.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, linux-kernel@vger.kernel.org, Marc Gonzalez <marc.w.gonzalez@free.fr>, Doug Anderson <dianders@chromium.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, David Brown <david.brown@linaro.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sibi Sankar <sibis@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, linux-arm-msm@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, Stephen Boyd <sboyd@kernel.org>, linux-arm-kernel@lists.infradead.org, Mike Leach <mike.leach@linaro.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 29, 2019 at 09:25:28PM +0800, Leo Yan wrote:
> On Tue, Jan 29, 2019 at 12:44:03AM +0530, Sai Prakash Ranjan wrote:
> > Add UCI table and a helper macro for coresight CPU debug
> > module. This patch adds the UCI entries for Krypo CPUs
> > found on MSM8996 which shares the same PIDs as ETMs.
> > 
> > Without this, below error is observed on MSM8996:
> > 
> > [    5.429867] OF: graph: no port node found in /soc/debug@3810000
> > [    5.429938] coresight-etm4x: probe of 3810000.debug failed with error -22
> > [    5.435415] coresight-cpu-debug 3810000.debug: Coresight debug-CPU0 initialized
> > [    5.446474] OF: graph: no port node found in /soc/debug@3910000
> > [    5.448927] coresight-etm4x: probe of 3910000.debug failed with error -22
> > [    5.454681] coresight-cpu-debug 3910000.debug: Coresight debug-CPU1 initialized
> > [    5.487765] OF: graph: no port node found in /soc/debug@3a10000
> > [    5.488007] coresight-etm4x: probe of 3a10000.debug failed with error -22
> > [    5.493024] coresight-cpu-debug 3a10000.debug: Coresight debug-CPU2 initialized
> > [    5.501802] OF: graph: no port node found in /soc/debug@3b10000
> > [    5.512901] coresight-etm4x: probe of 3b10000.debug failed with error -22
> > [    5.513192] coresight-cpu-debug 3b10000.debug: Coresight debug-CPU3 initialized
> > 
> > Also add a helper macro to make adding CPU PIDs easier
> > similar to ETM4X driver.
> > 
> > Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> 
> Looks good to me and tested on my Hikey board (though I cannot test
> for a device with UCI ID):
> 
> Reviewed-and-tested-by: Leo Yan <leo.yan@linaro.org>

I just now found if apply this patch onto coresight next branch [1],
it will conflict with patch 'coresight: cpu-debug: Support for CA73
CPUs' [2].  Sorry if introduce regression by this.

Hi Mathieu, could you confirm should apply this patch onto to coresight
next branch?

[...]

Thanks,
Leo Yan

[1] https://git.linaro.org/kernel/coresight.git/log/?h=next
[2] https://git.linaro.org/kernel/coresight.git/commit/?h=next&id=14420b405d03cd160b5ace283693ce5b1cf273fa
