From: Julia Lawall <julia.lawall@lip6.fr>
Subject: question about drivers/pinctrl/pinctrl-at91.c
Date: Sat, 8 Dec 2012 16:52:42 +0100 (CET)
Message-ID: <alpine.DEB.2.02.1212081643590.1984@hadrien>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: plagnioj@jcrosoft.com, linus.walleij@linaro.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

The function at91_dt_node_to_map in drivers/pinctrl/pinctrl-at91.c 
contains the following code:

        new_map = devm_kzalloc(pctldev->dev, sizeof(*new_map) * map_num, GFP_KERNEL);
         if (!new_map)
                 return -ENOMEM;

         *map = new_map;
         *num_maps = map_num;

         /* create mux map */
         parent = of_get_parent(np);
         if (!parent) {
                 kfree(new_map);
                 return -EINVAL;
         }

This is clearly not correct, because the combination of devm_kzalloc and 
kfree risks creating a double free.  But I am not sure how best to fix it. 
Is the data structure intended to normally exist until the driver's remove 
function is called?  If so, perhaps the devm_kzalloc is OK.  If I just 
remove the kfree, then the structure will persist until the remove 
function is called, even though there was an error, which is perhaps not 
good.  So I could change the kfree to devm_kfree?

thanks,
julia
