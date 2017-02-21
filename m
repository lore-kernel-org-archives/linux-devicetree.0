From: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH v2 2/2] fpga manager: Add Xilinx slave serial SPI driver
Date: Tue, 21 Feb 2017 16:17:23 +0100
Message-ID: <20170221161723.358975f7@crub>
References: <1487600724-17607-1-git-send-email-agust@denx.de>
        <1487600724-17607-3-git-send-email-agust@denx.de>
        <2d412ae7-4163-9943-6d98-2d6387df7789@xilinx.com>
        <20170221152444.34b5d9f4@crub>
        <19e0b5d1-bbf6-25ac-2698-6074ebafcf05@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <19e0b5d1-bbf6-25ac-2698-6074ebafcf05-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, 21 Feb 2017 15:51:18 +0100
Michal Simek michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org wrote:
...
>>> What's the hw configuration?  
>> 
>> I used Spartan-6 for testing. But the driver might work with other
>> Xilinx FPGAs, so I didn't add exact hw description.  
>
>ok. I expect this is spartan-6 next to another SoC and you use spi for
>that another SoC and you connect.

yes, it is MVEBU SoC, I'm using orion_spi driver. The connection is
unidirectional SPI.

>I think it will be good to extend that example and add also spi device
>node to see where this should be placed.

You mean the example in the binding description? I can add there
something like:

Usage example for full FPGA configuration:

fpga-region0 {
	compatible = "fpga-region";
	fpga-mgr = <&fpga_mgr_spi>;
	#address-cells = <0x1>;
	#size-cells = <0x1>;
};

&spi1 {
	status = "okay";

	fpga_mgr_spi: fpga-mgr@0 {
		compatible = "xlnx,fpga-slave-serial";
		reg = <0>;
		spi-max-frequency = <60000000>;
		spi-cpha;
		done-gpios = <&gpio0 7 GPIO_ACTIVE_HIGH>;
		prog_b-gpios = <&gpio0 26 GPIO_ACTIVE_LOW>;
	};
}; 

Thanks,
Anatolij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
