From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 3/3] arm: dts: bcm5301x: Add syscon based reboot in DT
Date: Fri, 18 Dec 2015 22:44:28 +0100
Message-ID: <2180042.V6T2Tnxp6B@wuerfel>
References: <1450474676-10210-1-git-send-email-jonmason@broadcom.com> <1450474676-10210-3-git-send-email-jonmason@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450474676-10210-3-git-send-email-jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 18 December 2015 16:37:56 Jon Mason wrote:
> +       cru: cru@1800c184 {
> +               compatible = "syscon";
> +               reg = <0x1800c184 0xc>;
> +       };

It's unusual for a device to start at such an odd address. Are you sure
it's not a larger device starting at 0x1800c000 or 0x18000000?

Also, please provide a more specific compatible string based on the
name of the device in the data sheet. The node name in contrast should
be more generic, e.g.

	cru: system-controller@1800c000 {
		compatible = "brcm,bcm53010-cru", "syscon";
		reg = <0x1800c000 0x400>; /* whatever the data sheet says */
	};


	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
