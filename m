From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH] of: Have of_device_add call platform_device_add rather
 than device_add
Date: Thu, 22 Nov 2012 10:30:20 -0700
Message-ID: <20121122173020.GA8473@obsidianresearch.com>
References: <20121121072448.GG19837@obsidianresearch.com>
 <20121121155104.726B83E0AE2@localhost>
 <20121121174453.GD6406@obsidianresearch.com>
 <CACxGe6u2Kfm+x5KsFzNPt7voyeD0x_4V6EO4add=tBwMKJ6VWQ@mail.gmail.com>
 <20121121181430.GE6406@obsidianresearch.com>
 <20121122153621.452CA3E129E@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20121122153621.452CA3E129E@localhost>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Nov 22, 2012 at 03:36:21PM +0000, Grant Likely wrote:

> Hmm... I've not tried it with assigned-address. I tried with two sibling
> platform devices using just the 'reg' property. That the kernel will
> complain about. For powerpc-only, the patch I posted allows the device
> to get registered anyway even though the range incorrectly overlaps.

My second example was done with the reg property..

                gpio0: gpio@10100 {
                        compatible = "marvell,orion-gpio";
                        #gpio-cells = <2>;
                        gpio-controller;
                        reg = <0x10100 0x40>;
                }
                chip_cfg@0 {
                        compatible = "orc,chip_config";
                        // Doubles up on gpio0
                        reg = <0x10100 0x4>;
                };


f1010100-f101013f : /internal@f1000000/gpio@10100
  f1010100-f1010103 : /internal@f1000000/chip_cfg@0

What did you try? Maybe order matters?

Regards,
Jason
