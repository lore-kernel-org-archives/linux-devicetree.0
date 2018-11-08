From: Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH 1/3] ARM: dts: imx31: Fix memory node duplicaton
Date: Thu, 8 Nov 2018 12:34:03 +0200
Message-ID: <d73ce8ce-64a0-14e9-74f5-12fde63df1cc@mleia.com>
References: <1541518847-5640-1-git-send-email-festevam@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1541518847-5640-1-git-send-email-festevam@gmail.com>
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
To: Fabio Estevam <festevam@gmail.com>, shawnguo@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, robh@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Fabio,

On 11/06/2018 05:40 PM, Fabio Estevam wrote:
> Boards based on imx31 have duplicate memory nodes:
> 
> - One coming from the board dts file: memory@
> 
> - One coming from the imx31.dtsi file.
> 
> Fix the duplication by removing the memory node from the dtsi file
> and by adding 'device_type = "memory";' in the board dts.
> 
> Reported-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

thank you for the change, I've successfully tested it on my i.MX31 Lite board.

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
Tested-by: Vladimir Zapolskiy <vz@mleia.com>

--
Best wishes,
Vladimir
