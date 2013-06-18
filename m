From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 00/12] MBus device tree binding
Date: Tue, 18 Jun 2013 13:33:37 +0200
Message-ID: <51C04591.3010206@gmail.com>
References: <1371554737-25319-1-git-send-email-ezequiel.garcia@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1371554737-25319-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
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
To: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Maen Suleiman <maen-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/18/13 13:25, Ezequiel Garcia wrote:
> In the example below there's an extract of a device tree showing how
> the internal-regs and pcie nodes can be represented:
>
> 	#define MBUS_ID(target,attributes) (((target) << 24) | ((attributes) << 16))
>
> 	soc {
> 		compatible = "marvell,armadaxp-mbus";
> 		reg = <0 0xd0020000 0 0x100>, <0 0xd0020180 0 0x20>;
>
> 		ranges = <0xffff0001 0 0 0xd0000000 0x100000   /* internal-regs */
> 			  0xffff0000 0 0 0xe0000000 0x8100000  /* pcie */
> 			  MBUS_ID(0x01, 0x1d) 0 0 0xfff00000 0x100000
> 			  MBUS_ID(0x01, 0x2f) 0 0 0xf0000000 0x8000000>;

Ezequiel,

you should update PCIE above (and possibly anywhere else) too.

> 		pcie-controller {
> 			compatible = "marvell,armada-xp-pcie";
> 			status = "okay";
> 			device_type = "pci";
>
> 			#address-cells = <3>;
> 			#size-cells = <2>;
>
> 			ranges =
> 			       <0x82000000 0 0x40000 0xffff0001 0x40000 0 0x00002000   /* Port 0.0 registers */
> 				0x82000000 0 0x42000 0xffff0001 0x42000 0 0x00002000   /* Port 2.0 registers */
> 				0x82000000 0 0x44000 0xffff0001 0x44000 0 0x00002000   /* Port 0.1 registers */
> 				0x82000000 0 0x48000 0xffff0001 0x48000 0 0x00002000   /* Port 0.2 registers */
> 				0x82000000 0 0x4c000 0xffff0001 0x4c000 0 0x00002000   /* Port 0.3 registers */
> 				0x82000000 0 0x80000 0xffff0001 0x80000 0 0x00002000   /* Port 1.0 registers */
> 				0x82000000 0 0x82000 0xffff0001 0x82000 0 0x00002000   /* Port 3.0 registers */
> 				0x82000000 0 0xe0000000 0xffff0000 0 0 0x08000000   /* non-prefetchable memory */
> 				0x81000000 0 0 0xffff0000 0x8000000 0 0x00100000>; /* downstream I/O */

Here for example.

> Changes from v2:
>   * Replaced the PCIe mapping with 0xffff0002, to avoid using a representation
>     that might correspond to a possible window id.

Out of curiosity, how will these fake mappings play with LPAE? If you
extend possible address space to >32b the lower bits may belong to valid
addresses.
Maybe you can (already do?) ignore that because of the 32b address
restriction for internal registers IIRC Thomas mentioned?

Sebastian
