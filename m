From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2 1/2] staging: iio: add driver for isl29028
Date: Thu, 12 Apr 2012 10:35:54 +0300
Message-ID: <20120412073554.GA6498@mwanda>
References: <1334214492-23044-1-git-send-email-ldewangan@nvidia.com>
 <1334214492-23044-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1334214492-23044-2-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, jbrenner-yYKgigLBUwlBDgjK7y7TUQ@public.gmane.org, rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, max-U9r9yeDMy7A@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 12, 2012 at 12:38:11PM +0530, Laxman Dewangan wrote:
> Intersil's ISL29028 is concurrent Ambient Light and
> Proximity Sensor device.
> Add driver to access the light and IR intensity and
> proximity value via iio interface.
> 
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Taken care of all review comment from Dan.

Looks nice.  You went above and beyond and cleaned up a couple
things I didn't mention.  Thanks.

regards,
dan carpenter
