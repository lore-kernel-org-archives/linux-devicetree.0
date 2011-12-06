From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH 1/5] drivers: power: Rename bq20z75 to sbs-battery
Date: Tue, 6 Dec 2011 17:41:00 +0000
Message-ID: <20111206174100.GA15449@srcf.ucam.org>
References: <1323129487-24859-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1323129487-24859-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Anton Vorontsov <cbouatmailru@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 05, 2011 at 03:58:03PM -0800, Rhyland Klein wrote:

> +config BATTERY_SBS
> +        tristate "SBS Compliant gas gauge"

This could potentially be confusing with the ACPI SBS code - I guess the 
long term ideal would be to merge them?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
