From: Anton Vorontsov <cbouatmailru@gmail.com>
Subject: Re: [PATCH 2/5] power: sbs-battery: rename internals to new name
Date: Tue, 6 Dec 2011 05:20:12 +0400
Message-ID: <20111206012012.GA3065@oksana.dev.rtsoft.ru>
References: <1323129487-24859-1-git-send-email-rklein@nvidia.com>
 <1323129487-24859-2-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1323129487-24859-2-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 05, 2011 at 03:58:04PM -0800, Rhyland Klein wrote:
[...]
> -static const struct i2c_device_id bq20z75_id[] = {
> -	{ "bq20z75", 0 },
> +static const struct i2c_device_id sbs_id[] = {
> +	{ "sbs-battery", 0 },

You have to leave "bq20z75" here as is, and add "sbs-battery" as an
additional device id.

The reason is that older device trees might already have compatible
= "bq20z75", without specifying "sbs-battery".

Thanks!

-- 
Anton Vorontsov
Email: cbouatmailru@gmail.com
