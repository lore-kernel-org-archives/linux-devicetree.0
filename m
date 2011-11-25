From: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: RFC of_boardconfig
Date: Fri, 25 Nov 2011 14:52:40 +0100
Message-ID: <4ECF9DA8.8000504@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi All,

before starting to implement the following proposed wrappers, i wanted
to get some more views on the feasibility of these wrappers.

On most routers that OpenWRT supports, we will find a sector within a
MTD device that holds the board specific info like MAC, wifi calibration
data ...

These wrappers try to provide a generic representation of these board
configuration sectors.

Thank you,
John



Documentation/devicetree/bindings/boardconfig.txt -->

The boardconfig master node requires the following properties:
- compatible    - should be set to "boardconfig"
- partition     - the partition that the data is stored in
                        "<&partition offset size>"

boardconfig slave nodes require the following properties:
- label         - the name that the config element gets exported by
- data          - information describing the actual data
                        "<offset size validator>"

both node types allow to set the following optional properties
- magic         - check for magic sequence at correct offset
                        <offset byte1 byte2 ... byteN>
- no-export     - if this property is set the data will *not* be
		  exported via sysfs

It is possible to define N of these sections within the device tree.

Boardconfig example for a device with 2 macs and a wmac eeprom:
        eep: boardconfig {
                compatible = "boarconfig";
                partition = <&boardconfpart 0x0 0x100>;
                magic = <0x0 0x11 0x22>;
                lanmac {
                        label = "LAN";
                        data = <0x100 0x6>;
                };

                wanmac {
                        label = "WAN";
                        data = <0x106 0x6>;
                };

                ath9keeprom {
                        label = "eeprom";
                        partition = <0x200 0x200>;
                        magic = <0x0 0x55 0xaa 0xaa 0x55>;
                        no-export;
                };
        };

you can are then able to reference these properties from other nodes:
        ethernet {
                compatible = "ethernet";
                phy-mode = "mii";
                //mac-address = [ 00 11 22 33 44 55 ];
                mac-boardconf = <&eep lanmac>;
        };
