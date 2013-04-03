From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] bcm2835: Add Broadcom BCM2835 RNG to the device tree
Date: Wed, 03 Apr 2013 00:28:26 -0600
Message-ID: <515BCC0A.4020608@wwwdotorg.org>
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

Applied to bcm2835's for-3.10/dt tree, with some slight fixups to the
patch subject and description word-wrapping.
