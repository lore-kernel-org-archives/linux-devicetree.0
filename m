From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH 1/3] of: base: add support to get machine compatible
 string
Date: Tue, 22 Nov 2016 20:36:26 +0530
Message-ID: <67a3c2c7-0cb9-9764-2710-6ee66fc4dde4@ti.com>
References: <1479811311-3080-1-git-send-email-bgolaszewski@baylibre.com>
 <1479811311-3080-2-git-send-email-bgolaszewski@baylibre.com>
 <5ce9fb9f-459a-562b-2e9f-85d35f9ec035@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5ce9fb9f-459a-562b-2e9f-85d35f9ec035@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sudeep Holla <sudeep.holla@arm.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Russell King <linux@armlinux.org.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, arm-soc <linux-arm-kernel@lists.infradead.org>, linux-drm <dri-devel@lists.freedesktop.org>, linux-devicetree <devicetree@vger.kernel.org>, Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, David Airlie <airlied@linux.ie>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Robin Murphy <robin.murphy@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Sudeep,

On Tuesday 22 November 2016 04:23 PM, Sudeep Holla wrote:
> 
> 
> On 22/11/16 10:41, Bartosz Golaszewski wrote:
>> Add a function allowing to retrieve the compatible string of the root
>> node of the device tree.
>>
> 
> Rob has queued [1] and it's in -next today. You can reuse that if you
> are planning to target this for v4.11 or just use open coding in your
> driver for v4.10 and target this move for v4.11 to avoid cross tree
> dependencies as I already mentioned in your previous thread.

I dont have your original patch in my mailbox, but I wonder if 
returning a pointer to property string for a node whose reference has 
already been released is safe to do? Probably not an issue for the root 
node, but still feels counter-intuitive.

This is the code for reference:

+int of_machine_get_model_name(const char **model)
+{
+       int error;
+
+       if (!of_node_get(of_root))
+               return -EINVAL;
+
+       error = of_property_read_string(of_root, "model", model);
+       if (error)
+               error = of_property_read_string_index(of_root, "compatible",
+                                                     0, model);
+       of_node_put(of_root);
+
+       return error;
+}
+EXPORT_SYMBOL(of_machine_get_model_name);

Thanks,
Sekhar
