From: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Subject: Reading MAC addresses with NVMEM under MTD partition [Was: Re:
 [PATCH v3 1/3] nvmem: Update the OF binding to use a subnode for the cells
 list]
Date: Thu, 18 Apr 2019 15:36:46 +0200
Message-ID: <20190418133646.GA94236@meh.true.cz>
References: <1521933899-362-1-git-send-email-albeu@free.fr>
Reply-To: Petr =?utf-8?Q?=C5=A0tetiar?= <ynezz@true.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1521933899-362-1-git-send-email-albeu@free.fr>
Sender: netdev-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Alban Bedel <albeu@free.fr>, Maxime Ripard <maxime.ripard@bootlin.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-mtd@lists.infradead.org, netdev@vger.kernel.org, Boris Brezillon <boris.brezillon@bootlin.com>, John Crispin <john@phrozen.org>
List-Id: devicetree@vger.kernel.org

Hi,

I'm wondering what is the status of this patch? I'm currently trying to do
following with modified of_get_mac_address[1] which uses nvmem_get_mac_address
under the hood:

flash@0 {
	partitions {
		compatible = "fixed-partitions";

		art: partition@fe0000 {
			label = "art";
			reg = <0xff0000 0x010000>;
			read-only;

			eth0_addr: ethernet-address@0 {
				reg = <0x0 0x6>;
			};

			eth1_addr: ethernet-address@6 {
				reg = <0x6 0x6>;
			};

			wmac_addr: ethernet-address@1002 {
				reg = <0x1002 0x6>;
			};
	};
};

&eth0 {
        nvmem-cells = <&eth0_addr>;
        nvmem-cell-names = "mac-address";
};

&eth1 {
        nvmem-cells = <&eth1_addr>;
        nvmem-cell-names = "mac-address";
};

&wmac {
        nvmem-cells = <&wmac_addr>;
        nvmem-cell-names = "mac-address";
};

It seems to me, that this use case is not supported yet, but it could be
probably handled with this proposed patch or something similar. What could be
done in order to move forward? Thanks!

1. https://github.com/ynezz/linux/commit/919e9a943af4cdf9b78b0ead17e9855be90d9466

-- ynezz
