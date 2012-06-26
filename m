From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: Early printk baudrate initialization DTS description
Date: Tue, 26 Jun 2012 13:16:42 +0200
Message-ID: <4FE99A1A.4040908@monstr.eu>
Reply-To: monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
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
Cc: John Williams <john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

we are trying to solve one problem with early printk initialization
on Microblaze uart16550. I have also checked arm bootup code and
the situation is the same there (NOTE: This IP is possible to use on Zynq too).

The problem is about baudrate initialization. Current code just expect
that early console is initialized by previous bootloader/firmware (in our case u-boot).
But if there is not initialization and directly elf is loaded there is no initialization
done and kernel bootlog is shown when regular serial driver is probed.

I have create a solution which add baudrate initialization to Microblaze early printk code.
And also two options how to load baudrate setting from device-tree.

Code expects that early console is specified in chosen node.

chosen {
	linux,stdout-path = "/axi@0/serial@40400000";
} ;

Code finds out which IP it is and based on that initialize early printk driver.
Baudrate setting is counted from clock-frequency and current-speed defined directly in uart node.

RS232_Uart_1: serial@40400000 {
	clock-frequency = <50000000>;
	compatible = "xlnx,axi-uart16550-1.01.a", "xlnx,xps-uart16550-2.00.a", "ns16550a";
	current-speed = <115200>;
	device_type = "serial";
	reg = < 0x40400000 0x10000 >;
	reg-offset = <0x1000>;
	reg-shift = <2>;
	...irq, etc
} ;

This was the first version which is working but using current-speed is probably not the best solution.

I have also create version where baudrate is directly specified in chosen node. Clock frequency is still
loaded directly from the node.

chosen {
	linux,stdout-path = "/axi@0/serial@40400000,115200";
} ;

What solution is more compatible with device-tree?


Thanks for you comments,
Michal


-- 
Michal Simek, Ing. (M.Eng)
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel 2.6 Microblaze Linux - http://www.monstr.eu/fdt/
Microblaze U-BOOT custodian
