From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH v3] ARM: dts: BCM5301X: Add support for Linksys EA9500
Date: Tue, 26 Jun 2018 13:30:11 -0700
Message-ID: <32c1b4db-acb8-35ae-eab9-f4e85a204e09@gmail.com>
References: <20180222223844.98527-1-npcomplete13@gmail.com>
 <20180618174159.86150-1-npcomplete13@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180618174159.86150-1-npcomplete13@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vivek Unune <npcomplete13@gmail.com>, hauke@hauke-m.de, zajec5@gmail.com, jonmason@broadcom.com, bcm-kernel-feedback-list@broadcom.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/18/2018 10:41 AM, Vivek Unune wrote:
> Hardware Info
> -------------
> 
> Processor	- Broadcom BCM4709C0KFEBG dual-core @ 1.4 GHz
> Switch		- BCM53012 in BCM4709C0KFEBG & external BCM53125
> DDR3 RAM	- 256 MB
> Flash		- 128 MB (Toshiba TC58BVG0S3HTA00)
> 2.4GHz		- BCM4366 4×4 2.4/5G single chip 802.11ac SoC
> Power Amp	- Skyworks SE2623L 2.4 GHz power amp (x4)
> 5GHz x 2	- BCM4366 4×4 2.4/5G single chip 802.11ac SoC
> Power Amp	- PLX Technology PEX8603 3-lane, 3-port PCIe switch
> Ports		- 8 Ports, 1 WAN Ports
> Antennas	- 8 Antennas
> Serial Port	- @J6 [GND,TX,RX] (VCC NC)    115200 8n1
> 
> Tested with OpenWrt built with DSA driver and Kernel v4.14
> 
> Signed-off-by: Vivek Unune <npcomplete13@gmail.com>

Applied to devicetree/next, thanks Vivek.
-- 
Florian
