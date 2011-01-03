From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [RFC] MPIC Bindings and Bindings for AMP Systems
Date: Mon, 3 Jan 2011 14:22:00 -0600
Message-ID: <20110103142200.738c0b17@udp111988uds.am.freescale.net>
References: <4D12E4F1.2030004@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4D12E4F1.2030004-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Meador Inge <meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, "Blanchard, Hollis" <Hollis_Blanchard-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 22 Dec 2010 23:58:09 -0600
Meador Inge <meador_inge-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org> wrote:

> NOTE: The 'interrupt-parent' is implicit since message register nodes
>         are always children of interrupt controller nodes.
> 
> ** Example:
> 
> 	mpic: pic@40000 {
> 		interrupt-controller;
> 		#address-cells = <0>;
> 		#interrupt-cells = <2>;
> 		reg = <0x40000 0x40000>;
> 		compatible = "chrp,open-pic";
> 		device_type = "open-pic";
> 		protected-sources = <0xb1>;
> 
> 		msgr@1400 {
> 			compatible = "fsl,p2020-msgr", "fsl,mpic-msgr";
> 			reg = <0x1400 0x200>;
> 			cell-index = <0>;
> 			interrupts = <0xb0 0x2 0xb1 0x2
>                                        0xb2 0x2 0xb3 0x2>;
> 		};
> 
> 		msgr@2400 {
> 			compatible = "fsl,p2020-msgr", "fsl,mpic-msgr";
> 			reg = <0x2400 0x200>;
> 			cell-index = <1>;
> 			interrupts = <0xb4 0x2 0xb5 0x2
>                                        0xb6 0x2 0xb7 0x2>;
> 	         };	
> 	};

These nodes cannot go under the mpic node, because interrupt
controllers need #address-cells = <0>.

It would be nice if the binding provided some way of partitioning
up individual message interrupts within a block.

Interrupt generation could be exported as a "service", similar to
(inbound) interrupts and gpios.

Perhaps a something like this, with "doorbell" being a new standard
hw-independent service with its own binding:

msg1: mpic-msg@1400 {
	compatible = "fsl,mpic-v3.0-msg";
	reg = <0x1400 0x200>;
	interrupts <176 2 178 2>;

	// We have message registers 0 and 2 for sending,
	// and 1 and 3 for receiving.
	// If absent, we own all message registers in this block.
	fsl,mpic-msg-send-mask = <0x5>;
	fsl,mpic-msg-receive-mask = <0xa>;

	doorbell-controller;

	// split into #doorbell-send-cells and #doorbell-receive-cells?
	#doorbell-cells = <1>;
};

some-amp-protocol-thingy {
	send-doorbells = <&msg1 0>; // generate messages on MSGR0
	receive-doorbells = <&msg1 0>; // receive messages on MSGR1
};

some-other-amp-protocol-thingy {
	send-doorbells = <&msg1 1>; // generate messages on MSGR2
	receive-doorbells = <&msg1 1>; // receive messages on MSGR3
};

Doorbell capabilities such as passing a 32-bit message can be negotiated
between the drivers for the doorbell controller and the doorbell client.

-Scott
