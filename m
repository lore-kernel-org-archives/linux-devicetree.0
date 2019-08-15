From: Hans de Goede <hdegoede@redhat.com>
Subject: for_each_child_of_node semantics are broken (was [PATCH] ata:
 libahci_platform: Add of_node_put() before loop exit)
Date: Thu, 15 Aug 2019 10:53:06 +0200
Message-ID: <a469ccae-0b34-8a8f-376c-7cd176fd05bf@redhat.com>
References: <20190815060014.2191-1-nishkadg.linux@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190815060014.2191-1-nishkadg.linux@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Nishka Dasgupta <nishkadg.linux@gmail.com>, axboe@kernel.dk, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Nishka,

On 15-08-19 08:00, Nishka Dasgupta wrote:
> Each iteration of for_each_child_of_node puts the previous node, but
> in the case of a goto from the middle of the loop, there is no put,
> thus causing a memory leak. Add an of_node_put before three such goto
> statements.
> Issue found with Coccinelle.
> 
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>

Thank you for your patch.

I do not like doing an of_node_put for something which we did not
explicitly of_node_get. So I was thinking about maybe replacing the
goto-s with a break.

But even if we put a break in the for_each_child_of_node loop,
we still leak the reference. Which IMHO means that the semantics of
the for_each_child_of_node helper are broken, this certainly violates
the principle of least surprise which one would expect of a good API.

I see that there are quite a few callers of this function:

[hans@shalem linux]$ ack -l for_each_child_of_node drivers | wc -l
194

And doing a manual check of these (with the intend to stop after
a couple) I already find something suspicious in the second file
ack -l returns:

         for_each_child_of_node(parent, dn) {
                 pnv_php_detach_device_nodes(dn);

                 of_node_put(dn);
                 refcount = kref_read(&dn->kobj.kref);
                 if (refcount != 1)
                         pr_warn("Invalid refcount %d on <%pOF>\n",
                                 refcount, dn);

                 of_detach_node(dn);
         }

note this does an of_node_put itself and then continues iterating,
now this function looks pretty magical to me, so it might be fine...

4th file inspected, same issue with error returns as the libahci_platform
code, see drivers/pci/controller/pci-tegra.c: tegra_pcie_parse_dt
also should that function not do a a get on the node since it stores
it in rp->np if things do succeed ?

5th file: drivers/char/rtc.c:

         for_each_node_by_name(ebus_dp, "ebus") {
                 struct device_node *dp;
                 for_each_child_of_node(ebus_dp, dp) {
                         if (of_node_name_eq(dp, "rtc")) {
                                 op = of_find_device_by_node(dp);
                                 if (op) {
                                         rtc_port = op->resource[0].start;
                                         rtc_irq = op->irqs[0];
                                         goto found;
                                 }
                         }
                 }
         }

Also a leak AFAICT.

10th file: drivers/phy/phy-core.c:

                 for_each_child_of_node(phy_provider->children, child)
                         if (child == node)
                                 return phy_provider;

Another leak...

I'm going to stop now because this just aint funny, but I do believe this
nicely illustrates how for_each_child_of_node() is ridiculously hard to use
correct.

Regards,

Hans



> ---
>   drivers/ata/libahci_platform.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/ata/libahci_platform.c b/drivers/ata/libahci_platform.c
> index 9e9583a6bba9..e742780950de 100644
> --- a/drivers/ata/libahci_platform.c
> +++ b/drivers/ata/libahci_platform.c
> @@ -497,6 +497,7 @@ struct ahci_host_priv *ahci_platform_get_resources(struct platform_device *pdev,
>   
>   			if (of_property_read_u32(child, "reg", &port)) {
>   				rc = -EINVAL;
> +				of_node_put(child);
>   				goto err_out;
>   			}
>   
> @@ -514,14 +515,18 @@ struct ahci_host_priv *ahci_platform_get_resources(struct platform_device *pdev,
>   			if (port_dev) {
>   				rc = ahci_platform_get_regulator(hpriv, port,
>   								&port_dev->dev);
> -				if (rc == -EPROBE_DEFER)
> +				if (rc == -EPROBE_DEFER) {
> +					of_node_put(child);
>   					goto err_out;
> +				}
>   			}
>   #endif
>   
>   			rc = ahci_platform_get_phy(hpriv, port, dev, child);
> -			if (rc)
> +			if (rc) {
> +				of_node_put(child);
>   				goto err_out;
> +			}
>   
>   			enabled_ports++;
>   		}
> 
