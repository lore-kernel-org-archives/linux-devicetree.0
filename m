From: Lina Iyer <lina.iyer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: How-to: Uniquely identify a DT node in the driver?
Date: Tue, 28 Jul 2015 13:56:41 -0600
Message-ID: <20150728195641.GD51847@linaro.org>
References: <20150728193833.GC51847@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150728193833.GC51847-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 28 2015 at 13:38 -0600, Lina Iyer wrote:
>Hello,
>
>I am looking to find a way to uniquely identify a device in the driver.
>Here is an example -
>
>	big: power-controller@1 {

@1 is probably not a good example here. @1 could as well be a SoC
specific phy address that the driver may not really care about.

>		compatible = "soc,foo";
>		...
>	};
>
>	little: power-controller@2 {
>		compatible = "soc,foo";
>		...
>	};
>
>
>In the driver for the power-controller foo.c, would like to do -
>
>	struct xyz {
>		const char *name;
>		...
>	};
>
>	static struct xyz a = {
>		.name = "big"; // To be associated with big device
>		...
>	};
>
>	static struct xyz b = {
>		.name = "little"; // To be associated with little device
>		...
>	};
>
>What would be the best way to associate the power-controller devices 'big'
>and 'little' with 'a' and 'b' respectively? A string comparison would be
>ideal but possibly can work with other ways.
>
>I could think of adding compatibles to achieve this, but was hoping to
>find something more elegant and appropriate. Or, is compatible the
>recommended way to uniquely identify devices by the driver?
>
>Thanks,
>Lina
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
