From: Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: Re: [PATCH V4 1/2] soc: imx: Add SCU SoC info driver support
Date: Tue, 21 May 2019 14:34:03 +0200
Message-ID: <61fb2d82-67e7-ab2d-961e-78d018cf3272@free.fr>
References: <1558071840-841-1-git-send-email-Anson.Huang@nxp.com>
 <AM0PR04MB6434643CA1A6807347DCAAF8EE070@AM0PR04MB6434.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <AM0PR04MB6434643CA1A6807347DCAAF8EE070@AM0PR04MB6434.eurprd04.prod.outlook.com>
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
To: Leonard Crestez <leonard.crestez@nxp.com>, Anson Huang <anson.huang@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, DT <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 21/05/2019 13:56, Leonard Crestez wrote:

> On 5/17/2019 8:49 AM, Anson Huang wrote:
> 
>> +	root = of_find_node_by_path("/");
>> +
>> +	np = of_find_compatible_node(NULL, NULL, "fsl,imx-scu");
> 
> It's possibly not very important for root or FW communication nodes but 
> you should probably of_node_put those back.

Isn't it better/simpler to use of_root?

extern struct device_node *of_root;

Regards.
