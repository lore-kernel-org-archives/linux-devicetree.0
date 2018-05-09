From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] arm64: dts: juno: fix OF graph endpoint node names
Date: Wed, 9 May 2018 17:34:30 +0100
Message-ID: <e4775e42-fb07-c51c-2698-0bfe6e7b9417@arm.com>
References: <20180508150952.24562-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180508150952.24562-1-robh@kernel.org>
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
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org



On 08/05/18 16:09, Rob Herring wrote:
> OF graph endpoint node names should be 'endpoint'. Fix the following
> warnings found by dtc:
> 
> Warning (graph_endpoint): /hdlcd@7ff50000/port/hdlcd1-endpoint: graph endpont node nameshould be 'endpoint'
> Warning (graph_endpoint): /hdlcd@7ff60000/port/hdlcd0-endpoint: graph endpont node nameshould be 'endpoint'
> Warning (graph_endpoint): /i2c@7ffa0000/hdmi-transmitter@70/port/tda998x-0-endpoint: graph endpont node name should be 'endpoint'
> Warning (graph_endpoint): /i2c@7ffa0000/hdmi-transmitter@71/port/tda998x-1-endpoint: graph endpont node name should be 'endpoint'
> 
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Signed-off-by: Rob Herring <robh@kernel.org>

Thanks Robs, both patches applied.

-- 
Regards,
Sudeep
