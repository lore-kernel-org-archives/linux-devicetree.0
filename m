From: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH 1/2] dt: bindings: fpga: add xilinx slave-serial binding
 description
Date: Thu, 16 Feb 2017 19:51:23 +0100
Message-ID: <20170216195123.5160fe5a@crub>
References: <1487257860-31115-1-git-send-email-agust@denx.de>
        <1487257860-31115-2-git-send-email-agust@denx.de>
        <a2403d1f-cb82-70ce-ecff-45e5901dabc2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a2403d1f-cb82-70ce-ecff-45e5901dabc2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alan Tull <atull-yzvPICuk2ABMcg4IHK0kFoH6Mc4MB0Vx@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Joshua,

On Thu, 16 Feb 2017 09:24:09 -0800
Joshua Clayton stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
...
>> +	fpga_mgr_spi: fpga-spi@0 {
>> +		compatible = "xlnx,fpga-slave-serial";
>> +		spi-max-frequency = <60000000>;
>> +		spi-cpha;
>> +		reg = <0>;
>> +		done-gpio = <&gpio0 9 GPIO_ACTIVE_HIGH>;
>> +		prog_b-gpio = <&gpio0 29 GPIO_ACTIVE_LOW>;
>> +	};  
>nit: you've put prog_b-gpios and done-gpios in the description,
>but the example still has "prog_b-gpio" and "done-gpio"

Thanks for catching that! I copy pasted them from my testing .dts
but now I see that gpio suffix is deprecated for new gpio bindings.
Will fix the example in next patch version.

Thanks,
Anatolij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
