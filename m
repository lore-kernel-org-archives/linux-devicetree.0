From: Wolfgang Grandegger <wg@grandegger.com>
Subject: Re: [PATCH v3 1/3] ptp: Added a brand new class driver for ptp clocks.
Date: Mon, 17 May 2010 17:41:19 +0200
Message-ID: <4BF1639F.60900@grandegger.com>
References: <cover.1273855016.git.richard.cochran@omicron.at> <aa2a85799677c08001b152c2921d0e55d5693ffa.1273855017.git.richard.cochran@omicron.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <aa2a85799677c08001b152c2921d0e55d5693ffa.1273855017.git.richard.cochran@omicron.at>
Sender: netdev-owner@vger.kernel.org
To: Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 05/14/2010 06:45 PM, Richard Cochran wrote:
> This patch adds an infrastructure for hardware clocks that implement
> IEEE 1588, the Precision Time Protocol (PTP). A class driver offers a
> registration method to particular hardware clock drivers. Each clock is
> exposed to user space as a character device with ioctls that allow tuning
> of the PTP clock.
> 
> Signed-off-by: Richard Cochran <richard.cochran@omicron.at>

Tested-by: Wolfgang Grandegger <wg@denx.de>

on my Freescale MPC8313 setup with ptpd and ptpv2d.

Wolfgang.
