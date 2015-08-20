From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: [PATCH v3 0/3] nfc: Add driver for Samsung S3FWRN5 NFC Chip
Date: Thu, 20 Aug 2015 21:54:24 +0200
Message-ID: <20150820195424.GA3102@zurbaran.home>
References: <1440084362-27909-1-git-send-email-r.baldyga@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1440084362-27909-1-git-send-email-r.baldyga@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Baldyga <r.baldyga@samsung.com>
Cc: lauro.venancio@openbossa.org, aloisio.almeida@openbossa.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-nfc@lists.01.org, m.szyprowski@samsung.com, pebolle@tiscali.nl
List-Id: devicetree@vger.kernel.org

Hi Robert,

On Thu, Aug 20, 2015 at 05:25:59PM +0200, Robert Baldyga wrote:
> Hello,
> 
> This patchset adds driver for NFC chip Samsung S3FWRN5. First two patches
> are touching NCI core due to some non-standard chip behaviour.
> 
> The first one adds post_setup() handler, which is called after NCI_CORE_INIT
> request. It's because we need to read current firmware version from 
> ndev->manufact_specific_info.
> 
> The second one adds nci_core_reset() and nci_core_init() functions which
> are needed to reinit NCI core after updating firmware in pose_setup()
> callback.
> 
> Best regards,
> Robert Baldyga
> 
> Changelog:
> 
> v3:
> - Addressed comments from Samuel Ortiz:
>   - Used nci_prop_cmd and nci_prop_ops to handle proprietary requests
>   - Refactorized s3fwrn5_i2c_nci_read and s3fwrn5_i2c_fw_read
>   - Miscellaneous minor fixes
> - Added patch "NFC: nci: Add post_setup handler"
> - Added patch "NFC: nci: export nci_core_reset and nci_core_init"
> 
> v2: http://www.spinics.net/lists/linux-wireless/msg139241.html
> - Addressed comments from Paul Bolle
> 
> v1: http://www.spinics.net/lists/kernel/msg2044290.html
> 
> Robert Baldyga (3):
>   NFC: nci: Add post_setup handler
>   NFC: nci: export nci_core_reset and nci_core_init
>   nfc: s3fwrn5: Add driver for Samsung S3FWRN5 NFC Chip
All 3 patches applied, thanks.

Cheers,
Samuel.
