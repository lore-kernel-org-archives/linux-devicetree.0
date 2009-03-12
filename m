From: Johns Daniel <johns.daniel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: I2C not working upon 2.6.24 to 2.6.28 kernel upgrade
Date: Thu, 12 Mar 2009 12:37:38 -0500
Message-ID: <ba5d9360903121037m6d5be5e9m4b164d56bd6b5f3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

We have had this device tree (a section shown below) working for a long time:
	soc8343@e0000000 {
		#address-cells = <1>;
		#size-cells = <1>;
		#interrupt-cells = <2>;
		device_type = "soc";
		ranges = <00000000 e0000000 00100000>;
		reg = <e0000000 00000200>;
		bus-frequency = <0>;

		i2c@3000 {
			device_type = "i2c";
			compatible = "fsl-i2c";
			reg = <3000 100>;
			interrupts = <e 8>;
			interrupt-parent = <700>;
			dfsrr;
		};
...
}

With linux-2.6.24, it worked with this struct defined in the
board-specific file:
          static struct of_device_id __initdata of_bus_ids[] = {
          	{ .compatible = "fsl,pq2pro-localbus", },
          	{},
          };

With linux-2.6.28, it needs the following struct in the board-specific
file for I2C to work:
          static struct of_device_id __initdata of_bus_ids[] = {
          	{ .type = "soc", },
          	{ .name = "localbus", },
          	{},
          };

Is this easily explained?

What is the right way to do this now? Ideally, I would like to keep
the device tree unchanged since I need for it to work with older
versions of the kernel!

-- Johns
