From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v2 3/4] ARM: davinci: disable mdio and eth0 in da850.dtsi
Date: Mon, 25 Apr 2016 19:00:59 +0530
Message-ID: <571E1C13.9050204@ti.com>
References: <1460826020-1256-1-git-send-email-david@lechnology.com>
 <1460826020-1256-4-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460826020-1256-4-git-send-email-david@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kevin Hilman <khilman@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi David,

On Saturday 16 April 2016 10:30 PM, David Lechner wrote:
> All other devices are disabled by default and not all boards will use
> these devices, so these should be disabled too..
> 
> da850-evm.dtb already had status = "okay" for these devices.
> da850-enbw-cmc.dts did not, so they were added.
> 
> Signed-off-by: David Lechner <david@lechnology.com>
> Tested-by: Kevin Hilman <khilman@baylibre.com>

I applied this and other patches in this series. One nit-pick though.
The commit description should be independently readable and not only as
continuation of the headline. Even if this means repeating portion of
the headline. I fixed this for most of the patches in this series. For
example, for this patch, I have:

    ARM: dts: da850: disable mdio and eth0 in da850.dtsi

    Disable mdio and eth0 in da850.dtsi file. All other
    devices are disabled by default and not all boards
    will use these devices, so these should be disabled too.

    da850-evm.dtb already had status = "okay" for these devices.
    da850-enbw-cmc.dts did not, so they were added.

    Signed-off-by: David Lechner <david@lechnology.com>
    Tested-by: Kevin Hilman <khilman@baylibre.com>
    [nsekhar@ti.com: commit description updates]
    Signed-off-by: Sekhar Nori <nsekhar@ti.com>

Its a minor change and I wont reply to all the patches with the changes
I made. But I pushed the updated v4.7/dt branch in my tree. Do take a
look at the commit description there.

Thanks,
Sekhar
