From: Alan Tull <atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Subject: dynamic device tree char driver
Date: Thu, 16 Aug 2012 14:43:45 -0500
Message-ID: <1345146226-32675-1-git-send-email-atull@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Hello,

I'm Alan Tull, interested in dynamic features of device trees.

The following patch adds a char driver to add or remove device tree
nodes dynamically.  Its ioctl passes a struct with:
 - size of the blob
 - pointer to the blob

The path to add the nodes under is coded in the blob with dummy nodes.
For example the following can be compiled into a blob and sent to this
driver adding a single node under /soc/apb_periphs:

/dts-v1/;
/ {
        soc {
                apb_periphs {
                        i2c1: i2c@ffc05000 {
                                compatible = "snps,designware-i2c";
                                reg = <0xffc05000 0x1000>;
                                interrupts = <0 159 4>;
                                emptyfifo_hold_master = <1>;
                        };
                };
        };
};

I wanted to get feeback early before I went too far down this particular
path.  As such, this code doesn't do any notification for drivers yet.
Also it won't properly add nested nodes yet.  It can add/remove a single
node and see it show up properly under /proc/device-tree.

Alan Tull
Altera
