From: Anson Huang <anson.huang@nxp.com>
Subject: RE: [PATCH V4 1/2] soc: imx: Add SCU SoC info driver support
Date: Tue, 21 May 2019 14:42:58 +0000
Message-ID: <DB3PR0402MB3916EED0DD292956887E839DF5070@DB3PR0402MB3916.eurprd04.prod.outlook.com>
References: <1558071840-841-1-git-send-email-Anson.Huang@nxp.com>
 <AM0PR04MB6434643CA1A6807347DCAAF8EE070@AM0PR04MB6434.eurprd04.prod.outlook.com>
 <61fb2d82-67e7-ab2d-961e-78d018cf3272@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <61fb2d82-67e7-ab2d-961e-78d018cf3272@free.fr>
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
To: Marc Gonzalez <marc.w.gonzalez@free.fr>, Leonard Crestez <leonard.crestez@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, DT <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi, Marc/Leonard

> -----Original Message-----
> From: Marc Gonzalez [mailto:marc.w.gonzalez@free.fr]
> Sent: Tuesday, May 21, 2019 8:34 PM
> To: Leonard Crestez <leonard.crestez@nxp.com>; Anson Huang
> <anson.huang@nxp.com>
> Cc: Mark Rutland <mark.rutland@arm.com>; Rob Herring
> <robh+dt@kernel.org>; Linux ARM <linux-arm-kernel@lists.infradead.org>;
> DT <devicetree@vger.kernel.org>
> Subject: Re: [PATCH V4 1/2] soc: imx: Add SCU SoC info driver support
> 
> On 21/05/2019 13:56, Leonard Crestez wrote:
> 
> > On 5/17/2019 8:49 AM, Anson Huang wrote:
> >
> >> +	root = of_find_node_by_path("/");
> >> +
> >> +	np = of_find_compatible_node(NULL, NULL, "fsl,imx-scu");
> >
> > It's possibly not very important for root or FW communication nodes
> > but you should probably of_node_put those back.
> 
> Isn't it better/simpler to use of_root?
> 
> extern struct device_node *of_root;

You are right, I will add below changes into V5, one change is to use extern of_root
directly, the other is to add of_put_node() after "fsl,imx-scu" is found.

@@ -56,7 +56,6 @@ static int imx_scu_soc_probe(struct platform_device *pdev)
 {
        struct soc_device_attribute *soc_dev_attr;
        struct soc_device *soc_dev;
-       struct device_node *root;
        u32 id, val;
        int ret;

@@ -72,8 +71,7 @@ static int imx_scu_soc_probe(struct platform_device *pdev)

        soc_dev_attr->family = "Freescale i.MX";

-       root = of_find_node_by_path("/");
-       ret = of_property_read_string(root,
+       ret = of_property_read_string(of_root,
                                      "model",
                                      &soc_dev_attr->machine);
        if (ret)
@@ -132,6 +130,8 @@ static int __init imx_scu_soc_init(void)
        if (!np)
                return -ENODEV;

+       of_node_put(np);
+
        ret = platform_driver_register(&imx_scu_soc_driver);
        if (ret)
                return ret;

thanks,
Anson

> 
> Regards.
