From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH] arm64: dts: juno: fix graph node unit addresses for
 coresight components
Date: Wed, 16 May 2018 12:23:38 +0100
Message-ID: <574f6959-6a84-9e0e-3d89-84d2d75d9191@arm.com>
References: <1526466862-19173-1-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1526466862-19173-1-git-send-email-sudeep.holla@arm.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sudeep Holla <sudeep.holla@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Liviu Dudau <liviu.dudau@arm.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
List-Id: devicetree@vger.kernel.org

On 05/16/2018 11:34 AM, Sudeep Holla wrote:
> Currently the coresight components graph node unit addresses are 
> continuous for both input and output ports while the "reg"
> properties are restarted for input and output ports separately. This
> results is the following DTC warnings:
> 
> (graph_port): /etf@20010000/ports/port@1: graph node unit address
> error, expected "0" (graph_port): /etf@20140000/ports/port@1: graph
> node unit address error, expected "0" (graph_port):
> /funnel@20040000/ports/port@1: graph node unit address error,
> expected "0" (graph_port): /funnel@20040000/ports/port@2: graph node
> unit address error, expected "1" (graph_port):
> /funnel@20040000/ports/port@3: graph node unit address error,
> expected "2" (graph_port): /funnel@20130000/ports/port@1: graph node
> unit address error, expected "0" (graph_port):
> /funnel@20150000/ports/port@1: graph node unit address error,
> expected "0" (graph_port): /funnel@20150000/ports/port@2: graph node
> unit address error, expected "1" (graph_port):
> /funnel@220c0000/ports/port@1: graph node unit address error,
> expected "0" (graph_port): /funnel@220c0000/ports/port@2: graph node
> unit address error, expected "1" (graph_port):
> /funnel@230c0000/ports/port@1: graph node unit address error,
> expected "0" (graph_port): /funnel@230c0000/ports/port@2: graph node
> unit address error, expected "1" (graph_port):
> /funnel@230c0000/ports/port@3: graph node unit address error,
> expected "2" (graph_port): /funnel@230c0000/ports/port@4: graph node
> unit address error, expected "3" (graph_port):
> /replicator@20120000/ports/port@2: graph node unit address error,
> expected "0"
> 
> This patch makes even the reg property to follow the continuous 
> numbering as in the graph node unit address.
> 
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com> Cc: Mathieu Poirier
> <mathieu.poirier@linaro.org> Cc: Liviu Dudau <liviu.dudau@arm.com> 
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>> --- 
> arch/arm64/boot/dts/arm/juno-base.dtsi    | 20 ++++++++++---------- 
> arch/arm64/boot/dts/arm/juno-cs-r1r2.dtsi |  8 ++++---- 
> arch/arm64/boot/dts/arm/juno.dts          |  2 +- 3 files changed, 15
> insertions(+), 15 deletions(-)
> 
> Hi Suzuki/Mathieu,
> 
> I did a quick scan @ drivers/hwtracing/coresight/of_coresight.c to
> check if reg field is being used or not and whether this change
> causes any regression. I don't think so, but I may be wrong, let me
> know.

Unfortunately, I think this would break the components like funnel,
where we need the input port number for the connected master to enable
the port. Similarly for the output port number for master components in
the paths. I have a set of patches which address this by taking care of
the port number order to find out the hardware port number.

I will dust it up and send it. That would bring up another important
question.

How do we deal with the change in the port number scheme ? e.g, should
the new kernel support DTBs with old scheme ? If so, how do we specify
that the DT uses new scheme.

Cheers
Suzuki
