From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 2/5] driver core: Add device links support for pending
 links to suppliers
Date: Fri, 24 May 2019 07:48:09 +0200
Message-ID: <20190524054809.GA31664@kroah.com>
References: <20190524010117.225219-1-saravanak@google.com>
 <20190524010117.225219-3-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190524010117.225219-3-saravanak@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Saravana Kannan <saravanak@google.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@android.com
List-Id: devicetree@vger.kernel.org

On Thu, May 23, 2019 at 06:01:13PM -0700, Saravana Kannan wrote:
> When consumer devices are added, they might not have a supplier device
> to link to despite needing mandatory resources/functionality from one
> or more suppliers. Add a waiting_for_suppliers list to track such
> consumers and add helper functions to manage the list.
> 
> Marking/unmarking a consumer device as waiting for suppliers is
> generally expected to be done by the entity that's creating the
> device.
> 
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  drivers/base/core.c    | 67 ++++++++++++++++++++++++++++++++++++++++++
>  include/linux/device.h |  5 ++++
>  2 files changed, 72 insertions(+)

This looks fine to me, I'll let the dt people argue if the new entry is
valid or not :)

Feel free to add:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

to this if the dt people want to take it through their tree.  Or, I
guess I should really take it through mine...

thanks,

greg k-h
