From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] bcm2835: Add Broadcom BCM2835 RNG to the device tree
Date: Mon, 01 Apr 2013 20:38:44 -0600
Message-ID: <515A44B4.7070903@wwwdotorg.org>
References: <1364135511-26970-1-git-send-email-lkundrak@v3.sk> <1364451124-5039-1-git-send-email-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1364451124-5039-1-git-send-email-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On 03/28/2013 12:12 AM, Lubomir Rintel wrote:
> This adds a device tree binding for random number generator present on Broadcom
> BCM2835 SoC, used in Raspberry Pi and Roku 2 devices.

FYI, I intend to apply this patch to the bcm2835 tree whenever the RNG
driver itself is applied to the hw_random tree. If you could ping me
when that happens to jog my memory, that'd be great. Thanks.
