From: Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org>
Subject: Re: [PATCH RFC RFT 0/2] ARM: Kirkwood: Synology DT files
Date: Thu, 09 Jan 2014 15:18:35 +1000
Message-ID: <52CE312B.3060108@killerwolves.net>
References: <1389052027-16819-1-git-send-email-andrew@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1389052027-16819-1-git-send-email-andrew-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/01/14 09:47, Andrew Lunn wrote:
> Request for Testing:
> 
> This patch adds support for around 30 different boards. Most .dts
> files support a couple of different models. I don't have any of this
> hardware. None of this is tested.

Tested by Ben Peddell <klightspeed-aslSrjg9ejhWX4hkXwHRhw@public.gmane.org> (specifically kirkwood-ds210.dts on DS211j)

To get running on the stock bootloader, I needed to extend the 
initramfs to fill the entire rd.gz flash partition, configure the 
kernel to use the dtb appended to it, configure it to ignore the 
information passed to it by the bootloader, and add the following 
nodes to the dts:

/chosen {
	linux,initrd-start = <0x800040>;
	linux,initrd-end   = <0x940000>;
};

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
