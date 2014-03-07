From: Kumar Gala <galak@codeaurora.org>
Subject: Re: [PATCH] of: add missing major vendors
Date: Fri, 7 Mar 2014 08:02:44 -0600
Message-ID: <09739E6B-1136-41CC-A2A8-41C77589CD56@codeaurora.org>
References: <1394195917-25166-1-git-send-email-florian.vaussard@epfl.ch>
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1394195917-25166-1-git-send-email-florian.vaussard@epfl.ch>
Sender: linux-doc-owner@vger.kernel.org
To: Florian Vaussard <florian.vaussard@epfl.ch>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Mar 7, 2014, at 6:38 AM, Florian Vaussard <florian.vaussard@epfl.ch> wrote:

> Looking at the current vendor strings used in the kernel's .dts/.dtsi
> files, some vendors are used a high number of times without
> being documented. Document the ones that are used more than 10 times.
> 
> Note: a few inconsistencies were found, and thus not documented.
> Here is the list:
> - mrvl: duplicates "marvell"
> - st-ericsson: duplicates "ste" _and_ "stericsson"
> - pci8086: seems to be a unfortunate alias for "intel"
> - pnpPNP: used on PowerPC?
> 
> Signed-off-by: Florian Vaussard <florian.vaussard@epfl.ch>
> ---
> Documentation/devicetree/bindings/vendor-prefixes.txt | 16 ++++++++++++++++
> 1 file changed, 16 insertions(+)

pnpPNP is from OpenFirmware days for ISA PNP bus bindings.

- k

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

