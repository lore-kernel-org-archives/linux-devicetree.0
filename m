From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2 1/4] dt-bindings: opp: Support multiple opp-suspend
 properties
Date: Wed, 24 Jul 2019 14:18:58 -0600
Message-ID: <20190724201858.GA25048@bogus>
References: <20190709080015.43442-1-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190709080015.43442-1-Anson.Huang@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anson.Huang@nxp.com
Cc: nm@ti.com, mark.rutland@arm.com, ping.bai@nxp.com, ccaione@baylibre.com, agx@sigxcpu.org, angus@akkea.ca, leonard.crestez@nxp.com, festevam@gmail.com, abel.vesa@nxp.com, andrew.smirnov@gmail.com, vireshk@kernel.org, Linux-imx@nxp.com, devicetree@vger.kernel.org, kernel@pengutronix.de, linux-pm@vger.kernel.org, s.hauer@pengutronix.de, robh+dt@kernel.org, daniel.baluta@nxp.com, linux-arm-kernel@lists.infradead.org, sboyd@kernel.org, linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, shawnguo@kernel.org, l.stach@pengutronix.de
List-Id: devicetree@vger.kernel.org

On Tue,  9 Jul 2019 16:00:12 +0800, Anson.Huang@nxp.com wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
> 
> Update opp-suspend property's description to support multiple
> opp-suspend properties defined in DT, the OPP with highest opp-hz
> and with opp-suspend property present will be used as suspend opp.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> New patch.
> ---
>  Documentation/devicetree/bindings/opp/opp.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
