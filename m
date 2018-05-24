From: "Ivan T. Ivanov" <iivanov.xz@gmail.com>
Subject: Re: [PATCH] arm64: dts: msm8916: fix Coresight ETF graph connections
Date: Thu, 24 May 2018 07:48:53 +0300
Message-ID: <20180524044853.713.23166@silver>
References: <20180508150952.24562-1-robh@kernel.org>
 <20180508150952.24562-3-robh@kernel.org>
 <CAL_JsqL8qBiJUMyUEcih07UoFSAghn6Amfo8OfY-pKU-QX2_mw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAL_JsqL8qBiJUMyUEcih07UoFSAghn6Amfo8OfY-pKU-QX2_mw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Andy Gross <andy.gross@linaro.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc: David Brown <david.brown@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, "Ivan T . Ivanov" <ivan.ivanov@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Quoting Rob Herring (2018-05-23 23:29:29)
> On Tue, May 8, 2018 at 10:09 AM, Rob Herring <robh@kernel.org> wrote:
> > The ETF input should be connected to the funnel output, and the ETF
> > output should be connected to the replicator input. The labels are wrong
> > and these got swapped:
> >
> > Warning (graph_endpoint): /soc/funnel@821000/ports/port@8/endpoint: graph connection to node '/soc/etf@825000/ports/port@1/endpoint' is not bidirectional
> > Warning (graph_endpoint): /soc/replicator@824000/ports/port@2/endpoint: graph connection to node '/soc/etf@825000/ports/port@0/endpoint' is not bidirectional
> >
> > Fixes: 7c10da373698 ("arm64: dts: qcom: Add msm8916 CoreSight components")
> > Cc: Ivan T. Ivanov <ivan.ivanov@linaro.org>
> > Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Cc: Andy Gross <andy.gross@linaro.org>
> > Cc: David Brown <david.brown@linaro.org>
> > Cc: linux-arm-msm@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  arch/arm64/boot/dts/qcom/msm8916.dtsi | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Ping. Still seeing warnings in -next for these.
>

 Hi Rob,

 I no longer have access to this hardware and documentation.
 I am sure that Mathieu and friends will take care for verification
 of this patch :-)

 Regards,
 Ivan
