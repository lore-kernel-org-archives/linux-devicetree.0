From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 06/15] arm: dts: sun: Add missing cooling device
 properties for CPUs
Date: Mon, 28 May 2018 16:27:34 +0530
Message-ID: <20180528105734.bkplm7tfaqsurdrn@vireshk-i7>
References: <cover.1527244200.git.viresh.kumar@linaro.org>
 <eded393f4b508a1f377f9af6859a3b82a6787e1c.1527244201.git.viresh.kumar@linaro.org>
 <20180528084446.g24fphqqac2hi3rr@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180528084446.g24fphqqac2hi3rr@flea>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, arm@kernel.org, chris.redpath@arm.com, ionela.voinescu@arm.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 28-05-18, 10:44, Maxime Ripard wrote:
> Hi,
> 
> On Fri, May 25, 2018 at 04:01:52PM +0530, Viresh Kumar wrote:
> > The cooling device properties, like "#cooling-cells" and
> > "dynamic-power-coefficient", should either be present for all the CPUs
> > of a cluster or none. If these are present only for a subset of CPUs of
> > a cluster then things will start falling apart as soon as the CPUs are
> > brought online in a different order. For example, this will happen
> > because the operating system looks for such properties in the CPU node
> > it is trying to bring up, so that it can register a cooling device.
> > 
> > Add such missing properties.
> > 
> > Fix other missing properties (clocks, OPP, clock latency) as well to
> > make it all work.
> > 
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
> The prefix should be sunxi and not sun, but it looks good to me
> otherwise.
> 
> Let me know what your preferred merge method is.

Please pick it up directly and send it as part of your pull request.
Do you want me to resend or can you fix the $subject ?

Thanks.

-- 
viresh
