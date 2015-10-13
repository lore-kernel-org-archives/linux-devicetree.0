From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 2/4] soc: ti: add firmware file name as part of the driver
Date: Tue, 13 Oct 2015 16:32:43 +0200
Message-ID: <5984319.ffuyRPpBNk@wuerfel>
References: <1444679211-823-1-git-send-email-m-karicheri2@ti.com> <1444679211-823-3-git-send-email-m-karicheri2@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444679211-823-3-git-send-email-m-karicheri2@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Murali Karicheri <m-karicheri2@ti.com>
Cc: corbet@lwn.net, ssantosh@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Monday 12 October 2015 15:46:49 Murali Karicheri wrote:
> Currently firmware file name is included in the DTS. This is not scalable
> as user has to change the DTS if they need upgrade to a new firmware.
> Instead, add the firmware file name in the driver itself. As long as there
> is no API change, new firmware upgrade is easy and require no driver
> change. User is expected to copy the firmware image to the file system
> and add a sym link to the new firmware for doing an upgrade. Driver add
> a array of firmware file names to search for the available firmware blobs.
> This scheme also prepare the driver for future changes to API if ever
> happens. In such case it is assumed that driver needs to change to
> accommodate the new firmware and new firmware file name will get added to
> the array.
> 
> Also update the DT document to remove the firmware attribute and add
> description about firmware in the driver documentation.
> 
> Signed-off-by: Murali Karicheri <m-karicheri2@ti.com>
> 

Acked-by: Arnd Bergmann <arnd@arndb.de>

Looks good.
